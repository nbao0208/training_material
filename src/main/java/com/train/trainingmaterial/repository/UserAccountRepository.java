package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserAccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAccountRepository extends JpaRepository<UserAccountEntity,Long> {}
