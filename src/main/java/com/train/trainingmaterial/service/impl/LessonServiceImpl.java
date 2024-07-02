package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import com.train.trainingmaterial.service.LessonService;
import java.util.UUID;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

@Repository
@Data
@RequiredArgsConstructor
public class LessonServiceImpl implements LessonService {
  private final LessonDto lessonDtoImpl;

  @Override
  @Cacheable(value = "lessonCache", key = "#lessonId")
  public <T> Response<GetLessonResponse> getLesson(T lessonId, GetLessonRequest request) {
    return Response.<GetLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.getLesson(lessonId, request))
        .build();
  }

  @Override
  public <T> Response<CancelLessonResponse> cancelLesson(T lessonId, CancelLessonRequest request) {
    return Response.<CancelLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.cancelLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<EvaluateLessonResponse> evaluateLesson(
      Long lessonId, EvaluateLessonRequest request) {
    return Response.<EvaluateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.evaluateLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId) {
    return Response.<CompleteLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.completeLesson(userId, lessonId))
        .build();
  }

  @Override
  public Response<CompleteLessonResponse> completeLessonMongo(Long userId, String lessonId) {
    return null;
  }

  @Override
  public Response<CreateLessonResponse> createLesson(CreateLessonRequest request) {
    return Response.<CreateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.createLesson(request))
        .build();
  }

  @Override
  public <T> Response<UpdateLessonResponse> updateLesson(T lessonId, UpdateLessonRequest request) {
    return Response.<UpdateLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.updateLesson(lessonId, request))
        .build();
  }

  @Override
  public Response<GetLessonReportResponse> getLessonReport(GetLessonReportRequest request) {
    return Response.<GetLessonReportResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDtoImpl.getLessonReport(request))
        .build();
  }
}
