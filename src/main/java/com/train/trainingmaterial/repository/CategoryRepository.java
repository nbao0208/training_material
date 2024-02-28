package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {}
