package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.AuthenticationDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterAUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.AuthenticationService;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service("aCompanyAuthenticationService")
@RequiredArgsConstructor
public class ACompanyAuthenticationServiceImpl implements AuthenticationService {
  private final AuthenticationDto aCompanyAuthenticationDto;

  @Override
  public Response<LogInUserResponse> logInUser(LogInUserRequest request) {
    return null;
  }

  @Override
  public Response<RegisterUserResponse> registerUser(RegisterUserRequest request) {
    return null;
  }

  @Override
  public Response<RegisterUserResponse> registerAUser(RegisterAUserRequest request) {
    return Response.<RegisterUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(aCompanyAuthenticationDto.registerUser(request))
        .build();
  }
}
