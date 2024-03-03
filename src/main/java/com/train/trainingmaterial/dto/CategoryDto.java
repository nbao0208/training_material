package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.category.AddCategoryRequest;
import com.train.trainingmaterial.model.request.category.UpdateCategoryRequest;
import com.train.trainingmaterial.model.response.category.CategoryDetailResponse;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface CategoryDto {
  List<CategoryDetailResponse> getCategoryDetail();

  boolean addCategory(AddCategoryRequest request);

  boolean updateCategory(Long categoryId, UpdateCategoryRequest request);

  boolean deleteCategory(Long categoryId);
}
