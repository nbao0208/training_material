package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import lombok.Data;
import org.springframework.stereotype.Repository;

@Repository
@Data
public class LessonDtoImpl implements LessonDto {
  private final LessonDao lessonDaoImpl;

  @Override
  public <T> GetLessonResponse getLesson(T lessonId, GetLessonRequest request) {
    return GetLessonResponse.builder()
        .lessonDetailResponse(lessonDaoImpl.getLesson(lessonId, request.getUserId()))
        .build();
  }

  @Override
  public <T> CancelLessonResponse cancelLesson(T lessonId, CancelLessonRequest request) {
    return CancelLessonResponse.builder()
        .success(lessonDaoImpl.cancelLesson(lessonId, request.getUserId()))
        .build();
  }

  @Override
  public EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request) {
    return EvaluateLessonResponse.builder()
        .feedback(
            lessonDaoImpl.evaluateLesson(lessonId, request.getUserId(), request.getEvaluation()))
        .build();
  }

  @Override
  public CompleteLessonResponse completeLesson(Long userId, Long lessonId) {
    return CompleteLessonResponse.builder()
        .success(lessonDaoImpl.completeLesson(userId, lessonId))
        .build();
  }

  @Override
  public CompleteLessonResponse completeLessonMongo(Long userId, String lessonId) {
    return null;
  }

  @Override
  public CreateLessonResponse createLesson(CreateLessonRequest request) {
    return CreateLessonResponse.builder()
        .success(
            lessonDaoImpl.createLesson(
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
            lessonDaoImpl.updateLesson(
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
    return lessonDaoImpl.getLessonReport(request.getUserId(), request.getLessonId());
  }
}
