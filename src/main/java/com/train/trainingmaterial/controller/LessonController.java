package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.CancelLessonRequest;
import com.train.trainingmaterial.model.request.lesson.EvaluateLessonRequest;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.CancelLessonResponse;
import com.train.trainingmaterial.model.response.lesson.CompleteLessonResponse;
import com.train.trainingmaterial.model.response.lesson.EvaluateLessonResponse;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import com.train.trainingmaterial.service.LessonService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/lesson")
@AllArgsConstructor
@Slf4j
public class LessonController {
  private final LessonService lessonService;

  @GetMapping(
      value = "/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetLessonResponse> getLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody GetLessonRequest request) {
    return lessonService.getLesson(lessonId, request);
  }

  @PutMapping(
      value = "/cancel/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<CancelLessonResponse> cancelLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody CancelLessonRequest request) {
    return lessonService.cancelLesson(lessonId, request);
  }

  @PutMapping(
      value = "/evaluate/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<EvaluateLessonResponse> evaluateLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody EvaluateLessonRequest request) {
    return lessonService.evaluateLesson(lessonId, request);
  }

  @PutMapping(value = "/{lesson_id}/user/{user_id}/complete")
  public Response<CompleteLessonResponse> completeLesson(
      @PathVariable(value = "user_id") Long userId,
      @PathVariable(value = "lesson_id") Long lessonId) {
    return lessonService.completeLesson(userId, lessonId);
  }
}
