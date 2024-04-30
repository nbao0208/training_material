package com.train.trainingmaterial.model.response.test;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetTestResponse {
  private List<QuestionWithNoCorrectAnswer> questions;
  private long total;
}
