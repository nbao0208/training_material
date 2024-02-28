package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserLessonEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLessonRepository extends JpaRepository<UserLessonEntity, Long> {}
