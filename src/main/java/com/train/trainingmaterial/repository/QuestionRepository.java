package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.QuestionEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long> {
  @Query("select q from QuestionEntity q where q.id in :ids and q.testEntity.id=:test_id")
  List<QuestionEntity> findAllByIdAndTestId(
      @Param(value = "ids") List<Long> questionId, @Param(value = "test_id") Long testId);

  @Modifying
  @Transactional
  @Query(value = "UPDATE tm_question SET is_deleted =true WHERE id IN (:ids)", nativeQuery = true)
  void deleteByListOfId(@Param(value = "ids") List<Long> questionId);

  @Query("select q from QuestionEntity q where q.testEntity.id=:testId and q.isDeleted=false ")
  List<QuestionEntity> findByTestId(@Param(value = "testId") Long testId);

  @Query("select q from QuestionEntity q where q.id in (:questionIds)")
  List<QuestionEntity> findByListOfQuestionId(@Param(value = "questionIds") List<Long> questionIds);
}
