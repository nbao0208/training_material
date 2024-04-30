package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import org.springframework.stereotype.Service;

@Service
public interface LessonService {
  Response<GetLessonResponse> getLesson(Long lessonId, GetLessonRequest request);

  Response<CancelLessonResponse> cancelLesson(Long lessonId, CancelLessonRequest request);

  Response<EvaluateLessonResponse> evaluateLesson(Long lessonId, EvaluateLessonRequest request);

  Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId);

  Response<CreateLessonResponse> createLesson(CreateLessonRequest request);

  Response<UpdateLessonResponse> updateLesson(Long lessonId, UpdateLessonRequest request);

  Response<GetLessonReportResponse> getLessonReport(GetLessonReportRequest request);
}
