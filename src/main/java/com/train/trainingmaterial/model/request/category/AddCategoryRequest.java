package com.train.trainingmaterial.model.request.category;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AddCategoryRequest extends BaseCategoryRequest {
  //    public AddCategoryRequest(@NotNull String categoryName){
  //        super(categoryName);
  //    }
}
