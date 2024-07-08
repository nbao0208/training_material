package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.CancelLessonRequest;
import com.train.trainingmaterial.model.request.lesson.CreateLessonRequest;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.request.lesson.UpdateLessonRequest;
import com.train.trainingmaterial.model.response.lesson.*;
import com.train.trainingmaterial.service.LessonService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping(value = "/api/v2/lesson")
@RequiredArgsConstructor
public class LessonControllerV2 {
  private final LessonService lessonServiceImplV2;

  @PostMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CreateLessonResponse> createLesson(
      @Valid @RequestBody CreateLessonRequest request) {
    log.info("======> request: " + request.toString());
    return lessonServiceImplV2.createLesson(request);
  }

  @GetMapping(
      value = "/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetLessonResponse> getLesson(
      @PathVariable(value = "lesson_id") String lessonId,
      @Valid @RequestBody GetLessonRequest request) {
    log.info(lessonId);
    return lessonServiceImplV2.getLesson(lessonId, request);
  }

  @PutMapping(
      value = "/cancel/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CancelLessonResponse> cancelLesson(
      @PathVariable(value = "lesson_id") String lessonId,
      @Valid @RequestBody CancelLessonRequest request) {
    return lessonServiceImplV2.cancelLesson(lessonId, request);
  }

  @PutMapping(
      value = "/{lesson_id}/modify",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<UpdateLessonResponse> modifyLesson(
      @PathVariable(value = "lesson_id") String lessonId,
      @Valid @RequestBody UpdateLessonRequest request) {
    return lessonServiceImplV2.updateLesson(lessonId, request);
  }

  @PutMapping(
      value = "/{lesson_id}/user/{user_id}/complete",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CompleteLessonResponse> completeLesson(
      @PathVariable(value = "lesson_id") String lessonId,
      @PathVariable(value = "user_id") Long userId) {
    return lessonServiceImplV2.completeLessonMongo(userId, lessonId);
  }
}
