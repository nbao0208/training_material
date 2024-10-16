package com.train.trainingmaterial.shared.exception;

import com.train.trainingmaterial.shared.enums.ErrorCodes;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class NullValueException extends BaseException {
  public NullValueException(String message) {
    super(message);
  }

  public NullValueException(String message, ErrorCodes errorCode) {
    super(message, errorCode);
  }
}
