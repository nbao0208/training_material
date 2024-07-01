package com.train.trainingmaterial.model.test;

import java.util.List;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Field;

@Data
@Builder
public class Test {
  @Field(value = "test_id")
  private String testId;

  @Field(value = "selected_answer_per_question")
  private List<SelectedAnswerPerQuestion> selectedAnswerPerQuestion;

  @Field(value = "score")
  private float score;

  @Field(value = "passed")
  private boolean passed;
}
