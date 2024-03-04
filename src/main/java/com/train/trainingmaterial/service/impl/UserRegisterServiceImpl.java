package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.UserRegisterDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user_account.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.UserRegisterService;
import com.train.trainingmaterial.shared.exception.NotSamePasswordException;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserRegisterServiceImpl implements UserRegisterService {
  private final UserRegisterDto userRegisterDto;

  @Override
  public Response<RegisterUserResponse> registerUser(RegisterUserRequest request) {
    if (!this.isSameBetween(request.getPassword(), request.getRewritePassword())) {
      throw new NotSamePasswordException(
          request.getRewritePassword() + " is not same as " + request.getPassword());
    }
    return Response.<RegisterUserResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(userRegisterDto.registerUser(request))
        .build();
  }

  private boolean isSameBetween(String password, String rewritePassword) {
    return password.equals(rewritePassword);
  }
}
