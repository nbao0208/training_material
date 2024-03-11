package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.dto.LessonDto;
import com.train.trainingmaterial.entity.LessonEntity;
import com.train.trainingmaterial.model.request.lesson.GetLessonRequest;
import com.train.trainingmaterial.model.response.lesson.GetLessonResponse;
import com.train.trainingmaterial.model.response.lesson.LessonDetailResponse;
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

  private LessonDetailResponse lessonDetailFrom(LessonEntity lessonEntity) {
    return LessonDetailResponse.builder()
        .title(lessonEntity.getTitle())
        .intro(lessonEntity.getIntro())
        .contentLink(lessonEntity.getContentLink())
        .build();
  }
}
