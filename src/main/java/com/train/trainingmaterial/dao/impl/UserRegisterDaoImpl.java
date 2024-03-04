package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.entity.BaseEntity;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.OffsetDateTime;

@Repository
@AllArgsConstructor
public class UserRegisterDaoImpl implements UserRegisterDao {
    private final UserAccountRepository userAccountRepository;
    private final UserRepository userRepository;

    @Override
    public boolean registerUser(UserAccountEntity userAccount) {
        UserEntity userEntity = UserEntity.builder().build();
        userAccount.setUserEntity(userEntity);
        this.setUserForRegister(userEntity);
        userRepository.save(userEntity);
        this.saveDefaultField(userAccount);
        userAccountRepository.save(userAccount);
        return true;
    }

    private<T extends BaseEntity> void saveDefaultField(T entity){
        entity.setCreated(OffsetDateTime.now());
        entity.setModified(OffsetDateTime.now());
        entity.setCreatedBy("Bao Nguyen");
        entity.setModifiedBy("Bao Nguyen");
        entity.setDeleted(false);
    }

    private void setUserForRegister(UserEntity userEntity){
        userEntity.setFirstName("0");
        userEntity.setMiddleName("0");
        userEntity.setLastName("0");
        userEntity.setNationalId("0");
        userEntity.setAddress("0");
        userEntity.setDob(LocalDate.now());
        this.saveDefaultField(userEntity);
    }
}
