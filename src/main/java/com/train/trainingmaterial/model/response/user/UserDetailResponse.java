package com.train.trainingmaterial.model.response.user;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDetailResponse {
  private String fullName;
  private int age;
  private String nationalId;
}
