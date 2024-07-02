package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.AuthenticationDao;
import com.train.trainingmaterial.entity.GroupEntity;
import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.entity.UserGroupEntity;
import com.train.trainingmaterial.repository.GroupRepository;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.repository.UserGroupRepository;
import com.train.trainingmaterial.repository.UserRepository;
import com.train.trainingmaterial.shared.constants.GroupID;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.time.LocalDate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthenticationDaoImpl implements AuthenticationDao {
  private final UserAccountRepository userAccountRepository;
  private final AuthenticationManager authenticationManager;
  private final UserRepository userRepository;
  private final UserGroupRepository userGroupRepository;
  private final GroupRepository groupRepository;

  @Override
  public UserAccountEntity logInUser(String account, String password) {
    // authentication manager receive UPAT to forward to the provider for authenticating
    authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(account, password));
    return this.getUserAccountEntityByUsername(account);
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
    return this.saveRegisteredUser(
        firstName, middleName, lastName, dob, address, nationalID, account, password);
  }

  private UserAccountEntity getUserAccountEntityByUsername(String username) {
    return userAccountRepository
        .findByAccount(username)
        .orElseThrow(() -> new UsernameNotFoundException("User not found"));
  }

  private UserAccountEntity saveRegisteredUser(
      String firstName,
      String middleName,
      String lastName,
      String dob,
      String address,
      String nationalID,
      String account,
      String password) {
    UserEntity userEntity =
        userRepository.save(
            this.buildUserEntityBy(firstName, middleName, lastName, dob, address, nationalID));
    log.info("Saved user: " + userEntity);

    UserGroupEntity userGroupEntity =
        userGroupRepository.save(this.buildUserGroupEntityBy(userEntity));
    log.info("======>userGroupEntity: " + userGroupEntity);

    return userAccountRepository.save(
        UserAccountEntity.builder()
            .userGroupEntity(userGroupEntity)
            .account(account)
            .password(this.passwordEncode(password))
            .build());
  }

  private String passwordEncode(String password) {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    return encoder.encode(password);
  }

  private UserEntity buildUserEntityBy(
      String firstName,
      String middleName,
      String lastName,
      String dob,
      String address,
      String nationalID) {
    return UserEntity.builder()
        .firstName(firstName)
        .middleName(middleName)
        .lastName(lastName)
        .dob(LocalDate.parse(dob))
        .address(address)
        .nationalId(nationalID)
        .build();
  }

  private UserGroupEntity buildUserGroupEntityBy(UserEntity userEntity) {
    GroupEntity groupEntity =
        groupRepository
            .findById(GroupID.STUDENT_ID)
            .orElseThrow(() -> new NullValueException("Group not found"));
    return UserGroupEntity.builder().userEntity(userEntity).groupEntity(groupEntity).build();
  }
}
