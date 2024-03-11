package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.UserLogInDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user_account.LogInUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.service.UserLogInService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserLogInServiceImpl implements UserLogInService {
  private final UserLogInDto userLogInDto;

  @Override
  public Response<LogInUserResponse> userLogIn(LogInUserRequest request) {
    return Response.<LogInUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(userLogInDto.userLogIn(request))
        .build();
  }
}
