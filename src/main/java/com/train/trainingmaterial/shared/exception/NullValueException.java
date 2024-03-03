package com.train.trainingmaterial.shared.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class NullValueException extends BaseException {
  public NullValueException(String message) {
    super(message);
  }
}
