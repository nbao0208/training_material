package com.train.trainingmaterial.document;

import com.train.trainingmaterial.model.user.Lesson;
import java.util.List;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "tm_user_mongodb")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class UserDocument extends BaseDocument {
  @Field(value = "user_id")
  @Indexed(unique = true)
  private Long userId;

  @Field(value = "lessons")
  private List<Lesson> lessons;
}
