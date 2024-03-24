package com.train.trainingmaterial.model.response.lesson;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetLessonResponse {
  private LessonDetailResponse lessonDetailResponse;
}
