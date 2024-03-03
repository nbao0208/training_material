package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.UserDao;
import com.train.trainingmaterial.dto.UserDto;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.request.user.BaseUserRequest;
import com.train.trainingmaterial.model.request.user.UpdateUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.model.response.user.UserDetailResponse;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserDtoImpl implements UserDto {
  private final UserDao userDao;

  @Override
  public GetAllUserResponse getAllUser() {
    List<UserDetailResponse> userDetails = new ArrayList<>();
    List<UserEntity> userEntities = this.userDao.getAllUser();

    for (UserEntity user : userEntities) {
      userDetails.add(this.toUserDetailResponse(user));
    }

    return GetAllUserResponse.builder().total(userDetails.size()).userDetails(userDetails).build();
  }

  private UserDetailResponse toUserDetailResponse(UserEntity userEntity) {
    return UserDetailResponse.builder()
        .fullName(
            this.toFullName(
                userEntity.getFirstName(), userEntity.getMiddleName(), userEntity.getLastName()))
        .age(this.toAge(userEntity.getDob()))
        .nationalId(userEntity.getNationalId())
        .build();
  }

  private String toFullName(String firstName, String middleName, String lastName) {
    return firstName + " " + middleName + " " + lastName;
  }

  private int toAge(LocalDate dob) {
    return Period.between(dob, LocalDate.now()).getYears();
  }

  @Override
  public boolean createUser(AddUserRequest request) {
    userDao.insertUser(this.requestToUserEntity(request));
    return true;
  }

  @Override
  public boolean updateUser(UpdateUserRequest request, Long userId) {
    return userDao.updateUser(this.requestToUserEntity(request), userId);
  }

  @Override
  public boolean deleteUser(Long userId){
    return userDao.deleteUser(userId);
  }

  private <T extends BaseUserRequest> UserEntity requestToUserEntity(T request) {
    return UserEntity.builder()
        .firstName(request.getFirstName())
        .middleName(request.getMiddleName())
        .lastName(request.getLastName())
        .nationalId(request.getNationalID())
        .address(request.getAddress())
        .dob(request.getDob() != null ? LocalDate.parse(request.getDob()) : null)
        .build();
  }
}
