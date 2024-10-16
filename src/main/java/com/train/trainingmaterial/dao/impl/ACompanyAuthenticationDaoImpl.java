package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.AuthenticationDao;
import com.train.trainingmaterial.entity.CompanyA.AUserEntity;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.repository.CompanyA.AUserRepository;
import com.train.trainingmaterial.repository.UserRepository;
import java.time.LocalDate;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service("aCompanyAuthenticationDao")
@RequiredArgsConstructor
public class ACompanyAuthenticationDaoImpl implements AuthenticationDao {

  private final AUserRepository aUserRepository;
  private final UserRepository userRepository;

  @Override
  public UserAccountEntity logInUser(String account, String password) {
    return null;
  }

  @Override
  public UserAccountEntity registerUser(
      String firstName,
      String middleName,
      String lastName,
      String dob,
      String address,
      String nationalID,
      String account,
      String password) {
    return null;
  }

  @Override
  public boolean registerUser(
      String fullName,
      String citizenId,
      String address,
      LocalDate dob,
      String position,
      LocalDate startDay) {
    UserEntity userEntity = this.getUserByCitizenId(citizenId);
    AUserEntity aUserEntity =
        this.getAUserEntity(fullName, citizenId, address, dob, position, startDay, userEntity);
    aUserRepository.save(aUserEntity);
    return true;
  }

  private UserEntity getUserByCitizenId(String citizenId) {
    return userRepository.getByNationalId(citizenId).orElse(null);
  }

  private AUserEntity getAUserEntity(
      String fullName,
      String citizenId,
      String address,
      LocalDate dob,
      String position,
      LocalDate startDay,
      UserEntity userEntity) {
    return AUserEntity.builder()
        .fullName(fullName)
        .citizenId(citizenId)
        .address(address)
        .dob(dob)
        .position(position)
        .startDay(startDay)
        .userEntity(userEntity)
        .build();
  }
}
