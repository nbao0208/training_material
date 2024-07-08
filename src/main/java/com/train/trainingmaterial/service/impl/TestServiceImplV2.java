package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.service.TestService;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class TestServiceImplV2 implements TestService {
  private final TestDto testDtoImplV2;

  @Override
  public Response<AddTestResponse> addTest(Long lessonId, Long userId, AddTestRequest request) {
    return null;
  }

  @Override
  public Response<AddTestResponse> addTestByMongo(
      String lessonId, Long userId, AddTestRequestMongo request) {
    return Response.<AddTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDtoImplV2.addTestByMongo(lessonId, userId, request))
        .build();
  }

  @Override
  public Response<ModifyTestResponse> modifyTest(
      Long testId, Long userId, ModifyTestRequest request) {
    return null;
  }

  @Override
  public Response<ModifyTestResponse> modifyTestByMongo(
      String testId, Long userId, ModifyTestRequestMongo request) {
    return Response.<ModifyTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDtoImplV2.modifyTestByMongo(testId, userId, request))
        .build();
  }

  @Override
  public Response<GetTestResponse> getTest(Long testId, GetTestRequest request) {
    return null;
  }

  @Override
  public Response<GetTestResponse> getTestByMongo(String testId, GetTestRequestMongo request) {
    return Response.<GetTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDtoImplV2.getTestByMongo(testId, request))
        .build();
  }

  @Override
  public Response<SubmitTestResponse> submitTest(
      Long testId, Long lessonId, SubmitTestRequest request) {
    return null;
  }

  @Override
  public Response<SubmitTestResponse> submitTestByMongo(
      String testId, SubmitTestRequestMongo request) {
    return Response.<SubmitTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDtoImplV2.submitTestByMongo(testId, request))
        .build();
  }

  @Override
  public Response<ShowDetailedResultResponse> showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request) {
    return null;
  }

  @Override
  public Response<ShowDetailedResultResponseMongo> showDetailedResultMongo(
      String testId, ShowDetailedResultRequestMongo request) {
    return Response.<ShowDetailedResultResponseMongo>builder()
        .id(UUID.randomUUID().toString())
        .data(testDtoImplV2.showDetailedResultMongo(testId, request))
        .build();
  }

  @Override
  public Response<GetTestReportResponse> getTestReport(GetTestReportRequest request) {
    return null;
  }
}
