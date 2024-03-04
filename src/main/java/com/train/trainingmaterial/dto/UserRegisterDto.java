package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.user_account.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserRegisterDto {
  RegisterUserResponse registerUser(RegisterUserRequest request);
}
