package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserTestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserTestRepository extends JpaRepository<UserTestEntity, Long> {
  @Transactional
  @Modifying
  @Query(
      value =
          "insert into tm_user_test (tm_user_lesson_id, tm_test_id, score, passed)"
              + "values (:userLessonId,:testId,:score,:passed)",
      nativeQuery = true)
  void insertNewUserTest(
      @Param(value = "userLessonId") Long userLessonId,
      @Param(value = "testId") Long testId,
      @Param(value = "score") float score,
      @Param(value = "passed") boolean passed);
}
