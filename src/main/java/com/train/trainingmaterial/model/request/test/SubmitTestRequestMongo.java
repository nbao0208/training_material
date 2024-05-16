package com.train.trainingmaterial.model.request.test;

import com.train.trainingmaterial.model.test.SelectedAnswerPerQuestion;
import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SubmitTestRequestMongo {
  @NotNull private Long userId;
  @NotNull private String lessonId;
  @NotNull private List<SelectedAnswerPerQuestion> selectedAnswerPerQuestion;
}
