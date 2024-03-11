package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.UserLogInDao;
import com.train.trainingmaterial.dto.UserLogInDto;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.model.request.user_account.LogInUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserLogInDtoImpl implements UserLogInDto {
  private final UserLogInDao userLogInDao;

  @Override
  public LogInUserResponse userLogIn(LogInUserRequest request) {
    return LogInUserResponse.builder()
        .success(userLogInDao.userLogIn(this.userAccountEntityFrom(request)))
        .build();
  }

  private UserAccountEntity userAccountEntityFrom(LogInUserRequest request) {
    return UserAccountEntity.builder()
        .account(request.getAccount())
        .password(request.getPassword())
        .build();
  }
}
