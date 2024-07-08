package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import org.springframework.stereotype.Service;

@Service
public interface TestDto {
  AddTestResponse addTest(Long lessonId, Long userId, AddTestRequest request);

  AddTestResponse addTestByMongo(String lessonId, Long userId, AddTestRequestMongo request);

  ModifyTestResponse modifyTest(Long testId, Long userId, ModifyTestRequest request);

  ModifyTestResponse modifyTestByMongo(String testId, Long userId, ModifyTestRequestMongo request);

  GetTestResponse getTest(Long testId, GetTestRequest request);

  GetTestResponse getTestByMongo(String testId, GetTestRequestMongo request);

  SubmitTestResponse submitTest(Long testId, Long lessonId, SubmitTestRequest request);

  SubmitTestResponse submitTestByMongo(String testId, SubmitTestRequestMongo request);

  ShowDetailedResultResponse showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request);

  ShowDetailedResultResponseMongo showDetailedResultMongo(
      String testId, ShowDetailedResultRequestMongo request);

  GetTestReportResponse getTestReport(GetTestReportRequest request);
}
