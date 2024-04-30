package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.QuestionEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long> {
  @Query("select q from QuestionEntity q where q.id in :ids and q.testEntity.id=:test_id")
  List<QuestionEntity> findAllByIdAndTestId(
      @Param(value = "ids") List<Long> questionId, @Param(value = "test_id") Long testId);

  @Query("update QuestionEntity q set q.isDeleted=:newValue where q.id in :ids")
  void updateByListOfId(
      @Param(value = "ids") List<Long> questionId, @Param("newValue") boolean newValue);
}
