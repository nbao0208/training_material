package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.LessonCommentRatingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonCommentRatingRepository
    extends JpaRepository<LessonCommentRatingEntity, Long> {}
