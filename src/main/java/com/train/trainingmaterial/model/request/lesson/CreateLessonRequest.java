package com.train.trainingmaterial.model.request.lesson;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class CreateLessonRequest {
  @NotNull private Long userId;
  @NotNull private Long categoryId;
  @NotNull private String contentLink;
  @NotNull private String title;
  @NotNull private String intro;
  @NotNull private int timeRemaining;
}
