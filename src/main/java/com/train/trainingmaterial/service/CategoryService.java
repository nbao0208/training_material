package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.category.AddCategoryRequest;
import com.train.trainingmaterial.model.request.category.UpdateCategoryRequest;
import com.train.trainingmaterial.model.response.category.AddCategoryResponse;
import com.train.trainingmaterial.model.response.category.DeleteCategoryResponse;
import com.train.trainingmaterial.model.response.category.GetAllCategoryResponse;
import com.train.trainingmaterial.model.response.category.UpdateCategoryResponse;
import org.springframework.stereotype.Service;

@Service
public interface CategoryService {
  Response<GetAllCategoryResponse> getAllCategory();

  Response<AddCategoryResponse> addCategory(AddCategoryRequest request);

  Response<UpdateCategoryResponse> updateCategory(Long categoryId, UpdateCategoryRequest request);

  Response<DeleteCategoryResponse> deleteCategory(Long categoryId);
}
