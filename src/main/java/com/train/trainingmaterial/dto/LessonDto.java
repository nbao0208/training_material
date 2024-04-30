package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import org.springframework.stereotype.Service;

@Service
public interface LessonDto {
  GetLessonResponse getLesson(Long lessonId, GetLessonRequest request);

  CancelLessonResponse cancelLesson(Long lessonId, CancelLessonRequest request);

  EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request);

  CompleteLessonResponse completeLesson(Long userId, Long lessonId);

  CreateLessonResponse createLesson(CreateLessonRequest request);

  UpdateLessonResponse updateLesson(Long lessonId, UpdateLessonRequest request);

  GetLessonReportResponse getLessonReport(GetLessonReportRequest request);
}
