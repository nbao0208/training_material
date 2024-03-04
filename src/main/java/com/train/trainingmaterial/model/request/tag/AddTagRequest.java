package com.train.trainingmaterial.model.request.tag;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AddTagRequest extends BaseTagRequest {
  public AddTagRequest(@NotNull int level, @NotNull String substance) {
    super(level, substance);
  }
}
