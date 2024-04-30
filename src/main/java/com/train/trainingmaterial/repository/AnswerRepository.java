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
}
