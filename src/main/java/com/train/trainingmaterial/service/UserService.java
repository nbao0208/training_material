package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
  Response<GetAllUserResponse> getAllUser();

  Response<Boolean> createUser(AddUserRequest request);
}
