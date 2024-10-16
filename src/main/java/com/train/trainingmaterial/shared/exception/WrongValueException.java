package com.train.trainingmaterial.shared.exception;

import com.train.trainingmaterial.shared.enums.ErrorCodes;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
public class WrongValueException extends BaseException {
  public WrongValueException(String message) {
    super(message);
  }

  public WrongValueException(String message, ErrorCodes errorCodes){
    super(message, errorCodes);
  }
}
