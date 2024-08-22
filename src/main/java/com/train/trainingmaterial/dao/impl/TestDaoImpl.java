package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.entity.*;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.model.test.SelectedAnswerPerQuestion;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.enums.PassingLevel;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.time.OffsetDateTime;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Slf4j
public class TestDaoImpl implements TestDao {
  private final TestRepository testRepository;
  private final UserGroupRepository userGroupRepository;
  private final LessonRepository lessonRepository;
  private final QuestionRepository questionRepository;
  private final AnswerRepository answerRepository;
  private final UserLessonRepository userLessonRepository;
  private final UserTestRepository userTestRepository;
  private final UserAnswerRepository userAnswerRepository;
  private final UserRepository userRepository;

  @Override
  public boolean addTest(
      Long lessonId, Long userId, String title, String rule, List<Question> questions) {
    if (!this.checkValidUser(userId)) {
      return false;
    }
    LessonEntity lessonEntity =
        lessonRepository
            .findById(lessonId)
            .orElseThrow(() -> new NullValueException("Lesson with id " + lessonId + " not found"));
    TestEntity testEntity =
        TestEntity.builder().lessonEntity(lessonEntity).title(title).rule(rule).build();
    testRepository.save(testEntity);
    this.addQuestion(questions, testEntity);
    return true;
  }

  @Override
  public boolean addTestByMongo(
      String lessonId,
      Long userId,
      String title,
      String description,
      List<com.train.trainingmaterial.model.test.Question> questions) {
    return false;
  }

  @Override
  public boolean modifyTest(
      Long testId,
      Long userId,
      String title,
      String rule,
      List<Long> deleteQuestionId,
      ModifyQuestionDetails modifyQuestionDetails,
      List<Question> addQuestions) {

    log.info("=======> deleteQuestionId: " + deleteQuestionId.toString());
    if (!this.checkValidUser(userId)) {
      return false;
    }
    TestEntity test =
        testRepository.findById(testId).orElseThrow(() -> new NullValueException("404 not found"));
    this.saveDefaultFieldOf(test, title, rule);
    if (!deleteQuestionId.isEmpty()) {
      questionRepository.deleteByListOfId(deleteQuestionId);
      answerRepository.deleteAllByListOfQuestionId(deleteQuestionId);
    }

    if (modifyQuestionDetails != null) {
      this.modifyQuestion(modifyQuestionDetails);
    }

    if (!addQuestions.isEmpty()) {
      this.addQuestion(addQuestions, test);
    }
    return true;
  }

  @Override
  public boolean modifyTestByMongo(
      String testId,
      Long userId,
      String newTitle,
      String newDescription,
      List<com.train.trainingmaterial.model.test.Question> newQuestions) {
    return false;
  }

  @Override
  public List<Map.Entry<QuestionEntity, List<AnswerEntity>>> getTest(
      Long testId, Long userId, Long lessonId) {
    if (!this.isExist(lessonId, userId)) {
      throw new NullValueException("This user has not learnt before");
    }
    List<QuestionEntity> questions = questionRepository.findByTestId(testId);
    if (questions.isEmpty()) {
      throw new NullValueException("404 not found");
    }
    List<Map.Entry<QuestionEntity, List<AnswerEntity>>> result = new ArrayList<>();
    for (QuestionEntity question : questions) {
      List<AnswerEntity> answers = answerRepository.findByQuestionId(question.getId());
      result.add(new AbstractMap.SimpleEntry<>(question, answers));
    }
    return result;
  }

  @Override
  public List<QuestionWithNoCorrectAnswer> getTestByMongo(
      String testId, Long userId, String lessonId) {
    return List.of();
  }

  @Override
  public float submitTest(
      Long testId, Long lessonId, Long userId, List<Map<Long, Boolean>> answerIds) {
    for (Map<Long, Boolean> answerId : answerIds) {
      if (this.isQuestionEmpty(answerId)) {
        throw new NullValueException("It is not enough questions, please answers all questions");
      }
    }
    List<Long> userAnswers = new ArrayList<>();
    float score = this.calculateScore(answerIds, userAnswers);
    UserTestEntity userTest = this.saveUserTest(lessonId, userId, testId, score);
    this.saveUserAnswer(userAnswers, userTest);
    return score;
  }

  @Override
  public float submitTestByMongo(
      String testId,
      String lessonId,
      Long userId,
      List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions) {
    return 0;
  }

  @Override
  public List<TestForResponse> showDetailedResult(Long testId, Long lessonId, Long userId) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException("404 not found"));
    List<UserTestEntity> userTests =
        this.findUserTestByUserLessonAndTestId(userLesson.getId(), testId);
    if (userTests.isEmpty()) {
      throw new NullValueException("You had not do the test");
    }
    List<QuestionEntity> questions = questionRepository.findByTestId(testId);
    List<List<AnswerEntity>> answersOfAllQuestions =
        questions.stream()
            .map(question -> answerRepository.findByQuestionId(question.getId()))
            .toList();
    return this.takeTestForResponse(userTests, questions, answersOfAllQuestions);
  }

  @Override
  public List<TestForResponseMongo> showDetailedResultMongo(
      String testId, Long userId, String lessonId) {
    return List.of();
  }

  @Override
  public GetTestReportResponse getTestReport(Long userId, Long testId, Long lessonId) {
    UserLessonEntity userLesson = this.findUserLessonByUserAndLessonId(userId, lessonId);
    List<UserTestEntity> userTest =
        this.findUserTestByUserLessonAndTestId(userLesson.getId(), testId);
    if (!this.isDoneTest(userTest)) {
      throw new WrongValueException("user has not done any test before");
    }
    List<QuestionEntity> questionEntities = questionRepository.findByTestId(testId);
    int questions = questionEntities.size();
    List<Integer> trueQuestions = this.getTrueQuestions(userTest, questions);
    return GetTestReportResponse.builder()
        .name(this.getUserName(userId))
        .beginDoingTest(this.getStartingTime(userTest))
        .testTimes(this.timesDoingTest(userTest))
        .scores(this.scoreInTimesDoingTest(userTest))
        .trueQuestions(trueQuestions)
        .wrongQuestions(this.getWrongQuestions(questions, trueQuestions))
        .passedTimes(this.getPassedTimes(userTest))
        .build();
  }

  private boolean checkValidUser(Long userId) {
    List<GroupEntity> groupEntitiesOfUser = userGroupRepository.roleOf(userId);
    return groupEntitiesOfUser.size() == GroupID.ROLES_ID
        || groupEntitiesOfUser.getFirst().getId() == GroupID.TEACHER_ID;
  }

  private void addQuestion(List<Question> addQuestions, TestEntity test) {
    List<QuestionEntity> questionEntityList =
        addQuestions.stream()
            .map(
                question ->
                    QuestionEntity.builder()
                        .question(question.getQuestion())
                        .questionType(question.getQuestionType())
                        .testEntity(test)
                        .build())
            .toList();
    questionRepository.saveAll(questionEntityList);
    List<AnswerEntity> answerEntityList = new ArrayList<>();
    for (int i = 0; i < addQuestions.size(); i++) {
      QuestionEntity questionEntity = questionEntityList.get(i);
      answerEntityList.addAll(
          addQuestions.get(i).getAnswers().stream()
              .map(
                  ans ->
                      AnswerEntity.builder()
                          .questionEntity(questionEntity)
                          .answer(ans.getKey())
                          .isCorrect(ans.getValue())
                          .build())
              .toList());
    }
    answerRepository.saveAll(answerEntityList);
  }

  private void modifyQuestion(ModifyQuestionDetails modifyQuestionDetails) {
    if (!modifyQuestionDetails.getDeleteAnswerId().isEmpty()) {
      this.deleteAnswer(modifyQuestionDetails.getDeleteAnswerId());
    }
    if (!modifyQuestionDetails.getModifyAnswerId().isEmpty()) {
      this.modifyAnswer(modifyQuestionDetails);
    }
    if (!modifyQuestionDetails.getAddAnswers().isEmpty()) {
      this.addAnswer(modifyQuestionDetails);
    }
    if (!modifyQuestionDetails.getQuestionIdForFundamentalField().isEmpty()) {
      this.modifyFundamentalFieldForQuestion(modifyQuestionDetails);
    }
  }

  private void saveDefaultFieldOf(TestEntity test, String title, String rule) {
    test.setTitle(title);
    test.setRule(rule);
    testRepository.save(test);
  }

  private QuestionEntity findQuestionById(long id) {
    return questionRepository
        .findById(id)
        .orElseThrow(() -> new NullValueException("404 not found"));
  }

  private boolean isExist(Long lessonId, Long userId) {
    return userLessonRepository.findByLessonIdAndUserId(lessonId, userId).orElse(null) != null;
  }

  private boolean isQuestionEmpty(Map<Long, Boolean> answers) {
    for (Map.Entry<Long, Boolean> entry : answers.entrySet()) {
      if (entry.getValue()) {
        return false;
      }
    }
    return true;
  }

  private float calculateScore(List<Map<Long, Boolean>> answerIds, List<Long> userAnswers) {
    int correctQuestion = 0;
    for (Map<Long, Boolean> answerId : answerIds) {
      int correctAnswerInQuestion = 0;
      int correctAnswerOfUser = 0;
      for (Map.Entry<Long, Boolean> entry : answerId.entrySet()) {
        AnswerEntity answer =
            answerRepository
                .findById(entry.getKey())
                .orElseThrow(() -> new NullValueException("404 not found"));
        if (answer.isCorrect()) {
          correctAnswerInQuestion++;
        }
        if (entry.getValue() && answer.isCorrect()) {
          correctAnswerOfUser++;
        }
        if (entry.getValue()) {
          userAnswers.add(entry.getKey());
        }
      }
      if (correctAnswerInQuestion == correctAnswerOfUser) {
        correctQuestion++;
      }
    }
    return ((float) correctQuestion / answerIds.size()) * 10;
  }

  private void deleteAnswer(List<Long> answerIds) {
    answerRepository.deleteAllByListOf(answerIds);
  }

  private void modifyAnswer(ModifyQuestionDetails modifyQuestionDetails) {
    List<AnswerEntity> modifyAnswersForSave = new ArrayList<>();
    for (int i = 0; i < modifyQuestionDetails.getModifyAnswerId().size(); i++) {
      AnswerEntity answer =
          answerRepository
              .findById(modifyQuestionDetails.getModifyAnswerId().get(i))
              .orElseThrow(() -> new NullValueException("404 not found"));
      answer.setAnswer(modifyQuestionDetails.getModifyAnswers().get(i).getKey());
      answer.setCorrect(modifyQuestionDetails.getModifyAnswers().get(i).getValue());
      modifyAnswersForSave.add(answer);
    }
    answerRepository.saveAll(modifyAnswersForSave);
  }

  private void addAnswer(ModifyQuestionDetails modifyQuestionDetails) {
    List<AnswerEntity> addAnswers =
        modifyQuestionDetails.getAddAnswers().stream()
            .map(
                answer -> {
                  int index = modifyQuestionDetails.getAddAnswers().indexOf(answer);
                  QuestionEntity questionEntity =
                      findQuestionById(modifyQuestionDetails.getQuestionIdForAdding().get(index));
                  return AnswerEntity.builder()
                      .answer(answer.getKey())
                      .isCorrect(answer.getValue())
                      .questionEntity(questionEntity)
                      .build();
                })
            .toList();
    answerRepository.saveAll(addAnswers);
  }

  private void modifyFundamentalFieldForQuestion(ModifyQuestionDetails modifyQuestionDetails) {
    List<QuestionEntity> questions =
        questionRepository.findByListOfQuestionId(
            modifyQuestionDetails.getQuestionIdForFundamentalField());
    if (questions.isEmpty()) {
      throw new NullValueException("Don't have any question with some ids");
    }
    for (int i = 0; i < questions.size(); i++) {
      questions.get(i).setQuestion(modifyQuestionDetails.getQuestions().get(i));
      questions.get(i).setQuestionType(modifyQuestionDetails.getQuestionTypes().get(i));
    }
    questionRepository.saveAll(questions);
  }

  private UserTestEntity saveUserTest(Long lessonId, Long userId, Long testId, float score) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException("404 not found"));
    TestEntity test =
        testRepository
            .findById(testId)
            .orElseThrow(() -> new NullValueException("404 not found this this"));
    UserTestEntity userTest =
        UserTestEntity.builder()
            .userLessonEntity(userLesson)
            .testEntity(test)
            .score(score)
            .passed(score >= PassingLevel.PASSED_LEVEL.getScoreLevel())
            .build();
    userTestRepository.save(userTest);
    return userTest;
  }

  private void saveUserAnswer(List<Long> userAnswers, UserTestEntity userTest) {
    for (Long userAnswer : userAnswers) {
      AnswerEntity answer =
          answerRepository
              .findById(userAnswer)
              .orElseThrow(() -> new NullValueException("404 not found"));
      userAnswerRepository.save(
          UserAnswerEntity.builder().userTestEntity(userTest).answerEntity(answer).build());
    }
  }

  private List<QuestionForResponse> takeQuestionForResponse(
      List<QuestionEntity> questions,
      List<List<AnswerEntity>> answersOfAllQuestions,
      List<Long> userAnswers) {
    return questions.stream()
        .map(
            question -> {
              List<AnswerEntity> answers = answersOfAllQuestions.get(questions.indexOf(question));
              Map<String, Boolean> answersWithCorrect = new LinkedHashMap<>();
              List<Boolean> choseAnswers = new ArrayList<>();
              for (AnswerEntity answer : answers) {
                answersWithCorrect.put(answer.getAnswer(), answer.isCorrect());
                choseAnswers.add(userAnswers.contains(answer.getId()));
              }
              return QuestionForResponse.builder()
                  .question(question.getQuestion())
                  .answers(answersWithCorrect)
                  .choseAnswers(choseAnswers)
                  .build();
            })
        .toList();
  }

  private List<TestForResponse> takeTestForResponse(
      List<UserTestEntity> userTests,
      List<QuestionEntity> questions,
      List<List<AnswerEntity>> answersOfAllQuestions) {
    return userTests.stream()
        .map(
            userTest -> {
              List<Long> userAnswers = userAnswerRepository.findByUserTestId(userTest.getId());
              List<QuestionForResponse> questionForResponses =
                  this.takeQuestionForResponse(questions, answersOfAllQuestions, userAnswers);
              return TestForResponse.builder()
                  .score(userTest.getScore())
                  .passed(userTest.isPassed())
                  .questions(questionForResponses)
                  .build();
            })
        .toList();
  }

  private UserLessonEntity findUserLessonByUserAndLessonId(Long userId, Long lessonId) {
    return userLessonRepository
        .findByLessonIdAndUserId(lessonId, userId)
        .orElseThrow(() -> new NullValueException("this user has not learnt before"));
  }

  private List<UserTestEntity> findUserTestByUserLessonAndTestId(Long userLessonId, Long testId) {
    return userTestRepository.findByUserLessonIdAndTestId(userLessonId, testId);
  }

  private String getUserName(Long userId) {
    UserEntity user =
        userRepository
            .findById(userId)
            .orElseThrow(() -> new NullValueException("404 not found this user"));
    return user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName();
  }

  private List<OffsetDateTime> getStartingTime(List<UserTestEntity> userTestEntities) {
    return userTestEntities.stream().map(ut -> ut.getCreated()).toList();
  }

  private int timesDoingTest(List<UserTestEntity> userTestEntities) {
    return userTestEntities.size();
  }

  private List<Float> scoreInTimesDoingTest(List<UserTestEntity> userTestEntities) {
    return userTestEntities.stream().map(ut -> ut.getScore()).toList();
  }

  private List<Integer> getTrueQuestions(List<UserTestEntity> userTestEntities, int questions) {
    List<Integer> result = new ArrayList<>();
    for (UserTestEntity userTestEntity : userTestEntities) {
      result.add((int) (userTestEntity.getScore() * questions) / 10);
    }
    return result;
  }

  private List<Integer> getWrongQuestions(int questions, List<Integer> trueQuestions) {
    return trueQuestions.stream().map(tq -> questions - tq).toList();
  }

  private List<Boolean> getPassedTimes(List<UserTestEntity> userTestEntities) {
    return userTestEntities.stream().map(ut -> ut.isPassed()).toList();
  }

  private boolean isDoneTest(List<UserTestEntity> userTestEntities) {
    return !userTestEntities.isEmpty();
  }
}
