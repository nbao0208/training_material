package com.train.trainingmaterial.model.response.common;

import com.train.trainingmaterial.model.common.ResponseError;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ErrorResponse {
  private String id;

  private ResponseError error;
}
