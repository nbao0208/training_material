package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddTestRequest {
  @NotNull private String title;
  @NotNull private String rule;
  @NotNull private List<Question> questions;
}
