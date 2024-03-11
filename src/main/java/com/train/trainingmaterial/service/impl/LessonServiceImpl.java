package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import com.train.trainingmaterial.service.LessonService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class LessonServiceImpl implements LessonService {
  private final LessonDto lessonDto;

  @Override
  public Response<GetLessonResponse> getLesson(Long lessonId, GetLessonRequest request) {
    return Response.<GetLessonResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(lessonDto.getLesson(lessonId, request))
        .build();
  }
}
