package com.train.trainingmaterial.model.response.user_account;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LogInUserResponse {
  private boolean success;
  private String token;
}
