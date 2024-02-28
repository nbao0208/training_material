package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.TestEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestRepository extends JpaRepository<TestEntity, Long> {}
