package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.CancelLessonRequest;
import com.train.trainingmaterial.model.request.lesson.EvaluateLessonRequest;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.CancelLessonResponse;
import com.train.trainingmaterial.model.response.lesson.CompleteLessonResponse;
import com.train.trainingmaterial.model.response.lesson.EvaluateLessonResponse;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import com.train.trainingmaterial.service.LessonService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class LessonServiceImpl implements LessonService {
  private final LessonDto lessonDto;

  @Override
  public Response<GetLessonResponse> getLesson(Long lessonId, GetLessonRequest request) {
    return Response.<GetLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDto.getLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<CancelLessonResponse> cancelLesson(Long lessonId, CancelLessonRequest request) {
    return Response.<CancelLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDto.cancelLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<EvaluateLessonResponse> evaluateLesson(
      Long lessonId, EvaluateLessonRequest request) {
    return Response.<EvaluateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDto.evaluateLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId) {
    return Response.<CompleteLessonResponse>builder().id(UUID.randomUUID().toString()).data(lessonDto.completeLesson(userId,lessonId)).build();
  }
}
