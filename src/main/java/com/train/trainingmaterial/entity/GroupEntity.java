package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.OffsetDateTime;

@Entity
@Table(name = "tm_group")
public class GroupEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "role", length = 10)
  private String role;

  @Column(name = "created")
  private OffsetDateTime created;

  @Column(name = "modified")
  private OffsetDateTime modified;

  @Column(name = "created_by", length = 30)
  private String created_by;

  @Column(name = "modified_by", length = 30)
  private String modified_by;

  @Column(name = "is_deleted")
  private boolean is_deleted;
}
