package com.train.trainingmaterial.model.response.rating;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GetAllRatingLevelResponse {
  private List<Integer> levels;
}
