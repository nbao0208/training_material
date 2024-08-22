package com.train.trainingmaterial.document;

import com.train.trainingmaterial.shared.constants.PersonTakeActionInDB;
import java.time.LocalDateTime;
import lombok.Data;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.data.mongodb.core.mapping.FieldType;
import org.springframework.data.mongodb.core.mapping.MongoId;

@Data
public abstract class BaseDocument {
  @MongoId(targetType = FieldType.OBJECT_ID)
  @Field(name = "_id")
  private ObjectId id;

  @Field(name = "_class")
  private String className;

  @Field(name = "created")
  @CreatedDate
  private LocalDateTime created;

  @Field(name = "modified")
  @LastModifiedDate
  private LocalDateTime modified;

  @Field(name = "created_by")
  private String createdBy = PersonTakeActionInDB.PERSON_HANDLE;

  @Field(name = "modified_by")
  private String modifiedBy = PersonTakeActionInDB.PERSON_HANDLE;

  @Field(name = "is_deleted")
  private boolean isDeleted = false;
}
