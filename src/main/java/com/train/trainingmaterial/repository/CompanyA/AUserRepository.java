package com.train.trainingmaterial.repository.CompanyA;

import com.train.trainingmaterial.entity.CompanyA.AUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AUserRepository extends JpaRepository<AUserEntity, Long> {}
