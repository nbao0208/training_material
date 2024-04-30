package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.AnswerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface AnswerRepository extends JpaRepository<AnswerEntity, Long> {
  @Modifying
  @Transactional
  @Query(
      value = "update tm_answer set is_deleted=true where id in (:deleteAnswerIds) ",
      nativeQuery = true)
  void deleteAllByListOf(@Param(value = "deleteAnswerIds") List<Long> deleteAnswerIds);

  @Modifying
  @Transactional
  @Query(
      value = "update tm_answer set is_deleted = true where tm_question_id in (:questionIds)",
      nativeQuery = true)
  void deleteAllByListOfQuestionId(@Param(value = "questionIds") List<Long> questionIds);

  @Query(
      "select a from AnswerEntity a where a.questionEntity.id=:questionId and a.isDeleted=false ")
  List<AnswerEntity> findByQuestionId(@Param(value = "questionId") Long questionId);
}
