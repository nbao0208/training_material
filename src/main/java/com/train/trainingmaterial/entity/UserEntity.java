package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import lombok.*;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tm_user")
public class UserEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @Column(name = "first_name", length = 30)
  private String first_name;

  @Column(name = "middle_name", length = 10)
  private String middle_name;

  @Column(name = "last_name", length = 10)
  private String last_name;

  @Column(name = "national_id", length = 12)
  private String national_id;

  @Column(name = "address")
  private String address;

  @Column(name = "dob")
  private LocalDate dob;

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
