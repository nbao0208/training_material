package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.entity.BaseEntity;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.repository.UserRepository;
import java.time.OffsetDateTime;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserRegisterDaoImpl implements UserRegisterDao {
  private final UserAccountRepository userAccountRepository;
  private final UserRepository userRepository;

  @Override
  public boolean registerUser(UserAccountEntity userAccount, UserEntity userEntity) {
    this.saveDefaultField(userEntity);
    userRepository.save(userEntity);
    this.saveDefaultField(userAccount);
    userAccount.setUserEntity(userEntity);
    userAccountRepository.save(userAccount);
    return true;
  }

  private <T extends BaseEntity> void saveDefaultField(T entity) {
    entity.setCreated(OffsetDateTime.now());
    entity.setModified(OffsetDateTime.now());
    entity.setCreatedBy("Bao Nguyen");
    entity.setModifiedBy("Bao Nguyen");
    entity.setDeleted(false);
  }


}
