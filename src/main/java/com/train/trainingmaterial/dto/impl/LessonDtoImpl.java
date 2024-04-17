package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.entity.LessonEntity;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Data
public class LessonDtoImpl implements LessonDto {
  private final LessonDao lessonDao;

  @Override
  public GetLessonResponse getLesson(Long lessonId, GetLessonRequest request) {
    return GetLessonResponse.builder()
        .lessonDetailResponse(
            this.lessonDetailFrom(lessonDao.getLesson(lessonId, request.getUserId())))
        .build();
  }

  @Override
  public CancelLessonResponse cancelLesson(Long lessonId, CancelLessonRequest request) {
    return CancelLessonResponse.builder()
        .success(lessonDao.cancelLesson(lessonId, request.getUserId()))
        .build();
  }

  @Override
  public EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request) {
    return EvaluateLessonResponse.builder()
        .feedback(lessonDao.evaluateLesson(lessonId, request.getUserId(), request.getEvaluation()))
        .build();
  }

  @Override
  public CompleteLessonResponse completeLesson(Long userId, Long lessonId) {
    return CompleteLessonResponse.builder()
        .success(lessonDao.completeLesson(userId, lessonId))
        .build();
  }

  @Override
  public CreateLessonResponse createLesson(CreateLessonRequest request) {
    return CreateLessonResponse.builder()
        .success(
            lessonDao.createLesson(
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
  public UpdateLessonResponse updateLesson(Long lessonId, UpdateLessonRequest request) {
    return UpdateLessonResponse.builder()
        .success(
            lessonDao.updateLesson(
                lessonId,
                request.getUserId(),
                request.getCategoryId(),
                request.getContentLink(),
                request.getTitle(),
                request.getIntro(),
                request.getTimeRemaining()))
        .build();
  }

  @Override
  public GetLessonReportResponse getLessonReport(GetLessonReportRequest request) {
    return lessonDao.getLessonReport(request.getUserId(), request.getLessonId());
  }

  private LessonDetailResponse lessonDetailFrom(LessonEntity lessonEntity) {
    return LessonDetailResponse.builder()
        .title(lessonEntity.getTitle())
        .intro(lessonEntity.getIntro())
        .contentLink(lessonEntity.getContentLink())
        .timeRemaining(lessonEntity.getTimeRemaining())
        .build();
  }
}
