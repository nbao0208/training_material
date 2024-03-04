package com.train.trainingmaterial.model.request.tag;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@JsonInclude(JsonInclude.Include.NON_NULL)
public abstract class BaseTagRequest {
  private int level;
  private String substance;
}
