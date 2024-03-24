package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.entity.*;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.repository.*;
import com.train.trainingmaterial.shared.exception.NullValueException;
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
    for (Question question : questions) {
      QuestionEntity questionEntity =
          QuestionEntity.builder()
              .questionType(question.getQuestionType())
              .question(question.getQuestion())
              .testEntity(testEntity)
              .build();
      questionRepository.save(questionEntity);
      for (Map.Entry<String, Boolean> answer : question.getAnswers()) {
        AnswerEntity answerEntity =
            AnswerEntity.builder()
                .questionEntity(questionEntity)
                .answer(answer.getKey())
                .isCorrect(answer.getValue())
                .build();
        answerRepository.save(answerEntity);
      }
    }
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
    test.setTitle(title);
    test.setRule(rule);
    testRepository.save(test);
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

  private boolean checkValidUser(Long userId) {
    GroupEntity groupEntity =
        userGroupRepository
            .roleOf(userId)
            .orElseThrow(() -> new NullValueException("Invalid value"));
    return groupEntity.getId() == 2;
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
      List<AnswerEntity> addAnswers = new ArrayList<>();
      for (int i = 0; i < modifyQuestionDetails.getAddAnswers().size(); i++) {
        QuestionEntity questionEntity =
            questionRepository
                .findById(modifyQuestionDetails.getQuestionIdForAdding().get(i))
                .orElseThrow(() -> new NullValueException("404 not found"));
        addAnswers.add(
            AnswerEntity.builder()
                .answer(modifyQuestionDetails.getAddAnswers().get(i).getKey())
                .isCorrect(modifyQuestionDetails.getAddAnswers().get(i).getValue())
                .questionEntity(questionEntity)
                .build());
      }
      answerRepository.saveAll(addAnswers);
    }
  }
}
