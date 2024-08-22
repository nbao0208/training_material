package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
import com.train.trainingmaterial.service.TestService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v2/test")
@RequiredArgsConstructor
@Slf4j
public class TestControllerV2 {
  private final TestService testServiceImplV2;

  @PostMapping(
      value = "/lesson/{lesson_id}/user/{user_id}/create",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AddTestResponse> createTest(
      @PathVariable(value = "lesson_id") String lessonId,
      @PathVariable(value = "user_id") Long userId,
      @Valid @RequestBody AddTestRequestMongo request) {
    log.info("======> request: " + request.toString());
    return testServiceImplV2.addTestByMongo(lessonId, userId, request);
  }

  @PutMapping(
      value = "/modify/{test_id}/user/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<ModifyTestResponse> modifyTest(
      @PathVariable(value = "user_id") Long userId,
      @PathVariable(value = "test_id") String testId,
      @Valid @RequestBody ModifyTestRequestMongo request) {
    log.info("======> request: " + request.toString());
    return testServiceImplV2.modifyTestByMongo(testId, userId, request);
  }

  @GetMapping(
      value = "/{test_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetTestResponse> getTest(
      @PathVariable(value = "test_id") String testId,
      @Valid @RequestBody GetTestRequestMongo request) {
    log.info("======>testId: " + testId);
    log.info("======> request: " + request.toString());
    return testServiceImplV2.getTestByMongo(testId, request);
  }

  @PutMapping(
      value = "/{test_id}/submit",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<SubmitTestResponse> submitTest(
      @PathVariable(value = "test_id") String testId,
      @Valid @RequestBody SubmitTestRequestMongo request) {
    log.info("=======> request: " + request.toString());
    return testServiceImplV2.submitTestByMongo(testId, request);
  }

  @GetMapping(
      value = "/result/{test_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<ShowDetailedResultResponseMongo> showDetailedResult(
      @PathVariable(value = "test_id") String testId,
      @Valid @RequestBody ShowDetailedResultRequestMongo request) {
    return testServiceImplV2.showDetailedResultMongo(testId, request);
  }
}
