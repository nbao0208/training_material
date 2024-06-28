package com.train.trainingmaterial.model.request.test;

import com.train.trainingmaterial.model.test.Question;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ModifyTestRequestMongo {
  private String newTitle;
  private String newDescription;
  private List<Question> newQuestions;
}
