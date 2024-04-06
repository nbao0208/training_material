package com.train.trainingmaterial.model.response.test;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionWithNoCorrectAnswer {
  private String question;
  private String questionType;
  private List<String> answers;
}
