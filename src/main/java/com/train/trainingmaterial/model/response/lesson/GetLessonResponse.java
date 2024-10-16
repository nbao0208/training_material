package com.train.trainingmaterial.model.response.lesson;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GetLessonResponse {
  private LessonDetailResponse lessonDetailResponse;
}
