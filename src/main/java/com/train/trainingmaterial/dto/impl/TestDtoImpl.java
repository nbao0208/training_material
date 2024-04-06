package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.entity.AnswerEntity;
import com.train.trainingmaterial.entity.QuestionEntity;
import com.train.trainingmaterial.model.request.test.AddTestRequest;
import com.train.trainingmaterial.model.request.test.GetTestRequest;
import com.train.trainingmaterial.model.request.test.ModifyTestRequest;
import com.train.trainingmaterial.model.request.test.SubmitTestRequest;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.shared.constants.MessageResponseForTheSubmittedTest;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Slf4j
public class TestDtoImpl implements TestDto {
  private final TestDao testDao;

  @Override
  public AddTestResponse addTest(Long lessonId, Long userId, AddTestRequest request) {
    return AddTestResponse.builder()
        .isSuccess(
            testDao.addTest(
                lessonId, userId, request.getTitle(), request.getRule(), request.getQuestions()))
        .build();
  }

  @Override
  public ModifyTestResponse modifyTest(Long testId, Long userId, ModifyTestRequest request) {
    log.info("======> request: " + request.toString());
    return ModifyTestResponse.builder()
        .isSuccess(
            testDao.modifyTest(
                testId,
                userId,
                request.getTitle(),
                request.getRule(),
                request.getDeleteQuestionId(),
                request.getModifyQuestionDetails(),
                request.getAddQuestion()))
        .build();
  }

  @Override
  public GetTestResponse getTest(Long testId, GetTestRequest request) {
    List<Map.Entry<QuestionEntity, List<AnswerEntity>>> questions =
        testDao.getTest(testId, request.getUserId(), request.getLessonId());
    List<QuestionWithNoCorrectAnswer> questionResponse = this.generateFrom(questions);
    return GetTestResponse.builder()
        .questions(questionResponse)
        .total(questionResponse.size())
        .build();
  }

  @Override
  public SubmitTestResponse submitTest(Long testId, Long lessonId, SubmitTestRequest request) {
    float score = testDao.submitTest(testId, lessonId, request.getUserId(), request.getAnswerIds());
    return SubmitTestResponse.builder()
        .score(score)
        .passed(score >= 5)
        .message(this.messageResponseWhenScoreIs(score))
        .build();
  }

  private List<QuestionWithNoCorrectAnswer> generateFrom(
      List<Map.Entry<QuestionEntity, List<AnswerEntity>>> questions) {
    if (questions.isEmpty()) {
      throw new NullValueException("404 not found");
    }
    return questions.stream()
        .map(
            entry -> {
              List<String> answers =
                  new ArrayList<>(entry.getValue().stream().map(AnswerEntity::getAnswer).toList());
              Collections.shuffle(answers);
              return QuestionWithNoCorrectAnswer.builder()
                  .question(entry.getKey().getQuestion())
                  .questionType(entry.getKey().getQuestionType())
                  .answers(answers)
                  .build();
            })
        .toList();
  }

  private String messageResponseWhenScoreIs(float score) {
    if (score >= 5) {
      return MessageResponseForTheSubmittedTest.PASSED_MESSAGE;
    }
    return MessageResponseForTheSubmittedTest.UN_PASSED_MESSAGE;
  }
}
