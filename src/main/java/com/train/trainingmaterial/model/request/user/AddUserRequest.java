package com.train.trainingmaterial.model.request.user;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AddUserRequest extends BaseUserRequest {

  public AddUserRequest(
      Long id,
      @NotNull String firstName,
      @NotNull String middleName,
      @NotNull String lastName,
      @NotNull String dob,
      @NotNull String address,
      @NotNull String nationalId) {
    super(id, firstName, middleName, lastName, dob, address, nationalId);
  }
}
