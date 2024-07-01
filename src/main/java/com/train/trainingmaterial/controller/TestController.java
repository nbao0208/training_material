package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.test.*;
import com.train.trainingmaterial.model.response.test.*;
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
  private final TestService testServiceImpl;

  @PostMapping(
      value = "/lesson/{lesson_id}/user/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AddTestResponse> addTest(
      @PathVariable(value = "lesson_id") Long lessonId,
      @PathVariable(value = "user_id") Long userId,
      @Valid @RequestBody AddTestRequest request) {
    log.info(request.toString());
    return testServiceImpl.addTest(lessonId, userId, request);
  }

  @PutMapping(
      value = "/{test_id}/user/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE},
      consumes = "application/json;charset=UTF-8")
  public Response<ModifyTestResponse> modifyTest(
      @PathVariable(value = "test_id") Long testId,
      @PathVariable(value = "user_id") Long userId,
      @Valid @RequestBody ModifyTestRequest request) {
    log.info("=====> request: " + request.toString());
    return testServiceImpl.modifyTest(testId, userId, request);
  }

  @PutMapping(
      value = "/testing",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<ModifyTestResponse> testForModify(
      @Valid @RequestBody ModifyTestRequestTesting request) {
    log.info("=====>request: " + request.toString());
    return null;
  }

  @GetMapping(
      value = "/{test_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetTestResponse> getTest(
      @PathVariable(value = "test_id") Long testId, @Valid @RequestBody GetTestRequest request) {
    log.info("======>testId: " + testId);
    return testServiceImpl.getTest(testId, request);
  }

  @PutMapping(
      value = "/{test_id}/lesson/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<SubmitTestResponse> submitTest(
      @PathVariable(value = "test_id") Long testId,
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody SubmitTestRequest request) {
    return testServiceImpl.submitTest(testId, lessonId, request);
  }

  @GetMapping(
      value = "/{test_id}/lesson/{lesson_id}/show-detailed-results",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<ShowDetailedResultResponse> showDetailedResult(
      @PathVariable(value = "test_id") Long testId,
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody ShowDetailedResultRequest request) {
    return testServiceImpl.showDetailedResult(testId, lessonId, request);
  }

  @GetMapping(
      value = "/report",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetTestReportResponse> getTestReport(
      @Valid @RequestBody GetTestReportRequest request) {
    return testServiceImpl.getTestReport(request);
  }
}
