package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.dto.UserRegisterDto;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.model.request.user_account.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserRegisterDtoImpl implements UserRegisterDto {
    private final UserRegisterDao userRegisterDao;
    @Override
    public RegisterUserResponse registerUser(RegisterUserRequest request) {
        return RegisterUserResponse.builder().success(userRegisterDao.registerUser(this.generateFrom(request))).build();
    }
    private UserAccountEntity generateFrom(RegisterUserRequest request){
        return UserAccountEntity.builder().account(request.getAccount()).password(request.getPassword()).build();
    }
}
