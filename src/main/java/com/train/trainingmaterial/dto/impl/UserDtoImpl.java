package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.UserDao;
import com.train.trainingmaterial.dto.UserDto;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.model.response.user.UserDetailResponse;
import java.time.LocalDate;
import java.time.OffsetDateTime;
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
    for (UserEntity user : userDao.getAllUser()) {
      userDetails.add(
          UserDetailResponse.builder()
              .fullName(
                  user.getFirst_name() + " " + user.getMiddle_name() + " " + user.getLast_name())
              .age(Period.between(user.getDob(), LocalDate.now()).getYears())
              .nationalId(user.getNational_id())
              .build());
    }
    return new GetAllUserResponse(Long.valueOf(userDetails.size()), userDetails);
  }

  @Override
  public Boolean createUser(AddUserRequest request) {
    userDao.insertUser(
        UserEntity.builder()
            .first_name(request.getFirstName())
            .middle_name(request.getMiddleName())
            .last_name(request.getLastName())
            .national_id(request.getNationalID())
            .address(request.getAddress())
            .dob(LocalDate.parse(request.getDob()))
            .created(OffsetDateTime.now())
            .modified(OffsetDateTime.now())
            .created_by("Bao Nguyen")
            .modified_by("Bao Nguyen")
            .is_deleted(false)
            .build());
    return true;
  }
}
