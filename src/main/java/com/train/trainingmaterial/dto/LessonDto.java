package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import org.springframework.stereotype.Service;

@Service
public interface LessonDto {
  <T> GetLessonResponse getLesson(T lessonId, GetLessonRequest request);

  <T> CancelLessonResponse cancelLesson(T lessonId, CancelLessonRequest request);

  EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request);

  CompleteLessonResponse completeLesson(Long userId, Long lessonId);

  CompleteLessonResponse completeLessonMongo(Long userId, String lessonId);

  CreateLessonResponse createLesson(CreateLessonRequest request);

  <T> UpdateLessonResponse updateLesson(T lessonId, UpdateLessonRequest request);

  GetLessonReportResponse getLessonReport(GetLessonReportRequest request);
}
