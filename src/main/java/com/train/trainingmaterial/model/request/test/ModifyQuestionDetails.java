package com.train.trainingmaterial.model.request.test;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ModifyQuestionDetails {
  @NotNull private List<Long> modifyAnswerId;
  @NotNull private List<Map.Entry<String, Boolean>> modifyAnswers;
  @NotNull private List<Long> deleteAnswerId;
  @NotNull private List<Long> questionIdForAdding;
  @NotNull private List<Map.Entry<String, Boolean>> addAnswers;
  @NotNull private List<Long> questionIdForFundamentalField;
  @NotNull private List<String> questions;
  @NotNull private List<String> questionTypes;
}
