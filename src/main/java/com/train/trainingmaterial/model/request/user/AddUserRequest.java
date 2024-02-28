package com.train.trainingmaterial.model.request.user;

import lombok.*;

@Data
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AddUserRequest {
  private String firstName;
  private String middleName;
  private String lastName;
  private String dob;
  private String address;
  private String nationalID;
}
