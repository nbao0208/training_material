package com.train.trainingmaterial.model.common;

import com.train.trainingmaterial.shared.enums.ErrorCodes;
import com.train.trainingmaterial.shared.exception.BaseException;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseErrorItem {
  private String reason;

  private String message;

  public static ResponseErrorItem from(Exception exception) {
    return ResponseErrorItem.builder()
        .reason(exception.getClass().getSimpleName())
        .message(exception.getMessage())
        .build();
  }

  public static ResponseErrorItem from(BaseException exception) {
    String reason = exception.getClass().getSimpleName();

    if (exception.getCode() != null) {
      ErrorCodes code = exception.getCode();

      reason = code.toString();
    }

    return ResponseErrorItem.builder().reason(reason).message(exception.getMessage()).build();
  }
}
