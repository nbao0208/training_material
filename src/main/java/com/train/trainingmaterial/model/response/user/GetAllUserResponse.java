package com.train.trainingmaterial.model.response.user;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class GetAllUserResponse {
  private long total;
  private List<UserDetailResponse> userDetails;
}
