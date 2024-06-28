package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.document.LessonDocument;
import com.train.trainingmaterial.document.UserDocument;
import com.train.trainingmaterial.entity.GroupEntity;
import com.train.trainingmaterial.entity.TagEntity;
import com.train.trainingmaterial.model.response.lesson.GetLessonReportResponse;
import com.train.trainingmaterial.model.response.lesson.LessonDetailResponse;
import com.train.trainingmaterial.model.test.Test;
import com.train.trainingmaterial.model.user.Lesson;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.enums.LessonStatus;
import com.train.trainingmaterial.shared.enums.PassingLevel;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.time.Duration;
import java.time.LocalTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository
@Data
@AllArgsConstructor
@Slf4j
public class LessonDaoImplV2 implements LessonDao {
  private final LessonRepositoryMongo lessonRepositoryMongo;
  private final UserGroupRepository userGroupRepository;
  private final UserRepositoryMongo userRepositoryMongodb;
  private final UserRepository userRepository;
  private final TagRepository tagRepository;
  private final CategoryRepository categoryRepository;
  private final MongoTemplate mongoTemplate;

  @Override
  public <T> LessonDetailResponse getLesson(T lessonId, Long userId) {
    if (!this.isUserExists(userId)) {
      throw new NullValueException("User does not exist");
    }
    log.info(lessonId.toString());
    LessonDocument lesson = this.findLessonById((String) lessonId);
    this.updateInformationWhenGetLesson(userId, (String) lessonId);
    return LessonDetailResponse.builder()
        .title(lesson.getTitle())
        .intro(lesson.getIntro())
        .contentLink(lesson.getContentLink())
        .timeRemaining(lesson.getTimeRemaining())
        .build();
  }

  @Override
  public <T> boolean cancelLesson(T lessonId, Long userId) {
    UserDocument userLesson = this.findUserLessonByUserIdAndLessonId(userId, (String) lessonId);
    log.info(userLesson.toString());
    int learnedLesson = this.lessonLearned(userLesson, (String) lessonId);
    List<Lesson> lessons = userLesson.getLessons();
    this.trackingTimeLearning(
        userId,
        (String) lessonId,
        this.calculateTimeLearning(
            lessons.get(learnedLesson).getTimeLearning(),
            this.timeBetween(userLesson.getModified().toLocalTime(), LocalTime.now())));
    return true;
  }

  @Override
  public String evaluateLesson(Long lessonId, Long userId, int evaluation) {
    return "";
  }

  @Override
  public boolean completeLesson(Long userId, Long lessonId) {
    return false;
  }

  @Override
  public boolean completeLessonMongo(Long userId, String lessonId) {
    UserDocument user = this.findUserById(userId);
    LessonDocument lesson = this.findLessonById(lessonId);
    try {
      if (!this.isDoneEnoughTestInLesson(user, lesson, lessonId)) {
        throw new WrongValueException(
            "this user has not done enough test of the lesson with id " + lessonId);
      }

      if (!this.isHaveEnoughQualificationOfEachTest(user, lessonId)) {
        throw new WrongValueException("User have some tests are not qualified to pass the lesson");
      }
    } catch (NullPointerException e) {
      throw new NullPointerException("404 not found available");
    }
    this.updateStatusOfLessonForUser(userId, lessonId);
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
    if (!isValidToTakeAction(userId)) {
      return false;
    }
    LessonDocument lessonDocument =
        LessonDocument.builder()
            .categoryId(categoryId)
            .tagIds(tagId)
            .contentLink(contentLink)
            .title(title)
            .intro(intro)
            .timeRemaining(timeRemaining)
            .build();
    lessonRepositoryMongo.save(lessonDocument);
    return true;
  }

  @Override
  public <T> boolean updateLesson(
      T lessonId,
      Long userId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining) {
    if (!this.isValidToTakeAction(userId)) {
      throw new WrongValueException("This user does not have enough authentication");
    }
    this.updateLessonToDB(
        (String) lessonId, categoryId, tagId, contentLink, title, intro, timeRemaining);
    return true;
  }

  @Override
  public GetLessonReportResponse getLessonReport(Long userId, Long lessonId) {
    return null;
  }

  private boolean isValidToTakeAction(Long userId) {
    List<GroupEntity> groupEntitiesOfUser = userGroupRepository.roleOf(userId);
    return groupEntitiesOfUser.size() == GroupID.ROLES_ID
        || groupEntitiesOfUser.getFirst().getId() == GroupID.TEACHER_ID;
  }

  private LessonDocument findLessonById(String lessonId) {
    ObjectId lessonObjectId = new ObjectId(lessonId);
    return lessonRepositoryMongo
        .findById(lessonObjectId)
        .orElseThrow(() -> new NullValueException("404 not found"));
  }

  private UserDocument findUserById(Long userId) {
    return userRepositoryMongodb.findLearnedUserById(userId).orElse(null);
  }

  private int lessonLearned(UserDocument userDocument, String lessonId) {
    for (Lesson userLesson : userDocument.getLessons()) {
      if (userLesson.getLessonId().equals(lessonId)) {
        return userDocument.getLessons().indexOf(userLesson);
      }
    }
    return -1;
  }

  private void updateInformationWhenGetLesson(Long userId, String lessonId) {
    UserDocument userLesson = this.findUserById(userId);
    if (userLesson == null) {
      userLesson =
          UserDocument.builder()
              .userId(userId)
              .lessons(
                  List.of(
                      Lesson.builder()
                          .lessonId(lessonId)
                          .reportId(LessonStatus.DOING.getStatusId())
                          .views(1)
                          .timeLearning(LocalTime.of(0, 0, 0))
                          .tests(List.of())
                          .build()))
              .build();
      userRepositoryMongodb.insert(userLesson);
    } else {
      if (this.lessonLearned(userLesson, lessonId) == -1) {
        Lesson lesson =
            Lesson.builder()
                .lessonId(lessonId)
                .reportId(LessonStatus.DOING.getStatusId())
                .views(1)
                .timeLearning(LocalTime.of(0, 0, 0))
                .tests(List.of())
                .build();
        this.addNewLesson(userId, lesson);
      } else {
        this.updateViewsWhenGetLesson(userId, lessonId);
      }
    }
    log.info("Created: " + userLesson.getModified());
    log.info("Modified: " + userLesson.getCreated());
  }

  private boolean isUserExists(Long userId) {
    return userRepository.findById(userId).orElse(null) != null;
  }

  private UserDocument findUserLessonByUserIdAndLessonId(Long userId, String lessonId) {
    return userRepositoryMongodb
        .findLearnedUserLearnExactQuestionBy(userId, lessonId)
        .orElseThrow(() -> new NullValueException("You didn't learn this lesson before"));
  }

  private LocalTime timeBetween(LocalTime startTime, LocalTime endTime) {
    Duration duration = Duration.between(startTime, endTime);
    return LocalTime.of(
        (int) duration.toHours(), (int) duration.toMinutes() % 60, (int) duration.toSeconds() % 60);
  }

  private void addNewLesson(Long userId, Lesson lesson) {
    Query query = new Query();
    query.addCriteria(Criteria.where("user_id").is(userId));
    Update update = new Update();
    update.push("lessons", lesson);
    mongoTemplate.updateFirst(query, update, "tm_user_mongodb");
  }

  private void updateViewsWhenGetLesson(Long userId, String lessonId) {
    Query query = new Query();
    query.addCriteria(
        Criteria.where("user_id")
            .is(userId)
            .and("lessons")
            .elemMatch(Criteria.where("lessonId").is(lessonId)));
    Update update = new Update();
    update.inc("lessons.$.views", 1);
    mongoTemplate.updateFirst(query, update, "tm_user_mongodb");
  }

  private void trackingTimeLearning(Long userId, String lessonId, LocalTime timeLearning) {
    Query query = new Query();
    query.addCriteria(
        Criteria.where("user_id")
            .is(userId)
            .and("lessons")
            .elemMatch(Criteria.where("lessonId").is(lessonId)));
    Update update = new Update();
    update.set("lessons.$.timeLearning", timeLearning);
    mongoTemplate.updateFirst(query, update, "tm_user_mongodb");
  }

  private LocalTime calculateTimeLearning(LocalTime startTime, LocalTime plusTime) {
    startTime =
        startTime
            .plusHours(plusTime.getHour())
            .plusMinutes(plusTime.getMinute())
            .plusSeconds(plusTime.getSecond());
    return startTime;
  }

  private void updateLessonToDB(
      String lessonId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining) {
    LessonDocument lesson = this.findLessonById(lessonId);
    if (categoryRepository.findById(categoryId).orElse(null) != null) {
      lesson.setCategoryId(categoryId);
    }
    List<TagEntity> tags = tagRepository.findAllById(tagId);
    if (!tags.isEmpty() && tags.size() == tagId.size()) {
      lesson.setTagIds(tagId);
    }
    if (contentLink != null) {
      lesson.setContentLink(contentLink);
    }
    if (title != null) {
      lesson.setTitle(title);
    }
    if (intro != null) {
      lesson.setIntro(intro);
    }
    if (timeRemaining != null) {
      lesson.setTimeRemaining(timeRemaining);
    }
    mongoTemplate.save(lesson, "tm_lesson_mongodb");
  }

  private boolean isDoneEnoughTestInLesson(
      UserDocument user, LessonDocument lesson, String lessonId) throws NullPointerException {
    List<String> testUserHaveDone =
        user.getLessons().stream()
            .filter(l -> l.getLessonId().equals(lessonId))
            .toList()
            .getFirst()
            .getTests()
            .stream()
            .map(t -> t.getTestId())
            .toList();
    List<String> testInLesson = lesson.getTestIds();
    testInLesson.retainAll(testUserHaveDone);
    return testInLesson.size() == lesson.getTestIds().size();
  }

  private boolean isHaveEnoughQualificationOfEachTest(UserDocument user, String lessonId) {
    List<Test> tests =
        user.getLessons().stream()
            .filter(l -> l.getLessonId().equals(lessonId))
            .toList()
            .getFirst()
            .getTests();
    List<Test> qualifiedTest =
        tests.stream()
            .filter(t -> t.getScore() >= PassingLevel.PASSED_LEVEL.getScoreLevel())
            .toList();
    return tests.size() == qualifiedTest.size();
  }

  private void updateStatusOfLessonForUser(Long userId, String lessonId) {
    Query query =
        new Query()
            .addCriteria(
                Criteria.where("user_id").is(userId).and("lessons.lesson_id").is(lessonId));
    Update update = new Update().set("lessons.$.report_id", LessonStatus.DONE.getStatusId());
    mongoTemplate.updateFirst(query, update, "tm_user_mongodb");
  }
}
