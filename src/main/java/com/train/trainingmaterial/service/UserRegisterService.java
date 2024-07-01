package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserRegisterService {
  Response<RegisterUserResponse> registerUser(RegisterUserRequest request);
}
