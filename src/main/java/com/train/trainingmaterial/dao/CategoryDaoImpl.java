package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.CategoryEntity;
import com.train.trainingmaterial.repository.CategoryRepository;
import java.time.OffsetDateTime;
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
    this.saveDefaultField(category);
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
    this.saveDefaultField(categoryInDB);
    categoryRepository.save(categoryInDB);
    return true;
  }

  @Override
  public boolean deleteCategory(Long categoryId) {
    CategoryEntity categoryInDb = categoryRepository.findById(categoryId).orElse(null);
    if (categoryInDb == null) {
      return false;
    }
    this.saveDefaultField(categoryInDb);
    categoryInDb.setDeleted(true);
    categoryRepository.save(categoryInDb);
    return true;
  }

  private void saveDefaultField(CategoryEntity categoryEntity) {
    categoryEntity.setCreated(OffsetDateTime.now());
    categoryEntity.setModified(OffsetDateTime.now());
    categoryEntity.setCreatedBy("Bao Nguyen");
    categoryEntity.setModifiedBy("Bao Nguyen");
    categoryEntity.setDeleted(false);
  }
}
