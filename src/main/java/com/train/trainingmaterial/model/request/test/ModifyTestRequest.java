package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModifyTestRequest {
  @NotNull private String title;
  @NotNull private String rule;
  @NotNull List<Long> deleteQuestionId;
  @NotNull ModifyQuestionDetails modifyQuestionDetails;
  @NotNull List<Question> addQuestion;
}
