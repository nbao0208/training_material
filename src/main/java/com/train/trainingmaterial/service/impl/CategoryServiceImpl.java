package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.CategoryDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.category.AddCategoryRequest;
import com.train.trainingmaterial.model.request.category.UpdateCategoryRequest;
import com.train.trainingmaterial.model.response.category.*;
import com.train.trainingmaterial.service.CategoryService;
import java.util.List;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {
  private final CategoryDto categoryDto;

  @Override
  public Response<GetAllCategoryResponse> getAllCategory() {
    List<CategoryDetailResponse> categoryDetailResponses = categoryDto.getCategoryDetail();
    return Response.<GetAllCategoryResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(
            GetAllCategoryResponse.builder()
                .total(categoryDetailResponses.size())
                .categoryDetail(categoryDetailResponses)
                .build())
        .build();
  }

  @Override
  public Response<AddCategoryResponse> addCategory(AddCategoryRequest request) {
    return Response.<AddCategoryResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(AddCategoryResponse.builder().success(categoryDto.addCategory(request)).build())
        .build();
  }

  @Override
  public Response<UpdateCategoryResponse> updateCategory(
      Long categoryId, UpdateCategoryRequest request) {
    return Response.<UpdateCategoryResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(
            UpdateCategoryResponse.builder()
                .success(categoryDto.updateCategory(categoryId, request))
                .build())
        .build();
  }

  @Override
  public Response<DeleteCategoryResponse> deleteCategory(Long categoryId) {
    return Response.<DeleteCategoryResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(
            DeleteCategoryResponse.builder()
                .success(categoryDto.deleteCategory(categoryId))
                .build())
        .build();
  }
}
