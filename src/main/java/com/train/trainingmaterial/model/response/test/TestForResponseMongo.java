package com.train.trainingmaterial.model.response.test;

import com.train.trainingmaterial.model.test.Question;
import com.train.trainingmaterial.model.test.SelectedAnswerPerQuestion;
import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TestForResponseMongo {
  private String title;
  private String description;
  private float score;
  private boolean passed;
  private List<Question> questions;
  private List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions;
}
