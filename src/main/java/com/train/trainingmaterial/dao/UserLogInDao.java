package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.UserAccountEntity;
import org.springframework.stereotype.Service;

@Service
public interface UserLogInDao {
  boolean userLogIn(UserAccountEntity userAccount);
}
