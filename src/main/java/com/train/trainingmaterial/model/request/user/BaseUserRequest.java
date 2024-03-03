package com.train.trainingmaterial.model.request.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public abstract class BaseUserRequest {
  private Long id;
  private String firstName;
  private String middleName;
  private String lastName;
  private String dob;
  private String address;
  private String nationalID;
}
