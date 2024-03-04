package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.dto.UserRegisterDto;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.model.request.user_account.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
@AllArgsConstructor
public class UserRegisterDtoImpl implements UserRegisterDto {
  private final UserRegisterDao userRegisterDao;

  @Override
  public RegisterUserResponse registerUser(RegisterUserRequest request) {
    return RegisterUserResponse.builder()
        .success(userRegisterDao.registerUser(this.generateUserAccountFrom(request),this.generateUserEntityFrom(request)))
        .build();
  }

  private UserAccountEntity generateUserAccountFrom(RegisterUserRequest request) {
    return UserAccountEntity.builder()
        .account(request.getAccount())
        .password(request.getPassword())
        .build();
  }

  private UserEntity generateUserEntityFrom(RegisterUserRequest request){
    return UserEntity.builder().firstName(request.getFirstName()).middleName(request.getMiddleName()).lastName(request.getLastName()).dob(LocalDate.parse(request.getDob())).address(request.getAddress()).nationalId(request.getNationalID()).build();
  }
}
