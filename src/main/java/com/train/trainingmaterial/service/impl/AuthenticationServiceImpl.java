package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.AuthenticationDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.AuthenticationService;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {
  private final AuthenticationDto authenticationDto;

  @Override
  public Response<LogInUserResponse> logInUser(LogInUserRequest request) {
    return Response.<LogInUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(authenticationDto.logInUser(request))
        .build();
  }

  @Override
  public Response<RegisterUserResponse> registerUser(RegisterUserRequest request) {
    if (!request.getPassword().equals(request.getRewritePassword())) {
      throw new WrongValueException("Password rewritten wrong");
    }
    return Response.<RegisterUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(authenticationDto.registerUser(request))
        .build();
  }
}
