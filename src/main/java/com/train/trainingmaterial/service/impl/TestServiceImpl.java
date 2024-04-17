package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.service.TestService;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Slf4j
public class TestServiceImpl implements TestService {
  private final TestDto testDto;

  @Override
  public Response<AddTestResponse> addTest(Long lessonId, Long userId, AddTestRequest request) {
    return Response.<AddTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.addTest(lessonId, userId, request))
        .build();
  }

  @Override
  public Response<ModifyTestResponse> modifyTest(
      Long testId, Long userId, ModifyTestRequest request) {
    log.info("=======> request: " + request.toString());
    return Response.<ModifyTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.modifyTest(testId, userId, request))
        .build();
  }

  @Override
  public Response<GetTestResponse> getTest(Long testId, GetTestRequest request) {
    GetTestResponse response = testDto.getTest(testId, request);
    List<QuestionWithNoCorrectAnswer> temp = new ArrayList<>(response.getQuestions());
    Collections.shuffle(temp);
    response.setQuestions(temp);
    return Response.<GetTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(response)
        .build();
  }

  @Override
  public Response<SubmitTestResponse> submitTest(
      Long testId, Long lessonId, SubmitTestRequest request) {
    return Response.<SubmitTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.submitTest(testId, lessonId, request))
        .build();
  }

  @Override
  public Response<ShowDetailedResultResponse> showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request) {
    return Response.<ShowDetailedResultResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.showDetailedResult(testId, lessonId, request))
        .build();
  }

  @Override
  public Response<GetTestReportResponse> getTestReport(GetTestReportRequest request) {
    return Response.<GetTestReportResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.getTestReport(request))
        .build();
  }
}
