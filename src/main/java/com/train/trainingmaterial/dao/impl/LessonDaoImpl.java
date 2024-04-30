package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.entity.*;
import com.train.trainingmaterial.model.response.lesson.GetLessonReportResponse;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.enums.LessonStatus;
import com.train.trainingmaterial.shared.enums.RankingValue;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.time.Duration;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Data
@Slf4j
public class LessonDaoImpl implements LessonDao {
  private final LessonRepository lessonRepository;
  private final UserLessonRepository userLessonRepository;
  private final UserRepository userRepository;
  private final ReportRepository reportRepository;
  private final CategoryRepository categoryRepository;
  private final UserGroupRepository userGroupRepository;
  private final TagRepository tagRepository;
  private final LessonTagRepository lessonTagRepository;
  private final CommentRatingRepository commentRatingRepository;
  private final UserOptionalCommentRepository userOptionalCommentRepository;
  private final CommentTemplateRepository commentTemplateRepository;
  private final RatingRepository ratingRepository;

  @Override
  public LessonEntity getLesson(Long lessonId, Long userId) {
    UserLessonEntity userLesson =
        userLessonRepository.findByLessonIdAndUserId(lessonId, userId).orElse(null);
    if (userLesson == null) {
      UserEntity userEntity = this.findUserByUserId(userId);
      LessonEntity lessonEntity = this.findLessonByLessonId(lessonId);
      userLesson = this.generateFrom(userEntity, lessonEntity);
      userLessonRepository.save(userLesson);
      return lessonEntity;
    }
    userLesson.setView(userLesson.getView() + 1);
    userLessonRepository.save(userLesson);
    return lessonRepository
        .findById(lessonId)
        .orElseThrow(() -> new NullValueException("Don't find any lesson with id " + lessonId));
  }

  @Override
  public boolean cancelLesson(Long lessonId, Long userId) {
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLessonRepository.save(userLesson);
    return true;
  }

  @Override
  public String evaluateLesson(Long lessonId, Long userId, int evaluation) {
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLesson.setEvaluation(evaluation);
    userLessonRepository.save(userLesson);
    return this.rankingFeedback(evaluation);
  }

  @Override
  public boolean completeLesson(Long userId, Long lessonId) {
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLesson.setReportEntity(
        reportRepository.findById(LessonStatus.DONE.getStatusId()).orElse(null));
    userLessonRepository.save(userLesson);
    return true;
  }

  @Override
  public boolean createLesson(
      Long userId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      int timeRemaining) {
    if (!this.isValidToTakeAction(userId)) {
      throw new WrongValueException("This user can't have enough level to create lesson");
    }
    CategoryEntity categoryEntity =
        categoryRepository
            .findById(categoryId)
            .orElseThrow(() -> new NullValueException("404 not found this category"));
    this.saveLessonToDB(categoryEntity, tagId, contentLink, title, intro, timeRemaining);
    return true;
  }

  @Override
  public boolean updateLesson(
      Long lessonId,
      Long userId,
      Long categoryId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining) {
    if (!this.isValidToTakeAction(userId)) {
      throw new NullValueException("404 not found");
    }
    this.updateLessonToDb(lessonId, categoryId, contentLink, title, intro, timeRemaining);
    return true;
  }

  @Override
  public GetLessonReportResponse getLessonReport(Long userId, Long lessonId) {
    UserLessonEntity userLesson = this.findUserLessonByUserAndLessonId(userId, lessonId);
    List<CommentRatingEntity> commentRating =
        this.findCommentRatingByUserLessonId(userLesson.getId());
    CommentRatingEntity firstCommentRating = commentRating.getFirst();
    List<Long> commentTemplateId =
        commentRating.stream().map(cr -> cr.getCommentTemplateEntity().getId()).toList();
    if (this.hasRated(commentRating)) {
      return GetLessonReportResponse.builder()
          .view(userLesson.getView())
          .timeReading(userLesson.getTimeReading())
          .ratingLevel(
              this.findRatingLevelByCommentTemplateId(
                  firstCommentRating.getCommentTemplateEntity().getId()))
          .templateComments(this.findCommentTemplateByListOfId(commentTemplateId))
          .optionalComment(this.findOptionalComment(firstCommentRating.getId()))
          .build();
    }
    return GetLessonReportResponse.builder()
        .view(userLesson.getView())
        .timeReading(userLesson.getTimeReading())
        .build();
  }

  private String rankingFeedback(int evaluation) {
    if (evaluation <= 0 || evaluation > RankingValue.FIVE_STARTS.getStar()) {
      throw new WrongValueException("Error value of evaluation");
    }
    if (evaluation <= RankingValue.TWO_STARS.getStar()) {
      return "We will get better next time";
    } else if (evaluation == RankingValue.THREE_STARS.getStar()) {
      return "Thanks for your response";
    } else if (evaluation == RankingValue.FOUR_STARS.getStar()) {
      return "Really appreciate with your response";
    }
    return "Big thanks for you sir/ma am";
  }

  private LocalTime timeBetween(OffsetDateTime first, OffsetDateTime end) {
    Duration duration = Duration.between(first, end);
    return LocalTime.of(
        (int) duration.toHours(),
        (int) (duration.toMinutes() % 60),
        (int) (duration.getSeconds() % 60));
  }

  private UserLessonEntity generateFrom(UserEntity userEntity, LessonEntity lessonEntity) {
    return UserLessonEntity.builder()
        .userEntity(userEntity)
        .lessonEntity(lessonEntity)
        .view(1)
        .timeReading(LocalTime.of(0, 0))
        .reportEntity(reportRepository.findById(LessonStatus.DOING.getStatusId()).orElse(null))
        .build();
  }

  private UserLessonEntity trackingStatusForUser(Long userId, Long lessonId) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException("OOps not found @@"));
    LocalTime timeLearning = this.timeBetween(userLesson.getModified(), OffsetDateTime.now());
    userLesson.setTimeReading(
        userLesson
            .getTimeReading()
            .plusHours(timeLearning.getHour())
            .plusMinutes(timeLearning.getMinute())
            .plusSeconds(timeLearning.getSecond()));
    return userLesson;
  }

  private UserEntity findUserByUserId(Long userId) {
    return userRepository
        .findById(userId)
        .orElseThrow(() -> new NullValueException("Don't find any user with id " + userId));
  }

  private LessonEntity findLessonByLessonId(Long lessonId) {
    return lessonRepository
        .findById(lessonId)
        .orElseThrow(() -> new NullValueException("Don't find any lesson with id " + lessonId));
  }

  private UserLessonEntity findUserLessonByUserAndLessonId(Long userId, Long lessonId) {
    return userLessonRepository
        .findByLessonIdAndUserId(lessonId, userId)
        .orElseThrow(() -> new NullValueException("this user have not learnt before"));
  }

  private List<CommentRatingEntity> findCommentRatingByUserLessonId(Long userLessonId) {
    return commentRatingRepository.findByUserLessonId(userLessonId);
  }

  private boolean isValidToTakeAction(Long userId) {
    GroupEntity groupEntity =
        userGroupRepository
            .roleOf(userId)
            .orElseThrow(() -> new NullValueException("404 not found"));
    return groupEntity.getId() == GroupID.TEACHER_ID;
  }

  private void saveLessonToDB(
      CategoryEntity categoryEntity,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      int timeRemaining) {
    LessonEntity lesson =
        LessonEntity.builder()
            .categoryEntity(categoryEntity)
            .contentLink(contentLink)
            .title(title)
            .intro(intro)
            .timeRemaining(timeRemaining)
            .build();
    lessonRepository.save(lesson);
    this.saveLessonTagToDB(tagId, lesson);
  }

  private void updateLessonToDb(
      Long lessonId,
      Long categoryId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining) {
    if (timeRemaining != null && timeRemaining < 0) {
      throw new WrongValueException("time remaining can't be negative");
    }
    LessonEntity lessonEntity =
        lessonRepository
            .findById(lessonId)
            .orElseThrow(() -> new NullValueException("404 not found"));
    if (categoryId != null) {
      CategoryEntity categoryEntity =
          categoryRepository
              .findById(categoryId)
              .orElseThrow(() -> new NullValueException("404 not found"));
      lessonEntity.setCategoryEntity(categoryEntity);
    }
    if (contentLink != null) {
      lessonEntity.setContentLink(contentLink);
    }
    if (title != null) {
      lessonEntity.setTitle(title);
    }
    if (intro != null) {
      lessonEntity.setIntro(intro);
    }
    if (this.isTimeValid(timeRemaining)) {
      lessonEntity.setTimeRemaining(timeRemaining);
    }
    lessonRepository.save(lessonEntity);
  }

  private boolean isTimeValid(Integer time) {
    return time != null && time >= 0;
  }

  private void saveLessonTagToDB(List<Long> tagId, LessonEntity lesson) {
    List<TagEntity> tagEntities = tagRepository.findByListOfId(tagId);
    List<LessonTagEntity> lessonTagEntities =
        tagEntities.stream()
            .map(tag -> LessonTagEntity.builder().tagEntity(tag).lessonEntity(lesson).build())
            .toList();
    lessonTagRepository.saveAll(lessonTagEntities);
  }

  private boolean hasRated(List<CommentRatingEntity> commentRating) {
    return !commentRating.isEmpty();
  }

  private String findOptionalComment(Long commentRatingId) {
    return userOptionalCommentRepository.findOptionalCommentByCommentRatingId(commentRatingId);
  }

  private Integer findRatingLevelByCommentTemplateId(Long commentTemplateId) {
    Long ratingId = commentTemplateRepository.findRatingIdById(commentTemplateId);
    RatingEntity ratingEntity =
        ratingRepository
            .findById(ratingId)
            .orElseThrow(() -> new NullValueException("404 not found"));
    return ratingEntity.getLevel();
  }

  private List<String> findCommentTemplateByListOfId(List<Long> commentTemplateId) {
    return commentTemplateRepository.findCommentTemplateByListOfId(commentTemplateId);
  }
}
