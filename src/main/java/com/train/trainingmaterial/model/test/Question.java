package com.train.trainingmaterial.model.test;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
  private Long orderNumber;
  private String description;
  private String type;
  private List<Answer> answers;
}
