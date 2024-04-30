package com.train.trainingmaterial.model.response.test;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShowDetailedResultResponse {
  List<TestForResponse> tests;
}
