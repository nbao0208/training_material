package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import com.train.trainingmaterial.service.LessonService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/lesson")
@Slf4j
@RequiredArgsConstructor

public class LessonController {
  private final LessonService lessonServiceImpl;

  @GetMapping(
      value = "/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetLessonResponse> getLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody GetLessonRequest request) {
    return lessonServiceImpl.getLesson(lessonId, request);
  }

  @PostMapping(
      value = "/create",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CreateLessonResponse> createLesson(
      @Valid @RequestBody CreateLessonRequest request) {
    return lessonServiceImpl.createLesson(request);
  }

  @PutMapping(
      value = "/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<UpdateLessonResponse> updateLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody UpdateLessonRequest request) {
    log.info("======> request: " + request.toString());
    return lessonServiceImpl.updateLesson(lessonId, request);
  }

  @PutMapping(
      value = "/cancel/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CancelLessonResponse> cancelLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody CancelLessonRequest request) {
    return lessonServiceImpl.cancelLesson(lessonId, request);
  }

  @PutMapping(
      value = "/evaluate/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<EvaluateLessonResponse> evaluateLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody EvaluateLessonRequest request) {
    return lessonServiceImpl.evaluateLesson(lessonId, request);
  }

  @PutMapping(value = "/{lesson_id}/user/{user_id}/complete")
  public Response<CompleteLessonResponse> completeLesson(
      @PathVariable(value = "user_id") Long userId,
      @PathVariable(value = "lesson_id") Long lessonId) {
    return lessonServiceImpl.completeLesson(userId, lessonId);
  }

  @GetMapping(
      value = "/report",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetLessonReportResponse> getLessonReport(
      @Valid @RequestBody GetLessonReportRequest request) {
    return lessonServiceImpl.getLessonReport(request);
  }
}
