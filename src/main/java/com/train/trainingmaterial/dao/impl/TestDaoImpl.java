package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.entity.*;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
  public float submitTest(
      Long testId, Long lessonId, Long userId, List<Map<Long, Boolean>> answerIds) {
    for (Map<Long, Boolean> answerId : answerIds) {
      if (this.isQuestionEmpty(answerId)) {
        throw new NullValueException("It is not enough questions, please answers all questions");
      }
    }
    List<Long> userAnswers = new ArrayList<>();
    float score = this.calculateScore(answerIds, userAnswers);
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
            .passed(score >= 5)
            .build();
    userTestRepository.save(userTest);
    for (Long userAnswer : userAnswers) {
      AnswerEntity answer = answerRepository.findById(userAnswer).orElseThrow(()->new NullValueException("404 not found"));
      userAnswerRepository.save(UserAnswerEntity.builder().userTestEntity(userTest).answerEntity(answer).build());
    }
    return score;
  }

  private boolean checkValidUser(Long userId) {
    GroupEntity groupEntity =
        userGroupRepository
            .roleOf(userId)
            .orElseThrow(() -> new NullValueException("Invalid value"));
    return groupEntity.getId() == GroupID.TEACHER_ID;
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
      answerRepository.deleteAllByListOf(modifyQuestionDetails.getDeleteAnswerId());
    }
    if (!modifyQuestionDetails.getModifyAnswerId().isEmpty()) {
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
    if (!modifyQuestionDetails.getAddAnswers().isEmpty()) {
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

  private float calculateScore(List<Map<Long, Boolean>> answerIds, List<Long> userAnswers){
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
}
