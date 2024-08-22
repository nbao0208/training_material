package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.LessonTagEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LessonTagRepository extends JpaRepository<LessonTagEntity, Long> {
  @Query("select lt from LessonTagEntity lt where lt.lessonEntity.id=:lessonId")
  List<LessonTagEntity> getAllLessonTagWithLessonId(@Param(value = "lessonId") Long lessonId);
}
