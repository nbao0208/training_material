package com.train.trainingmaterial.model.request.user_account;

import com.train.trainingmaterial.model.request.user.BaseUserRequest;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RegisterUserRequest extends BaseUserRequest {
  private String account;
  private String password;
  private String rewritePassword;

}
