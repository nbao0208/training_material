package com.train.trainingmaterial.entity.CompanyA;

import com.train.trainingmaterial.entity.BaseEntity;
import com.train.trainingmaterial.entity.UserEntity;
import jakarta.persistence.*;
import java.time.LocalDate;
import lombok.*;

@Entity
@Table(name = "tm_a_user", schema = "a_company")
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class AUserEntity extends BaseEntity {

  @Column(name = "full_name")
  private String fullName;

  @Column(name = "citizen_id")
  private String citizenId;

  @Column(name = "address")
  private String address;

  @Column(name = "dob")
  private LocalDate dob;

  @Column(name = "position")
  private String position;

  @Column(name = "start_day")
  private LocalDate startDay;

  @OneToOne
  @JoinColumn(
      name = "user_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_tm_userA_tm_user"))
  private UserEntity userEntity;
}
