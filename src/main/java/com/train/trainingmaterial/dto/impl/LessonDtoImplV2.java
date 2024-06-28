package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@Data
@RequiredArgsConstructor
public class LessonDtoImplV2 implements LessonDto {
  private final LessonDao lessonDaoImplV2;

  @Override
  public <T> GetLessonResponse getLesson(T lessonId, GetLessonRequest request) {
    return GetLessonResponse.builder()
        .lessonDetailResponse(lessonDaoImplV2.getLesson(lessonId, request.getUserId()))
        .build();
  }

  @Override
  public <T> CancelLessonResponse cancelLesson(T lessonId, CancelLessonRequest request) {
    return CancelLessonResponse.builder()
        .success(lessonDaoImplV2.cancelLesson(lessonId, request.getUserId()))
        .build();
  }

  @Override
  public EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request) {
    return null;
  }

  @Override
  public CompleteLessonResponse completeLesson(Long userId, Long lessonId) {
    return null;
  }

  @Override
  public CompleteLessonResponse completeLessonMongo(Long userId, String lessonId) {
    return CompleteLessonResponse.builder()
        .success(lessonDaoImplV2.completeLessonMongo(userId, lessonId))
        .build();
  }

  @Override
  public CreateLessonResponse createLesson(CreateLessonRequest request) {
    return CreateLessonResponse.builder()
        .success(
            lessonDaoImplV2.createLesson(
                request.getUserId(),
                request.getCategoryId(),
                request.getTagId(),
                request.getContentLink(),
                request.getTitle(),
                request.getIntro(),
                request.getTimeRemaining()))
        .build();
  }

  @Override
  public <T> UpdateLessonResponse updateLesson(T lessonId, UpdateLessonRequest request) {
    return UpdateLessonResponse.builder()
        .success(
            lessonDaoImplV2.updateLesson(
                lessonId,
                request.getUserId(),
                request.getCategoryId(),
                request.getTagId(),
                request.getContentLink(),
                request.getTitle(),
                request.getIntro(),
                request.getTimeRemaining()))
        .build();
  }

  @Override
  public GetLessonReportResponse getLessonReport(GetLessonReportRequest request) {
    return null;
  }
}
