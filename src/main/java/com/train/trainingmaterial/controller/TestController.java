package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.AddTestRequest;
import com.train.trainingmaterial.model.request.test.ModifyTestRequest;
import com.train.trainingmaterial.model.response.test.AddTestResponse;
import com.train.trainingmaterial.model.response.test.ModifyTestResponse;
import com.train.trainingmaterial.service.TestService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/test")
@AllArgsConstructor
@Slf4j
public class TestController {
  private final TestService testService;

  @PostMapping(
      value = "/lesson/{lesson_id}/user/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AddTestResponse> addTest(
      @PathVariable(value = "lesson_id") Long lessonId,
      @PathVariable(value = "user_id") Long userId,
      @Valid @RequestBody AddTestRequest request) {
    log.info(request.toString());
    return testService.addTest(lessonId, userId, request);
  }

  @PostMapping(
      value = "/{test_id}/user/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE},
  consumes = "application/json;charset=UTF-8")
  public Response<ModifyTestResponse> modifyTest(
      @PathVariable(value = "test_id") Long testId,
      @PathVariable(value = "user_id") Long userId,
      @Valid @RequestBody ModifyTestRequest request) {
    return testService.modifyTest(testId, userId, request);
  }
}
