package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.request.user.UpdateUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import org.springframework.stereotype.Service;

@Service
public interface UserDto {
  GetAllUserResponse getAllUser();

  boolean createUser(AddUserRequest request);

  boolean updateUser(UpdateUserRequest request, Long userId);

  boolean deleteUser(Long userId);
}
