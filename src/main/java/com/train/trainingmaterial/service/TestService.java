package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.AddTestRequest;
import com.train.trainingmaterial.model.request.test.GetTestRequest;
import com.train.trainingmaterial.model.request.test.ModifyTestRequest;
import com.train.trainingmaterial.model.request.test.SubmitTestRequest;
import com.train.trainingmaterial.model.response.test.AddTestResponse;
import com.train.trainingmaterial.model.response.test.GetTestResponse;
import com.train.trainingmaterial.model.response.test.ModifyTestResponse;
import com.train.trainingmaterial.model.response.test.SubmitTestResponse;
import org.springframework.stereotype.Service;

@Service
public interface TestService {
  Response<AddTestResponse> addTest(Long lessonId, Long userId, AddTestRequest request);

  Response<ModifyTestResponse> modifyTest(Long testId, Long userId, ModifyTestRequest request);

  Response<GetTestResponse> getTest(Long testId, GetTestRequest request);

  Response<SubmitTestResponse> submitTest(Long testId, Long lessonId, SubmitTestRequest request);
}
