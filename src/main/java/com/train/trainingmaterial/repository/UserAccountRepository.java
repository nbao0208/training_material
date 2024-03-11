package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserAccountEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserAccountRepository extends JpaRepository<UserAccountEntity, Long> {
  @Query("select u from UserAccountEntity u where u.account=:account")
  Optional<UserAccountEntity> findByAccount(@Param(value = "account") String account);
}
