package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.request.user.UpdateUserRequest;
import com.train.trainingmaterial.model.response.user.AddUserResponse;
import com.train.trainingmaterial.model.response.user.DeleteUserResponse;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.model.response.user.UpdateUserResponse;
import com.train.trainingmaterial.shared.exception.NullValueException;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
  Response<GetAllUserResponse> getAllUser();

  Response<AddUserResponse> createUser(AddUserRequest request);

  Response<UpdateUserResponse> updateUser(UpdateUserRequest request, Long userId);

  Response<DeleteUserResponse> deleteUser(Long userId);
}
