package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import com.train.trainingmaterial.service.LessonService;
import jakarta.validation.Valid;
import java.time.LocalTime;
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

  private CheckingTime checkingTime;

  @GetMapping(
      value = "/{lesson_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetLessonResponse> getLesson(
      @PathVariable(value = "lesson_id") Long lessonId,
      @Valid @RequestBody GetLessonRequest request) {
    this.checkingTime.setStartMoment(LocalTime.now());
    return lessonService.getLesson(lessonId, request);
  }
}
