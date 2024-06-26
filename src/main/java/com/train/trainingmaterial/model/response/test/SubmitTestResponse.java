package com.train.trainingmaterial.model.response.test;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SubmitTestResponse {
  private float score;
  private boolean passed;
  private String message;
}
