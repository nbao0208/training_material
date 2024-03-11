package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import org.springframework.stereotype.Service;

@Service
public interface LessonService {
  Response<GetLessonResponse> getLesson(Long lessonId, GetLessonRequest request);
}
