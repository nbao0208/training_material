package com.train.trainingmaterial.model.response.lesson;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LessonDetailResponse {
  private String title;
  private String intro;
  private String contentLink;
  private int timeRemaining;
}
