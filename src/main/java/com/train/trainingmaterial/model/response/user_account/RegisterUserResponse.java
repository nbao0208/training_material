package com.train.trainingmaterial.model.response.user_account;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RegisterUserResponse {
  private boolean success;
}
