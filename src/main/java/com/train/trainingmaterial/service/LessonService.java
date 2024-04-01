package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.CancelLessonRequest;
import com.train.trainingmaterial.model.request.lesson.EvaluateLessonRequest;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.CancelLessonResponse;
import com.train.trainingmaterial.model.response.lesson.CompleteLessonResponse;
import com.train.trainingmaterial.model.response.lesson.EvaluateLessonResponse;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import org.springframework.stereotype.Service;

@Service
public interface LessonService {
  Response<GetLessonResponse> getLesson(Long lessonId, GetLessonRequest request);

  Response<CancelLessonResponse> cancelLesson(Long lessonId, CancelLessonRequest request);

  Response<EvaluateLessonResponse> evaluateLesson(Long lessonId, EvaluateLessonRequest request);

  Response<CompleteLessonResponse> completeLesson(Long userId, Long lessonId);
}
