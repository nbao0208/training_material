package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.RatingDao;
import com.train.trainingmaterial.entity.*;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.constants.ErrorMessage;
import com.train.trainingmaterial.shared.constants.MessageResponseForRating;
import com.train.trainingmaterial.shared.enums.ErrorCodes;
import com.train.trainingmaterial.shared.enums.LessonStatus;
import com.train.trainingmaterial.shared.enums.RatingLevel;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class RatingDaoImpl implements RatingDao {
  private final RatingRepository ratingRepository;
  private final CommentTemplateRepository commentTemplateRepository;
  private final UserLessonRepository userLessonRepository;
  private final CommentRatingRepository commentRatingRepository;
  private final UserOptionalCommentRepository userOptionalCommentRepository;
  private final LessonCommentRatingRepository lessonCommentRatingRepository;
  private final LessonRepository lessonRepository;

  @Override
  public List<Integer> getAllRatingLevel() {
    return ratingRepository.getAllRatingLevel();
  }

  @Override
  public List<String> getAllCommentTemplate(Long ratingId) {
    return commentTemplateRepository.getAllComment(ratingId);
  }

  @Override
  public String doRating(
      Long userId,
      Long lessonId,
      Long ratingId,
      List<Long> commentTemplateId,
      String optionalComment) {
    UserLessonEntity userLesson = findUserCompleteLesson(userId, lessonId);
    List<CommentRatingEntity> commentRatingEntities =
        this.saveUserLessonRating(userLesson, commentTemplateId);
    this.saveUserOptionalComment(commentRatingEntities, optionalComment);
    this.saveLessonCommentRating(commentRatingEntities, lessonId);
    return this.responseMessageWithRateLevel(ratingId);
  }

  private UserLessonEntity findUserCompleteLesson(Long userId, Long lessonId) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException(ErrorMessage.DONT_HAVE_ENOUGH_PERMISSIONS,ErrorCodes.PERMISSION_DENIED));
    if (!this.isCompleteTheLesson(userLesson)) {
      throw new WrongValueException(ErrorMessage.DONT_HAVE_ENOUGH_PERMISSIONS, ErrorCodes.PERMISSION_DENIED);
    }
    return userLesson;
  }

  private boolean isCompleteTheLesson(UserLessonEntity userLesson) {
    return userLesson.getReportEntity().getId() == LessonStatus.DONE.getStatusId();
  }

  private String responseMessageWithRateLevel(Long ratingId) {
    RatingEntity ratingEntity =
        ratingRepository
            .findById(ratingId)
            .orElseThrow(() -> new NullValueException(ErrorMessage.NOT_FOUND,ErrorCodes.NOT_FOUND_ERROR));
    if (ratingEntity.getLevel() <= RatingLevel.THREE.getLevel()) {
      return MessageResponseForRating.UNDER_THIRD_LEVEL_MESSAGE;
    }
    return MessageResponseForRating.UPPER_FOURTH_LEVEL_MESSAGE;
  }

  private List<CommentRatingEntity> saveUserLessonRating(
      UserLessonEntity userLesson, List<Long> commentTemplateId) {
    List<CommentTemplateEntity> commentTemplateEntities =
        commentTemplateRepository.findAllCommentTemplateByListOfId(commentTemplateId);
    List<CommentRatingEntity> commentRatingEntities =
        commentTemplateEntities.stream()
            .map(
                cm ->
                    CommentRatingEntity.builder()
                        .commentTemplateEntity(cm)
                        .userLessonEntity(userLesson)
                        .build())
            .toList();
    commentRatingRepository.saveAll(commentRatingEntities);
    return commentRatingEntities;
  }

  private void saveUserOptionalComment(
      List<CommentRatingEntity> commentRatingEntities, String optionalComment) {
    if (optionalComment != null) {
      List<UserOptionalCommentEntity> userOptionalComment =
          commentRatingEntities.stream()
              .map(
                  ct ->
                      UserOptionalCommentEntity.builder()
                          .commentRatingEntity(ct)
                          .comment(optionalComment)
                          .build())
              .toList();
      userOptionalCommentRepository.saveAll(userOptionalComment);
    }
  }

  private void saveLessonCommentRating(
      List<CommentRatingEntity> commentRatingEntities, Long lessonId) {
    LessonEntity lessonEntity =
        lessonRepository
            .findById(lessonId)
            .orElseThrow(() -> new NullValueException(ErrorMessage.NOT_FOUND,ErrorCodes.NOT_FOUND_ERROR));
    List<LessonCommentRatingEntity> lessonCommentRating =
        commentRatingEntities.stream()
            .map(
                ct ->
                    LessonCommentRatingEntity.builder()
                        .lessonEntity(lessonEntity)
                        .commentRatingEntity(ct)
                        .build())
            .toList();
    lessonCommentRatingRepository.saveAll(lessonCommentRating);
  }
}
