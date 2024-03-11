package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user_account.LogInUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserLogInService {
  Response<LogInUserResponse> userLogIn(LogInUserRequest request);
}
