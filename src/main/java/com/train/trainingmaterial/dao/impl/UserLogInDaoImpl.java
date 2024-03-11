package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserLogInDao;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserLogInDaoImpl implements UserLogInDao {
  private final UserAccountRepository userAccountRepository;

  @Override
  public boolean userLogIn(UserAccountEntity userAccount) {
    UserAccountEntity userAccountInDb =
        userAccountRepository.findByAccount(userAccount.getAccount()).orElse(null);
    if (userAccountInDb == null) {
      return false;
    }
    return userAccount.getPassword().equals(userAccountInDb.getPassword());
  }
}
