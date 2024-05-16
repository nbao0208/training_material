package com.train.trainingmaterial.model.request.test;

import com.train.trainingmaterial.model.test.Question;
import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddTestRequestMongo {
  @NotNull private String title;
  @NotNull private String description;
  @NotNull private List<Question> questions;
}
