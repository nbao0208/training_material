package com.train.trainingmaterial.shared.enums;

import lombok.Getter;

@Getter
public enum ErrorCodes {

  // Authentication group (401XXX)
  AUTHENTICATION_ERROR(401001);

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
