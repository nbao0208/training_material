package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import com.train.trainingmaterial.service.LessonService;
import java.util.UUID;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@Data
@RequiredArgsConstructor
public class LessonServiceImplV2 implements LessonService {
  private final LessonDto lessonDtoImplV2;

  @Override
  public <T> Response<GetLessonResponse> getLesson(T lessonId, GetLessonRequest request) {
    return Response.<GetLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImplV2.getLesson(lessonId, request))
        .build();
  }

  @Override
  public <T> Response<CancelLessonResponse> cancelLesson(T lessonId, CancelLessonRequest request) {
    return Response.<CancelLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImplV2.cancelLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<EvaluateLessonResponse> evaluateLesson(
      Long lessonId, EvaluateLessonRequest request) {
    return null;
  }

  @Override
  public Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId) {
    return null;
  }

  @Override
  public Response<CompleteLessonResponse> completeLessonMongo(Long userId, String lessonId) {
    return Response.<CompleteLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImplV2.completeLessonMongo(userId, lessonId))
        .build();
  }

  @Override
  public Response<CreateLessonResponse> createLesson(CreateLessonRequest request) {
    return Response.<CreateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImplV2.createLesson(request))
        .build();
  }

  @Override
  public <T> Response<UpdateLessonResponse> updateLesson(T lessonId, UpdateLessonRequest request) {
    return Response.<UpdateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImplV2.updateLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<GetLessonReportResponse> getLessonReport(GetLessonReportRequest request) {
    return null;
  }
}
