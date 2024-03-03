package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.category.AddCategoryRequest;
import com.train.trainingmaterial.model.request.category.UpdateCategoryRequest;
import com.train.trainingmaterial.model.response.category.AddCategoryResponse;
import com.train.trainingmaterial.model.response.category.DeleteCategoryResponse;
import com.train.trainingmaterial.model.response.category.GetAllCategoryResponse;
import com.train.trainingmaterial.model.response.category.UpdateCategoryResponse;
import com.train.trainingmaterial.service.CategoryService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/category")
@Slf4j
@AllArgsConstructor
public class CategoryController {
  private final CategoryService categoryService;

  @GetMapping(value = "")
  public Response<GetAllCategoryResponse> getAllCategory() {
    return categoryService.getAllCategory();
  }

  @PostMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AddCategoryResponse> addCategory(@Valid @RequestBody AddCategoryRequest request) {
    log.info(request.toString());
    return categoryService.addCategory(request);
  }

  @PutMapping(
      value = "/{category_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<UpdateCategoryResponse> updateCategory(
      @PathVariable(value = "category_id") Long categoryId,
      @RequestBody UpdateCategoryRequest request) {
    return categoryService.updateCategory(categoryId, request);
  }

  @DeleteMapping(value = "/{category_id}")
  public Response<DeleteCategoryResponse> deleteCategory(
      @PathVariable(value = "category_id") Long categoryId) {
    return categoryService.deleteCategory(categoryId);
  }
}
