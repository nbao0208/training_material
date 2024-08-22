package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.*;
import com.train.trainingmaterial.model.response.lesson.*;
import org.springframework.stereotype.Service;

@Service
public interface LessonService {
  <T> Response<GetLessonResponse> getLesson(T lessonId, GetLessonRequest request);

  <T> Response<CancelLessonResponse> cancelLesson(T lessonId, CancelLessonRequest request);

  Response<EvaluateLessonResponse> evaluateLesson(Long lessonId, EvaluateLessonRequest request);

  Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId);

  Response<CompleteLessonResponse> completeLessonMongo(Long userId, String lessonId);

  Response<CreateLessonResponse> createLesson(CreateLessonRequest request);

  <T> Response<UpdateLessonResponse> updateLesson(T lessonId, UpdateLessonRequest request);

  Response<GetLessonReportResponse> getLessonReport(GetLessonReportRequest request);
}
