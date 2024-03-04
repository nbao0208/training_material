package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.UserDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.request.user.UpdateUserRequest;
import com.train.trainingmaterial.model.response.user.AddUserResponse;
import com.train.trainingmaterial.model.response.user.DeleteUserResponse;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.model.response.user.UpdateUserResponse;
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
    return Response.<GetAllUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(userDto.getAllUser())
        .build();
  }

  @Override
  public Response<AddUserResponse> createUser(AddUserRequest request) {
    if (this.hasFieldNull(request)) {
      return Response.<AddUserResponse>builder()
          .id(UUID.randomUUID().toString())
          .data(AddUserResponse.builder().success(false).build())
          .build();
    }
    return Response.<AddUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(AddUserResponse.builder().success(userDto.createUser(request)).build())
        .build();
  }

  private boolean hasFieldNull(AddUserRequest request) {
    return request.getAddress() == null
        || request.getFirstName() == null
        || request.getMiddleName() == null
        || request.getLastName() == null
        || request.getDob() == null
        || request.getNationalID() == null;
  }

  @Override
  public Response<UpdateUserResponse> updateUser(UpdateUserRequest request, Long userID) {
    return Response.<UpdateUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(UpdateUserResponse.builder().success(userDto.updateUser(request, userID)).build())
        .build();
  }

  @Override
  public Response<DeleteUserResponse> deleteUser(Long userId) {
    return Response.<DeleteUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(DeleteUserResponse.builder().success(userDto.deleteUser(userId)).build())
        .build();
  }

}
