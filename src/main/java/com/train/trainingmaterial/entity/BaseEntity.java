package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;
import lombok.*;

@MappedSuperclass
@Getter
@Setter
public abstract class BaseEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "created")
  private OffsetDateTime created;

  @Column(name = "modified")
  private OffsetDateTime modified;

  @Column(name = "created_by", length = 30)
  private String createdBy;

  @Column(name = "modified_by", length = 30)
  private String modifiedBy;

  @Column(name = "is_deleted")
  private boolean isDeleted;
}
