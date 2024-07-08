package com.train.trainingmaterial.model.request.lesson;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class UpdateLessonRequest {
  @NotNull private Long userId;
  private Long categoryId;
  private List<Long> tagId;
  private String contentLink;
  private String title;
  private String intro;
  private Integer timeRemaining;
}
