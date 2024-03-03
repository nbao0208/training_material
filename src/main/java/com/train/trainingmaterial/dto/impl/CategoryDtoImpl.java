package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.CategoryDao;
import com.train.trainingmaterial.dto.CategoryDto;
import com.train.trainingmaterial.entity.CategoryEntity;
import com.train.trainingmaterial.model.request.category.AddCategoryRequest;
import com.train.trainingmaterial.model.request.category.BaseCategoryRequest;
import com.train.trainingmaterial.model.request.category.UpdateCategoryRequest;
import com.train.trainingmaterial.model.response.category.CategoryDetailResponse;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class CategoryDtoImpl implements CategoryDto {
  private final CategoryDao categoryDao;

  @Override
  public List<CategoryDetailResponse> getCategoryDetail() {
    return this.categoryDetailFrom(categoryDao.getAllCategoryEntity());
  }

  @Override
  public boolean addCategory(AddCategoryRequest request) {
    if (this.hasNullField(request)) {
      return false;
    }
    return categoryDao.addCategory(this.categoryEntityFrom(request));
  }

  @Override
  public boolean updateCategory(Long categoryId, UpdateCategoryRequest request) {
    return categoryDao.updateCategory(categoryId, this.categoryEntityFrom(request));
  }

  @Override
  public boolean deleteCategory(Long categoryId) {
    return categoryDao.deleteCategory(categoryId);
  }

  private List<CategoryDetailResponse> categoryDetailFrom(List<CategoryEntity> categoryEntity) {
    List<CategoryDetailResponse> result = new ArrayList<>();
    for (CategoryEntity category : categoryEntity) {
      result.add(CategoryDetailResponse.builder().categoryName(category.getCategoryName()).build());
    }
    return result;
  }

  private <T extends BaseCategoryRequest> CategoryEntity categoryEntityFrom(T request) {
    return CategoryEntity.builder().categoryName(request.getCategoryName()).build();
  }

  private boolean hasNullField(AddCategoryRequest request) {
    return request.getCategoryName() == null;
  }
}
