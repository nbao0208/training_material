package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.UserDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.service.UserService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class UserServiceImpl implements UserService {
  private final UserDto userDto;

  @Override
  public Response<GetAllUserResponse> getAllUser() {
    return new Response<>(UUID.randomUUID().toString(), userDto.getAllUser());
  }

  @Override
  public Response<Boolean> createUser(AddUserRequest request) {
    if (request.getAddress().isEmpty()
        || request.getFirstName().isEmpty()
        || request.getMiddleName().isEmpty()
        || request.getLastName().isEmpty()
        || request.getDob().isEmpty()
        || request.getNationalID().isEmpty()) {
      return new Response<>(UUID.randomUUID().toString(), false);
    }
    return new Response<>(UUID.randomUUID().toString(), userDto.createUser(request));
  }
}
