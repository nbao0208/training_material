package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserAnswerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserAnswerRepository extends JpaRepository<UserAnswerEntity, Long> {
  @Transactional
  @Modifying
  @Query(
      value =
          "insert into tm_user_answer (tm_user_test_id,tm_answer_id)"
              + "values (:userTestId,:answerId)",
      nativeQuery = true)
  void insertNewUserAnswer(
      @Param(value = "userTestId") Long userTestId, @Param(value = "answerId") Long answerId);

  @Query(
      "select ua.answerEntity.id from UserAnswerEntity ua where ua.userTestEntity.id = :userTestId")
  List<Long> findByUserTestId(@Param(value = "userTestId") Long userTestId);
}
