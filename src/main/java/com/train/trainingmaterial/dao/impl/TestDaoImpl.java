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
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TestDaoImpl implements TestDao {
  private final TestRepository testRepository;
  private final UserGroupRepository userGroupRepository;
  private final LessonRepository lessonRepository;
  private final QuestionRepository questionRepository;
  private final AnswerRepository answerRepository;

  @Override
  public boolean addTest(
      Long lessonId, Long userId, String title, String rule, List<Question> questions) {
    GroupEntity groupEntity =
        userGroupRepository
            .roleOf(userId)
            .orElseThrow(() -> new NullValueException("Invalid value"));
    if (groupEntity.getId() != 2) {
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
    GroupEntity groupEntity =
        userGroupRepository
            .roleOf(userId)
            .orElseThrow(() -> new NullValueException("Invalid value"));
    if (groupEntity.getId() != 2) {
      return false;
    }
    TestEntity test =
        testRepository.findById(testId).orElseThrow(() -> new NullValueException("404 not found"));
    test.setTitle(title);
    test.setRule(rule);
    testRepository.save(test);
    if (!deleteQuestionId.isEmpty()) {
      questionRepository.updateByListOfId(deleteQuestionId, true);
    }

    if (modifyQuestionDetails != null) {
      if (!modifyQuestionDetails.getDeleteAnswerId().isEmpty()) {
        answerRepository.deleteAllByListOf(modifyQuestionDetails.getDeleteAnswerId(), true);
      }
      if (!modifyQuestionDetails.getModifyAnswerId().isEmpty()) {
        for (int i = 0; i < modifyQuestionDetails.getModifyAnswerId().size(); i++) {
          AnswerEntity answer =
              answerRepository
                  .findById(modifyQuestionDetails.getModifyAnswerId().get(i))
                  .orElseThrow(() -> new NullValueException("404 not found"));
          answer.setAnswer(modifyQuestionDetails.getModifyAnswers().get(i).getKey());
          answer.setCorrect(modifyQuestionDetails.getModifyAnswers().get(i).getValue());
          answerRepository.save(answer);
        }
      }
      if (!modifyQuestionDetails.getAddAnswers().isEmpty()) {
        List<AnswerEntity> addAnswers = new ArrayList<>();
        for (Map.Entry<Map.Entry<String, Boolean>, Long> addAnswer :
            modifyQuestionDetails.getAddAnswers()) {
          QuestionEntity questionEntity =
              questionRepository
                  .findById(addAnswer.getValue())
                  .orElseThrow(() -> new NullValueException("404 not found"));
          addAnswers.add(
              AnswerEntity.builder()
                  .answer(addAnswer.getKey().getKey())
                  .isCorrect(addAnswer.getKey().getValue())
                  .questionEntity(questionEntity)
                  .build());
        }
        answerRepository.saveAll(addAnswers);
      }
    }

    if (!addQuestions.isEmpty()) {
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
    return true;
  }
}
