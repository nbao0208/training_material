package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserRegisterDaoImpl implements UserRegisterDao {
  private final UserAccountRepository userAccountRepository;
  private final UserRepository userRepository;

  @Override
  public boolean registerUser(UserAccountEntity userAccount, UserEntity userEntity) {
    userRepository.save(userEntity);
    userAccount.setUserEntity(userEntity);
    userAccountRepository.save(userAccount);
    return true;
  }
}
