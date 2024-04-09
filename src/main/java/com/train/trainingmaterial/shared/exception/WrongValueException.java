package com.train.trainingmaterial.shared.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
public class WrongValueException extends BaseException {
  public WrongValueException(String message) {
    super(message);
  }
}
