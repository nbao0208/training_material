package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserLessonEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserLessonRepository extends JpaRepository<UserLessonEntity, Long> {
  @Query(
      "select ul from UserLessonEntity  ul where ul.userEntity.id=:userId and ul.lessonEntity.id"
          + " =:lessonId")
  Optional<UserLessonEntity> findByLessonIdAndUserId(
      @Param(value = "lessonId") Long lessonId, @Param(value = "userId") Long userId);
}
