package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.LessonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonRepository extends JpaRepository<LessonEntity, Long> {}
