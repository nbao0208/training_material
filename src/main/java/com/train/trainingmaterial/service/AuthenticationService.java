package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationService {
  Response<LogInUserResponse> logInUser(LogInUserRequest request);

  Response<RegisterUserResponse> registerUser(RegisterUserRequest request);
}
