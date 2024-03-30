package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.CategoryDao;
import com.train.trainingmaterial.entity.CategoryEntity;
import com.train.trainingmaterial.repository.CategoryRepository;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class CategoryDaoImpl implements CategoryDao {
  private final CategoryRepository categoryRepository;

  @Override
  public List<CategoryEntity> getAllCategoryEntity() {
    return categoryRepository.findAll();
  }

  @Override
  public boolean addCategory(CategoryEntity category) {
    categoryRepository.save(category);
    return true;
  }

  @Override
  public boolean updateCategory(Long categoryId, CategoryEntity category) {
    CategoryEntity categoryInDB = categoryRepository.findById(categoryId).orElse(null);
    if (categoryInDB == null) {
      return false;
    }
    if (category.getCategoryName() != null) {
      categoryInDB.setCategoryName(category.getCategoryName());
    }
    categoryRepository.save(categoryInDB);
    return true;
  }

  @Override
  public boolean deleteCategory(Long categoryId) {
    CategoryEntity categoryInDb = categoryRepository.findById(categoryId).orElse(null);
    if (categoryInDb == null) {
      return false;
    }
    categoryInDb.setDeleted(true);
    categoryRepository.save(categoryInDb);
    return true;
  }
}
