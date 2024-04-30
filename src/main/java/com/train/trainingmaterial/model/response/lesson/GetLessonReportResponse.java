package com.train.trainingmaterial.model.response.lesson;

import java.time.LocalTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetLessonReportResponse {
  private int view;
  private LocalTime timeReading;
  private Integer ratingLevel;
  private List<String> templateComments;
  private String optionalComment;
}
