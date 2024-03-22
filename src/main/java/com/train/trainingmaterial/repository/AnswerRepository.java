package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.AnswerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AnswerRepository extends JpaRepository<AnswerEntity, Long> {
  @Query("update AnswerEntity a set a.isDeleted=:newValue where a.id in :deleteAnswerIds ")
  void deleteAllByListOf(
      @Param(value = "deleteAnswerIds") List<Long> deleteAnswerIds,
      @Param(value = "newValue") boolean newValue);
}
