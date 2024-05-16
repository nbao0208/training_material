package com.train.trainingmaterial.model.test;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {
  private Long orderNumber;
  private String description;
  private boolean correct;
}
