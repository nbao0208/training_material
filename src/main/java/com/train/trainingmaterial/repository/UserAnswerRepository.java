package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserAnswerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAnswerRepository extends JpaRepository<UserAnswerEntity, Long> {}
