package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import org.springframework.stereotype.Service;

@Service
public interface UserRegisterDao {
  boolean registerUser(UserAccountEntity userAccount, UserEntity userEntity);
}
