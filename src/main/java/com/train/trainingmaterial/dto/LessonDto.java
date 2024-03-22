package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.lesson.CancelLessonRequest;
import com.train.trainingmaterial.model.request.lesson.EvaluateLessonRequest;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.CancelLessonResponse;
import com.train.trainingmaterial.model.response.lesson.EvaluateLessonResponse;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import org.springframework.stereotype.Service;

@Service
public interface LessonDto {
  GetLessonResponse getLesson(Long lessonId, GetLessonRequest request);

  CancelLessonResponse cancelLesson(Long lessonId, CancelLessonRequest request);

  EvaluateLessonResponse evaluateLesson(Long lessonId, EvaluateLessonRequest request);
}
