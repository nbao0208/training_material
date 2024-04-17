package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import org.springframework.stereotype.Service;

@Service
public interface TestService {
  Response<AddTestResponse> addTest(Long lessonId, Long userId, AddTestRequest request);

  Response<ModifyTestResponse> modifyTest(Long testId, Long userId, ModifyTestRequest request);

  Response<GetTestResponse> getTest(Long testId, GetTestRequest request);

  Response<SubmitTestResponse> submitTest(Long testId, Long lessonId, SubmitTestRequest request);

  Response<ShowDetailedResultResponse> showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request);

  Response<GetTestReportResponse> getTestReport(GetTestReportRequest request);
}
