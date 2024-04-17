package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import org.springframework.stereotype.Service;

@Service
public interface TestDto {
  AddTestResponse addTest(Long lessonId, Long userId, AddTestRequest request);

  ModifyTestResponse modifyTest(Long testId, Long userId, ModifyTestRequest request);

  GetTestResponse getTest(Long testId, GetTestRequest request);

  SubmitTestResponse submitTest(Long testId, Long lessonId, SubmitTestRequest request);

  ShowDetailedResultResponse showDetailedResult(
      Long testId, Long lessonId, ShowDetailedResultRequest request);

  GetTestReportResponse getTestReport(GetTestReportRequest request);
}
