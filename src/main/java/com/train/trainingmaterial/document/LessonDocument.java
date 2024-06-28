package com.train.trainingmaterial.document;

import java.util.List;
import lombok.*;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "tm_lesson_mongodb")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class LessonDocument extends BaseDocument {
  @Field(name = "category_id")
  private Long categoryId;

  @Field(name = "tag_ids")
  private List<Long> tagIds;

  @Field(name = "content_link")
  private String contentLink;

  @Field(name = "title")
  private String title;

  @Field(name = "intro")
  private String intro;

  @Field(name = "time_remaining")
  private int timeRemaining;

  @Field(name = "tests")
  List<String> testIds;
}
