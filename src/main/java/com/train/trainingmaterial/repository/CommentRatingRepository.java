package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.CommentRatingEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentRatingRepository extends JpaRepository<CommentRatingEntity, Long> {
  @Query("select cr from CommentRatingEntity cr where cr.userLessonEntity.id=:userLessonId")
  List<CommentRatingEntity> findByUserLessonId(@Param(value = "userLessonId") Long userLessonId);
}
