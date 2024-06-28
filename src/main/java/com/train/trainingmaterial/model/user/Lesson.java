package com.train.trainingmaterial.model.user;

import com.train.trainingmaterial.model.test.Test;
import java.time.LocalTime;
import java.util.List;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Field;

@Data
@Builder
public class Lesson {
  @Field(value = "lesson_id")
  private String lessonId;

  @Field(value = "report_id")
  private Long reportId;

  @Field(value = "items")
  private int views;

  @Field(value = "time_remaining")
  private LocalTime timeLearning;

  @Field(value = "tests")
  private List<Test> tests;
}
