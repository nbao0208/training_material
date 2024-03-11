package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import org.springframework.stereotype.Service;

@Service
public interface LessonDto {
  GetLessonResponse getLesson(Long lessonId, GetLessonRequest request);
}
