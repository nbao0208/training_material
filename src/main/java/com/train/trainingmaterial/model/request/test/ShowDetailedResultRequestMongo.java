package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ShowDetailedResultRequestMongo {
  @NotNull private Long userId;
  @NotNull private String lessonId;
}
