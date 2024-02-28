package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.UserEntity;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface UserDao {
  List<UserEntity> getAllUser();

  void insertUser(UserEntity userEntity);
}
