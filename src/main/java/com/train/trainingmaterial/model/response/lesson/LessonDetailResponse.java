package com.train.trainingmaterial.model.response.lesson;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LessonDetailResponse {
  private String title;
  private String intro;
  private String contentLink;
  private int timeRemaining;
}
