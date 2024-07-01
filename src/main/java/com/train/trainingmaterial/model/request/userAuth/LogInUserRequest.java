package com.train.trainingmaterial.model.request.user_account;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LogInUserRequest {
  private String account;
  private String password;
}
