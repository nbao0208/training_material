package com.train.trainingmaterial.model.request.lesson;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class GetLessonReportRequest {
  @NotNull Long userId;
  @NotNull Long lessonId;
}
