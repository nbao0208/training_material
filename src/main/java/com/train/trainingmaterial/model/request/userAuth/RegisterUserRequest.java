package com.train.trainingmaterial.model.request.userAuth;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterUserRequest {
  private String firstName;
  private String middleName;
  private String lastName;
  private String dob;
  private String address;
  private String nationalID;
  private String account;
  private String password;
  private String rewritePassword;
}
