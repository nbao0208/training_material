package com.train.trainingmaterial.model.response.test;

import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QuestionForResponse {
  private String question;
  private List<Boolean> choseAnswers;
  private Map<String, Boolean> answers;
}
