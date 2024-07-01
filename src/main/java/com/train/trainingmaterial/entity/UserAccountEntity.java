package com.train.trainingmaterial.entity;

import jakarta.persistence.*;
import java.util.Collection;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "tm_user_account")
public class UserAccountEntity extends BaseEntity implements UserDetails {
  @ManyToOne
  @JoinColumn(
      name = "tm_user_group_id",
      referencedColumnName = "id",
      foreignKey = @ForeignKey(name = "FK_tm_user_group_id_user_account"))
  private UserGroupEntity userGroupEntity;

  @Column(name = "account")
  private String account;

  @Column(name = "password")
  private String password;

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return userGroupEntity.getGroupEntity().getRole().getAuthority();
  }

  @Override
  public String getUsername() {
    return account;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
