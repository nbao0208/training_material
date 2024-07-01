package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserRegisterDao;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.GroupRepository;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.repository.UserGroupRepository;
import com.train.trainingmaterial.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class UserRegisterDaoImpl implements UserRegisterDao {
  private final UserAccountRepository userAccountRepository;
  private final UserRepository userRepository;
  private final UserGroupRepository userGroupRepository;
  private final GroupRepository groupRepository;

  @Override
  public boolean registerUser(UserAccountEntity userAccount, UserEntity userEntity) {
    //    GroupEntity groupEntity =
    //        groupRepository
    //            .findById(GroupID.STUDENT_ID)
    //            .orElseThrow(() -> new NullValueException("404 not found"));
    //    userRepository.save(userEntity);
    //    userGroupRepository.save(
    //        UserGroupEntity.builder().userEntity(userEntity).groupEntity(groupEntity).build());
    //    userAccount.setUserEntity(userEntity);
    //    userAccountRepository.save(userAccount);
    return true;
  }
}
