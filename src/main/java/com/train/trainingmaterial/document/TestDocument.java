package com.train.trainingmaterial.document;

import com.train.trainingmaterial.model.test.Question;
import java.util.List;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "tm_test_mongodb")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class TestDocument extends BaseDocument {
  @Field(name = "title")
  private String title;

  @Field(name = "description")
  private String description;

  @Field(name = "questions")
  List<Question> questions;
}
