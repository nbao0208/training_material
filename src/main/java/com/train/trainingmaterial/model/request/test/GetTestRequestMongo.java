package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class GetTestRequestMongo {
  @NotNull String lessonId;
  @NotNull Long userId;
}
