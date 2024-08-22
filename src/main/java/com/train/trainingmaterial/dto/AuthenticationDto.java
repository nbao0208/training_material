package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationDto {
  LogInUserResponse logInUser(LogInUserRequest request);

  RegisterUserResponse registerUser(RegisterUserRequest request);
}
