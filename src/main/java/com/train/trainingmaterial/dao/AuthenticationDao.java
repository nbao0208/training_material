package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.UserAccountEntity;
import java.time.LocalDate;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationDao {
  UserAccountEntity logInUser(String account, String password);

  UserAccountEntity registerUser(
      String firstName,
      String middleName,
      String lastName,
      String dob,
      String address,
      String nationalID,
      String account,
      String password);

  boolean registerUser(
      String fullName,
      String citizenId,
      String address,
      LocalDate dob,
      String position,
      LocalDate startDay);
}
