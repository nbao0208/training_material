package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.user_account.LogInUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserLogInDto {
  LogInUserResponse userLogIn(LogInUserRequest request);
}
