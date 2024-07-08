package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import lombok.*;

@Entity
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tm_user")
public class UserEntity extends BaseEntity {

  @Column(name = "first_name", length = 30)
  private String firstName;

  @Column(name = "middle_name", length = 10)
  private String middleName;

  @Column(name = "last_name", length = 10)
  private String lastName;

  @Column(name = "national_id", length = 12)
  private String nationalId;

  @Column(name = "address")
  private String address;

  @Column(name = "dob")
  private LocalDate dob;
}
