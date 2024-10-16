package com.train.trainingmaterial.shared.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
  @ExceptionHandler(Exception.class)
  public ResponseEntity<?> handleException(Exception exception) {
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(exception.getMessage());
  }

  @ExceptionHandler(UsernameNotFoundException.class)
  public ResponseEntity<?> handleUsernameNotFoundException(UsernameNotFoundException exception) {
    return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
            .body(exception.getMessage());
  }

  @ExceptionHandler(WrongValueException.class)
  public ResponseEntity<?> handleWrongValueException(WrongValueException exception) {
    return ResponseEntity.status(HttpStatus.NOT_FOUND)
            .body(ExceptionResponseBody.builder()
                    .errorCode(exception.getCode().toString())
                    .message(exception.getMessage())
                    .data(exception.getData())
                    .build());
  }

  @ExceptionHandler(NullValueException.class)
  public ResponseEntity<?> handleNullValueException(NullValueException exception) {
    return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body(ExceptionResponseBody.builder()
                    .errorCode(exception.getCode().toString())
                    .message(exception.getMessage())
                    .data(exception.getData()).build());
  }

  @ExceptionHandler(NotSamePasswordException.class)
  public ResponseEntity<?> handleNotSamePasswordException(NotSamePasswordException exception) {
    return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE)
            .body(ExceptionResponseBody.builder()
                    .errorCode(exception.getCode().toString())
                    .message(exception.getMessage())
                    .data(exception.getData()).build());
  }
}
