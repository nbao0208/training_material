package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import org.springframework.stereotype.Service;

@Service
public interface TestService {
  Response<AddTestResponse> addTest(Long lessonId, Long userId, AddTestRequest request);

  Response<AddTestResponse> addTestByMongo(
      String lessonId, Long userId, AddTestRequestMongo request);

  Response<ModifyTestResponse> modifyTest(Long testId, Long userId, ModifyTestRequest request);

  Response<ModifyTestResponse> modifyTestByMongo(
      String testId, Long userId, ModifyTestRequestMongo request);

  Response<GetTestResponse> getTest(Long testId, GetTestRequest request);

  Response<GetTestResponse> getTestByMongo(String testId, GetTestRequestMongo request);

  Response<SubmitTestResponse> submitTest(Long testId, Long lessonId, SubmitTestRequest request);

  Response<SubmitTestResponse> submitTestByMongo(String testId, SubmitTestRequestMongo request);

  Response<ShowDetailedResultResponse> showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request);

  Response<ShowDetailedResultResponseMongo> showDetailedResultMongo(
      String testId, ShowDetailedResultRequestMongo request);

  Response<GetTestReportResponse> getTestReport(GetTestReportRequest request);
}
