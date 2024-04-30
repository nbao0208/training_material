package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.TagEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TagRepository extends JpaRepository<TagEntity, Long> {
  @Query("select t from TagEntity t where t.id in (:ids)")
  List<TagEntity> findByListOfId(@Param(value = "ids") List<Long> tagId);
}
