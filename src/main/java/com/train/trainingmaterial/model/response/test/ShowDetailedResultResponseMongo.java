package com.train.trainingmaterial.model.response.test;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ShowDetailedResultResponseMongo {
  private List<TestForResponseMongo> tests;
}
