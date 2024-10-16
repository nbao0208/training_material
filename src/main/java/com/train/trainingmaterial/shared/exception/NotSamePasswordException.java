package com.train.trainingmaterial.shared.exception;

import com.train.trainingmaterial.shared.enums.ErrorCodes;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class NotSamePasswordException extends BaseException {
  public NotSamePasswordException(String message) {
    super(message);
  }
  public NotSamePasswordException(String message, ErrorCodes errorCode) {
    super(message, errorCode);
  }
}
