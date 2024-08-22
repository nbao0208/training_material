package com.train.trainingmaterial.model.test;

import java.util.List;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Field;

@Data
@Builder
public class SelectedAnswerPerQuestion {
  @Field(value = "order_number_of_question")
  private Long orderNumberOfQuestion;

  @Field(value = "order_number_of_answers")
  private List<Long> orderNumberOfAnswers;
}
