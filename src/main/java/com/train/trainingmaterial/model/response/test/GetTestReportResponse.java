package com.train.trainingmaterial.model.response.test;

import java.time.OffsetDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetTestReportResponse {
  private String name;
  private List<OffsetDateTime> beginDoingTest;
  private int testTimes;
  List<Float> scores;
  List<Integer> trueQuestions;
  List<Integer> wrongQuestions;
  List<Boolean> passedTimes;
}
