package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "tm_user_account")
public class UserAccountEntity extends BaseEntity {
  @OneToOne
  @JoinColumn(
      name = "tm_user_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_id_user_account"))
  private UserEntity userEntity;

  @Column(name = "account")
  private String account;

  @Column(name = "password")
  private String password;
}
