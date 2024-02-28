package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.TagEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TagRepository extends JpaRepository<TagEntity, Long> {}
