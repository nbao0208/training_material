package com.train.trainingmaterial.controller;

import com.google.gson.Gson;
import com.train.trainingmaterial.model.common.ResponseError;
import com.train.trainingmaterial.model.common.ResponseErrorItem;
import com.train.trainingmaterial.model.request.auth.RequestCorrelation;
import com.train.trainingmaterial.model.response.common.ErrorResponse;
import com.train.trainingmaterial.shared.constants.MessageConstant;
import com.train.trainingmaterial.shared.exception.BaseException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import jakarta.validation.Path;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Stream;

@Slf4j
@RestControllerAdvice
public class GlobalControllerExceptionHandler {
  private final Gson gson;

  public GlobalControllerExceptionHandler(Gson gson) {
    this.gson = gson;
  }

  @ExceptionHandler({MethodArgumentNotValidException.class})
  public ResponseEntity<ErrorResponse> handleMethodArgumentNotValidException(
      MethodArgumentNotValidException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.BAD_REQUEST.value(), MessageConstant.VALIDATION_FAILED, exception);

    log.error("Validation error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler({ConstraintViolationException.class})
  public ResponseEntity<ErrorResponse> handleConstraintViolationException(
      ConstraintViolationException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.BAD_REQUEST.value(), MessageConstant.VALIDATION_FAILED, exception);

    log.error("Validation error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler({})
  public ResponseEntity<ErrorResponse> handleNotFoundExceptions(BaseException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.NOT_FOUND.value(), HttpStatus.NOT_FOUND.getReasonPhrase(), exception);

    log.error("Not found error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
  }

  @ExceptionHandler({})
  public ResponseEntity<ErrorResponse> handleBadRequestExceptions(BaseException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.BAD_REQUEST.value(), HttpStatus.BAD_REQUEST.getReasonPhrase(), exception);

    log.error("Bad request error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler({})
  public ResponseEntity<ErrorResponse> handleConflictExceptions(BaseException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.CONFLICT.value(), HttpStatus.CONFLICT.getReasonPhrase(), exception);

    log.error("Conflict error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.CONFLICT);
  }

  @ExceptionHandler({})
  public ResponseEntity<ErrorResponse> handleInternalServerErrorExceptions(
      BaseException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.INTERNAL_SERVER_ERROR.value(),
            HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase(),
            exception);

    log.error("Internal server error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @ExceptionHandler({})
  public ResponseEntity<ErrorResponse> handleAuthenticationException(
      AuthenticationException exception, HttpServletResponse response) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.UNAUTHORIZED.value(), HttpStatus.UNAUTHORIZED.getReasonPhrase(), exception);

    log.error("Authentication error: {}", errorResponse);

    return new ResponseEntity<>(errorResponse, HttpStatus.UNAUTHORIZED);
  }

  @ExceptionHandler()
  public ResponseEntity<ErrorResponse> handleForbiddenExceptions(BaseException exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.FORBIDDEN.value(), HttpStatus.FORBIDDEN.getReasonPhrase(), exception);

    log.error("Forbidden error: {}", gson.toJson(errorResponse));

    return new ResponseEntity<>(errorResponse, HttpStatus.FORBIDDEN);
  }

  @ExceptionHandler()
  public ResponseEntity<ErrorResponse> handleGenericExceptions(Exception exception) {
    ErrorResponse errorResponse =
        this.getErrorResponse(
            HttpStatus.INTERNAL_SERVER_ERROR.value(),
            HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase(),
            exception);

    log.error("Internal server error: {}", gson.toJson(errorResponse), exception);

    return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  private ErrorResponse getErrorResponse(int code, String message, Exception exception) {
    ResponseErrorItem responseErrorItem = ResponseErrorItem.from(exception);
    List<ResponseErrorItem> errors = List.of(responseErrorItem);

    return this.getErrorResponse(code, message, errors);
  }

  private ErrorResponse getErrorResponse(
      int code, String message, ConstraintViolationException exception) {
    Set<ConstraintViolation<?>> constraintViolations = exception.getConstraintViolations();

    List<ResponseErrorItem> errors =
        constraintViolations.stream()
            .map(
                constraintViolation -> {
                  Path propertyPath = constraintViolation.getPropertyPath();
                  Iterator<Path.Node> nodeIterator = propertyPath.iterator();
                  Path.Node lastNode = null;

                  while (nodeIterator.hasNext()) {
                    lastNode = nodeIterator.next();
                  }

                  return ResponseErrorItem.builder()
                      .reason(lastNode != null ? lastNode.getName() : propertyPath.toString())
                      .message(constraintViolation.getMessage())
                      .build();
                })
            .toList();

    return this.getErrorResponse(code, message, errors);
  }

  private ErrorResponse getErrorResponse(
      int code, String message, MethodArgumentNotValidException exception) {
    BindingResult bindingResult = exception.getBindingResult();

    List<ResponseErrorItem> fieldErrors =
        bindingResult.getFieldErrors().stream()
            .map(
                fieldError ->
                    ResponseErrorItem.builder()
                        .reason(fieldError.getField())
                        .message(fieldError.getDefaultMessage())
                        .build())
            .toList();

    List<ResponseErrorItem> objectErrors =
        bindingResult.getGlobalErrors().stream()
            .map(
                objectError ->
                    ResponseErrorItem.builder()
                        .reason(objectError.getObjectName())
                        .message(objectError.getDefaultMessage())
                        .build())
            .toList();

    List<ResponseErrorItem> errors =
        Stream.concat(fieldErrors.stream(), objectErrors.stream()).toList();

    return this.getErrorResponse(code, message, errors);
  }

  private ErrorResponse getErrorResponse(int code, String message, List<ResponseErrorItem> errors) {
    return ErrorResponse.builder()
        .id(RequestCorrelation.getRequestId())
        .error(ResponseError.builder().code(code).message(message).errors(errors).build())
        .build();
  }
}
