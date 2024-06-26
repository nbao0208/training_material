package com.train.trainingmaterial.model.request.rating;

import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DoRatingRequest {
  @NotNull private Long userId;
  @NotNull private Long lessonId;
  @NotNull private Long ratingId;
  @NotNull private List<Long> commentTemplateId;
  private String optionalComment;
}
