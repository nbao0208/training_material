package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserDao;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.UserRepository;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {
  private final UserRepository userRepository;

  public List<UserEntity> getAllUser() {
    return userRepository.findAll();
  }

  @Override
  public void insertUser(UserEntity userEntity) {
    userRepository.save(userEntity);
  }

  @Override
  public boolean updateUser(UserEntity user, Long userId) {
    UserEntity userInDB =
        userRepository
            .findById(userId)
            .orElseThrow(() -> new NullValueException("Don't exist user with id " + userId));
    if (user.getFirstName() != null) {
      userInDB.setFirstName(user.getFirstName());
    }
    if (user.getMiddleName() != null) {
      userInDB.setMiddleName(user.getMiddleName());
    }
    if (user.getLastName() != null) {
      userInDB.setLastName(user.getLastName());
    }
    if (user.getDob() != null) {
      userInDB.setDob(user.getDob());
    }
    if (user.getAddress() != null) {
      userInDB.setAddress(user.getAddress());
    }
    if (user.getNationalId() != null) {
      userInDB.setNationalId(user.getNationalId());
    }
    userRepository.save(userInDB);
    return true;
  }

  @Override
  public boolean deleteUser(Long userId) {
    UserEntity userInDB =
        userRepository
            .findById(userId)
            .orElseThrow(() -> new NullValueException("Don't exist user with id " + userId));
    userInDB.setDeleted(true);
    userRepository.save(userInDB);
    return true;
  }
}
