package com.train.trainingmaterial.shared.enums;

import lombok.Getter;

@Getter
public enum ErrorCodes {

  // Authentication group (401XXX)
  AUTHENTICATION_ERROR(401001),

  NOT_FOUND_ERROR(404),

  AUTHORIZATION_ERROR(403),

  PERMISSION_DENIED(400),

  WRONG_VALUE_ERROR(400);

  private final int code;

  ErrorCodes(int code) {
    this.code = code;
  }

  public String getName() {
    return this.name();
  }

  @Override
  public String toString() {
    return this.name() + "(" + code + ")";
  }
}
