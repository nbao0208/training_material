package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.UserDao;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.UserRepository;
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
}
