package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.CategoryEntity;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface CategoryDao {
  List<CategoryEntity> getAllCategoryEntity();

  boolean addCategory(CategoryEntity category);

  boolean updateCategory(Long categoryId, CategoryEntity category);

  boolean deleteCategory(Long categoryId);
}
