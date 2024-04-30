package com.train.trainingmaterial.model.request.test;

import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
  private String question;
  private String questionType;
  private List<Map.Entry<String, Boolean>> answers;
}
