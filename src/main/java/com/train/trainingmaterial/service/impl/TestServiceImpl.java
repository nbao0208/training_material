package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.AddTestRequest;
import com.train.trainingmaterial.model.request.test.ModifyTestRequest;
import com.train.trainingmaterial.model.response.test.AddTestResponse;
import com.train.trainingmaterial.model.response.test.ModifyTestResponse;
import com.train.trainingmaterial.service.TestService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
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
    return Response.<ModifyTestResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(testDto.modifyTest(testId, userId, request))
        .build();
  }
}
