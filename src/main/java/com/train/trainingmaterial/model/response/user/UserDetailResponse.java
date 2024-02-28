package com.train.trainingmaterial.model.response.user;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class UserDetailResponse {
  private String fullName;
  private int age;
  private String nationalId;
}
