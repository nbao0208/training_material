package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.shared.constants.MessageResponseForTheSubmittedTest;
import com.train.trainingmaterial.shared.enums.PassingLevel;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class TestDtoImplV2 implements TestDto {
  private static final Logger log = LoggerFactory.getLogger(TestDtoImplV2.class);
  private final TestDao testDaoImplV2;

  @Override
  public AddTestResponse addTest(Long lessonId, Long userId, AddTestRequest request) {
    return null;
  }

  @Override
  public AddTestResponse addTestByMongo(String lessonId, Long userId, AddTestRequestMongo request) {
    return AddTestResponse.builder()
        .isSuccess(
            testDaoImplV2.addTestByMongo(
                lessonId,
                userId,
                request.getTitle(),
                request.getDescription(),
                request.getQuestions()))
        .build();
  }

  @Override
  public ModifyTestResponse modifyTest(Long testId, Long userId, ModifyTestRequest request) {
    return null;
  }

  @Override
  public ModifyTestResponse modifyTestByMongo(
      String testId, Long userId, ModifyTestRequestMongo request) {
    return ModifyTestResponse.builder()
        .isSuccess(
            testDaoImplV2.modifyTestByMongo(
                testId,
                userId,
                request.getNewTitle(),
                request.getNewDescription(),
                request.getNewQuestions()))
        .build();
  }

  @Override
  public GetTestResponse getTest(Long testId, GetTestRequest request) {
    return null;
  }

  @Override
  public GetTestResponse getTestByMongo(String testId, GetTestRequestMongo request) {
    List<QuestionWithNoCorrectAnswer> questionsWithNoCorrectAnswers =
        testDaoImplV2.getTestByMongo(testId, request.getUserId(), request.getLessonId());
    return GetTestResponse.builder()
        .questions(questionsWithNoCorrectAnswers)
        .total(questionsWithNoCorrectAnswers.size())
        .build();
  }

  @Override
  public SubmitTestResponse submitTest(Long testId, Long lessonId, SubmitTestRequest request) {
    return null;
  }

  @Override
  public SubmitTestResponse submitTestByMongo(String testId, SubmitTestRequestMongo request) {
    float score =
        testDaoImplV2.submitTestByMongo(
            testId,
            request.getLessonId(),
            request.getUserId(),
            request.getSelectedAnswerPerQuestion());
    return SubmitTestResponse.builder()
        .score(score)
        .passed(score >= PassingLevel.PASSED_LEVEL.getScoreLevel())
        .message(this.messageResponseWhenScoreIs(score))
        .build();
  }

  @Override
  public ShowDetailedResultResponse showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request) {
    return null;
  }

  @Override
  public ShowDetailedResultResponseMongo showDetailedResultMongo(
      String testId, ShowDetailedResultRequestMongo request) {
    return ShowDetailedResultResponseMongo.builder()
        .tests(
            testDaoImplV2.showDetailedResultMongo(
                testId, request.getUserId(), request.getLessonId()))
        .build();
  }

  @Override
  public GetTestReportResponse getTestReport(GetTestReportRequest request) {
    return null;
  }

  private String messageResponseWhenScoreIs(float score) {
    if (score >= PassingLevel.PASSED_LEVEL.getScoreLevel()) {
      return MessageResponseForTheSubmittedTest.PASSED_MESSAGE;
    }
    return MessageResponseForTheSubmittedTest.UN_PASSED_MESSAGE;
  }
}
