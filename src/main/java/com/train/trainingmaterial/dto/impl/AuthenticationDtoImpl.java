package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.AuthenticationDao;
import com.train.trainingmaterial.dto.AuthenticationDto;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationDtoImpl implements AuthenticationDto {
  private final AuthenticationDao authenticationDao;
  private final JwtService jwtService;

  @Override
  public LogInUserResponse logInUser(LogInUserRequest request) {
    return LogInUserResponse.builder()
        .success(true)
        .token(
            jwtService.generateJwtToken(
                authenticationDao.logInUser(request.getAccount(), request.getPassword())))
        .build();
  }

  @Override
  public RegisterUserResponse registerUser(RegisterUserRequest request) {
    return RegisterUserResponse.builder()
        .success(true)
        .token(
            jwtService.generateJwtToken(
                authenticationDao.registerUser(
                    request.getFirstName(),
                    request.getMiddleName(),
                    request.getLastName(),
                    request.getDob(),
                    request.getAddress(),
                    request.getNationalID(),
                    request.getAccount(),
                    request.getPassword())))
        .build();
  }
}
