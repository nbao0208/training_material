package com.train.trainingmaterial.model.response.category;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GetAllCategoryResponse {
  private long total;
  List<CategoryDetailResponse> categoryDetail;
}
