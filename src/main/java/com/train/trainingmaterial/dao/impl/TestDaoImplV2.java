package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.document.LessonDocument;
import com.train.trainingmaterial.document.TestDocument;
import com.train.trainingmaterial.document.UserDocument;
import com.train.trainingmaterial.entity.AnswerEntity;
import com.train.trainingmaterial.entity.GroupEntity;
import com.train.trainingmaterial.entity.QuestionEntity;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.model.response.test.GetTestReportResponse;
import com.train.trainingmaterial.model.response.test.QuestionWithNoCorrectAnswer;
import com.train.trainingmaterial.model.response.test.TestForResponse;
import com.train.trainingmaterial.model.response.test.TestForResponseMongo;
import com.train.trainingmaterial.model.test.SelectedAnswerPerQuestion;
import com.train.trainingmaterial.model.test.Test;
import com.train.trainingmaterial.model.user.Lesson;
import com.train.trainingmaterial.repository.LessonRepositoryMongo;
import com.train.trainingmaterial.repository.TestRepositoryMongo;
import com.train.trainingmaterial.repository.UserGroupRepository;
import com.train.trainingmaterial.repository.UserRepositoryMongo;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.enums.PassingLevel;
import com.train.trainingmaterial.shared.enums.SpecialOrderNumber;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TestDaoImplV2 implements TestDao {
  private static final Logger log = LoggerFactory.getLogger(TestDaoImplV2.class);
  private final TestRepositoryMongo testRepositoryMongo;
  private final LessonRepositoryMongo lessonRepositoryMongo;
  private final UserRepositoryMongo userRepositoryMongo;
  private final UserGroupRepository userGroupRepository;
  private final MongoTemplate mongoTemplate;

  @Override
  public boolean addTest(
      Long lessonId, Long userId, String title, String rule, List<Question> questions) {
    return false;
  }

  @Override
  public boolean addTestByMongo(
      String lessonId,
      Long userId,
      String title,
      String description,
      List<com.train.trainingmaterial.model.test.Question> questions) {
    if (!this.checkValidUser(userId)) {
      throw new NullValueException("Student don't have enough authentication");
    }
    ObjectId objectId = new ObjectId(lessonId);
    if (!this.isLessonExist(objectId)) {
      throw new NullValueException("404 not found this lesson with id " + lessonId);
    }
    TestDocument test = this.saveTestToDatabase(title, description, questions);
    this.addTestIdToLesson(objectId, test);
    return true;
  }

  @Override
  public boolean modifyTest(
      Long testId,
      Long userId,
      String title,
      String rule,
      List<Long> deleteQuestions,
      ModifyQuestionDetails modifyQuestionDetails,
      List<Question> addQuestions) {
    return false;
  }

  @Override
  public boolean modifyTestByMongo(
      String testId,
      Long userId,
      String newTitle,
      String newDescription,
      List<com.train.trainingmaterial.model.test.Question> newQuestions) {
    if (!this.checkValidUser(userId)) {
      throw new NullValueException("this user do not have enough authentication");
    }
    TestDocument testDocument = this.findTestById(testId);
    this.modifyTestWithGivingFields(testDocument, newTitle, newDescription, newQuestions);
    return true;
  }

  @Override
  public List<Map.Entry<QuestionEntity, List<AnswerEntity>>> getTest(
      Long testId, Long userId, Long lessonId) {
    return List.of();
  }

  @Override
  public List<QuestionWithNoCorrectAnswer> getTestByMongo(
      String testId, Long userId, String lessonId) {
    UserDocument user = this.findUserHaveLearned(userId);
    TestDocument test = this.findTestById(testId);
    if (!this.isLearnTheLessonOfTheTest(lessonId, testId, user)) {
      throw new NullValueException("User has not learn the lesson of the test with id " + testId);
    }
    return this.takeQuestionsFromTest(test);
  }

  @Override
  public float submitTest(
      Long testId, Long lessonId, Long userId, List<Map<Long, Boolean>> answerIds) {
    return 0;
  }

  @Override
  public float submitTestByMongo(
      String testId,
      String lessonId,
      Long userId,
      List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions) {
    UserDocument user = this.findUserHaveLearned(userId);
    if (!this.isLearnTheLessonOfTheTest(lessonId, testId, user)) {
      throw new NullValueException("User has not learn the lesson of the test with id " + testId);
    }
    TestDocument test = this.findTestById(testId);
    if (!this.isDoneAllTheQuestion(test, selectedAnswerPerQuestions)) {
      throw new WrongValueException("User did not match all the question");
    }
    float score =
        this.calculateScore(
            this.getAvailableQuestionFrom(test.getQuestions()), selectedAnswerPerQuestions);
    this.updateScoreForUser(userId, lessonId, testId, score, selectedAnswerPerQuestions);
    return score;
  }

  @Override
  public List<TestForResponse> showDetailedResult(Long testId, Long lessonId, Long userId) {
    return List.of();
  }

  @Override
  public List<TestForResponseMongo> showDetailedResultMongo(
      String testId, Long userId, String lessonId) {
    UserDocument user = this.findUserHaveLearned(userId);
    if (!this.isLearnTheLessonOfTheTest(lessonId, testId, user)) {
      throw new WrongValueException("User did not learn the lesson of the test with id " + testId);
    }
    TestDocument test = this.findTestById(testId);
    List<Test> testsUserDidInLesson = this.takeAllTestsUserDidInLesson(user, testId, lessonId);
    return testsUserDidInLesson.stream()
        .map(
            t ->
                TestForResponseMongo.builder()
                    .title(test.getTitle())
                    .description(test.getDescription())
                    .score(t.getScore())
                    .passed(t.isPassed())
                    .questions(test.getQuestions())
                    .selectedAnswerPerQuestions(t.getSelectedAnswerPerQuestion())
                    .build())
        .toList();
  }

  @Override
  public GetTestReportResponse getTestReport(Long userId, Long testId, Long lessonId) {
    return null;
  }

  private boolean checkValidUser(Long userId) {
    List<GroupEntity> groupEntitiesOfUser = userGroupRepository.roleOf(userId);
    return groupEntitiesOfUser.size() == GroupID.ROLES_ID
        || groupEntitiesOfUser.getFirst().getId() == GroupID.TEACHER_ID;
  }

  private boolean isLessonExist(ObjectId lessonId) {
    return lessonRepositoryMongo.findById(lessonId).orElse(null) != null;
  }

  private TestDocument saveTestToDatabase(
      String title,
      String description,
      List<com.train.trainingmaterial.model.test.Question> questions) {
    TestDocument testDocument =
        TestDocument.builder().title(title).description(description).questions(questions).build();
    mongoTemplate.save(testDocument, "tm_test_mongodb");
    return testDocument;
  }

  private void addTestIdToLesson(ObjectId lessonId, TestDocument test) {
    Query query = new Query();
    query.addCriteria(Criteria.where("_id").is(lessonId));
    Update update = new Update();
    update.push("tests", test.getId().toString());
    mongoTemplate.updateFirst(query, update, "tm_lesson_mongodb");
  }

  private TestDocument findTestById(String testId) {
    ObjectId objectId = new ObjectId(testId);
    return testRepositoryMongo
        .findById(objectId)
        .orElseThrow(() -> new NullValueException("do not exist test with id " + testId));
  }

  private void modifyTestWithGivingFields(
      TestDocument testDocument,
      String newTitle,
      String newDescription,
      List<com.train.trainingmaterial.model.test.Question> newQuestions) {
    testDocument.setTitle(newTitle);
    testDocument.setDescription(newDescription);
    testDocument.setQuestions(newQuestions);
    mongoTemplate.save(testDocument);
  }

  private UserDocument findUserHaveLearned(Long userId) {
    return userRepositoryMongo
        .findLearnedUserById(userId)
        .orElseThrow(() -> new NullValueException("User has not learned!!!"));
  }

  private boolean isLearnTheLessonOfTheTest(String lessonId, String testId, UserDocument user) {
    LessonDocument lesson = this.findLessonById(lessonId);
    List<String> lessonIdOfUserLesson =
        user.getLessons().stream().map(l -> l.getLessonId()).toList();
    return lessonIdOfUserLesson.contains(lessonId) && lesson.getTestIds().contains(testId);
  }

  private LessonDocument findLessonById(String lessonId) {
    ObjectId objectId = new ObjectId(lessonId);
    return lessonRepositoryMongo
        .findById(objectId)
        .orElseThrow(() -> new NullValueException("404 not found lesson with id " + lessonId));
  }

  private List<QuestionWithNoCorrectAnswer> takeQuestionsFromTest(TestDocument test) {
    return test.getQuestions().stream()
        .filter(
            question ->
                question.getOrderNumber() != SpecialOrderNumber.DELETED_ORDER_NUMBER.getNumber())
        .map(
            question -> {
              List<String> answers =
                  question.getAnswers().stream()
                      .filter(
                          ans ->
                              ans.getOrderNumber()
                                  != SpecialOrderNumber.DELETED_ORDER_NUMBER.getNumber())
                      .map(ans -> ans.getDescription())
                      .toList();
              return QuestionWithNoCorrectAnswer.builder()
                  .question(question.getDescription())
                  .questionType(question.getType())
                  .answers(answers)
                  .build();
            })
        .toList();
  }

  private boolean isDoneAllTheQuestion(
      TestDocument test, List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions) {
    return test.getQuestions().size() == selectedAnswerPerQuestions.size();
  }

  private float calculateScore(
      List<com.train.trainingmaterial.model.test.Question> questionWithCorrectAns,
      List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions) {
    int trueQuestion = 0;
    List<SelectedAnswerPerQuestion> trueAnswerPerQuestion =
        questionWithCorrectAns.stream()
            .map(
                q -> {
                  List<Long> trueAnswers =
                      q.getAnswers().stream()
                          .filter(ans -> ans.isCorrect() == true)
                          .map(ans -> ans.getOrderNumber())
                          .toList();
                  return SelectedAnswerPerQuestion.builder()
                      .orderNumberOfQuestion(q.getOrderNumber())
                      .orderNumberOfAnswers(trueAnswers)
                      .build();
                })
            .sorted(Comparator.comparing(SelectedAnswerPerQuestion::getOrderNumberOfQuestion))
            .toList();
    selectedAnswerPerQuestions.sort(
        Comparator.comparing(SelectedAnswerPerQuestion::getOrderNumberOfQuestion));
    for (SelectedAnswerPerQuestion answerPerQuestion : selectedAnswerPerQuestions) {
      List<Long> chooseAns = answerPerQuestion.getOrderNumberOfAnswers();
      Collections.sort(chooseAns);
      List<Long> trueAns =
          trueAnswerPerQuestion
              .get(selectedAnswerPerQuestions.indexOf(answerPerQuestion))
              .getOrderNumberOfAnswers()
              .stream()
              .sorted()
              .toList();
      if (chooseAns.equals(trueAns)) {
        trueQuestion++;
      }
    }
    return trueQuestion * (10.0f / questionWithCorrectAns.size());
  }

  List<com.train.trainingmaterial.model.test.Question> getAvailableQuestionFrom(
      List<com.train.trainingmaterial.model.test.Question> questions) {
    return questions.stream()
        .filter(q -> q.getOrderNumber() != SpecialOrderNumber.DELETED_ORDER_NUMBER.getNumber())
        .toList();
  }

  private void updateScoreForUser(
      Long userId,
      String lessonId,
      String testId,
      float score,
      List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions) {
    Query query = new Query();
    query.addCriteria(Criteria.where("user_id").is(userId).and("lessons.lesson_id").is(lessonId));
    Update update = new Update();
    update.push(
        "lessons.$.tests",
        Test.builder()
            .testId(testId)
            .score(score)
            .passed(score >= PassingLevel.PASSED_LEVEL.getScoreLevel())
            .selectedAnswerPerQuestion(selectedAnswerPerQuestions)
            .build());
    mongoTemplate.updateFirst(query, update, "tm_user_mongodb");
  }

  private List<Test> takeAllTestsUserDidInLesson(
      UserDocument user, String testId, String lessonId) {
    List<Lesson> lessons =
        user.getLessons().stream().filter(l -> l.getLessonId().equals(lessonId)).toList();
    return lessons.getFirst().getTests().stream()
        .filter(t -> t.getTestId().equals(testId))
        .toList();
  }
}
