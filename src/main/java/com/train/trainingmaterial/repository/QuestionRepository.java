package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long> {}
