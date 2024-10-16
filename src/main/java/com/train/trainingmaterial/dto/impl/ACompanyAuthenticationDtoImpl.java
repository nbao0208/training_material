package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.AuthenticationDao;
import com.train.trainingmaterial.dto.AuthenticationDto;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterAUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.shared.constants.ErrorMessage;
import com.train.trainingmaterial.shared.enums.ErrorCodes;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service("aCompanyAuthenticationDto")
@RequiredArgsConstructor
public class ACompanyAuthenticationDtoImpl implements AuthenticationDto {
  private final AuthenticationDao aCompanyAuthenticationDao;
  private final AuthenticationDto authenticationDto;

  @Override
  public LogInUserResponse logInUser(LogInUserRequest request) {
    return null;
  }

  @Override
  public RegisterUserResponse registerUser(RegisterUserRequest request) {
    return null;
  }

  @Override
  public RegisterUserResponse registerUser(RegisterAUserRequest request) {
    RegisterUserRequest registerUserRequest = this.transferFrom(request);
    RegisterUserResponse registerUserResponse = authenticationDto.registerUser(registerUserRequest);
    if (!aCompanyAuthenticationDao.registerUser(
        request.getFullName(),
        request.getCitizenId(),
        request.getAddress(),
        request.getDob(),
        request.getPosition(),
        request.getStartDay())) {
      throw new WrongValueException(ErrorMessage.AUTHENTICATE_FAILED, ErrorCodes.AUTHENTICATION_ERROR);
    }
    return registerUserResponse;
  }

  private RegisterUserRequest transferFrom(RegisterAUserRequest request) {
    RegisterUserRequest result =
        RegisterUserRequest.builder()
            .dob(request.getDob().toString())
            .address(request.getAddress())
            .nationalID(request.getCitizenId())
            .account(request.getUsername())
            .password(request.getPassword())
            .rewritePassword(request.getConfirmPassword())
            .address(request.getAddress())
            .build();
    String[] nameElements = request.getFullName().split(" ");
    if (nameElements.length == 1) {
      result.setFirstName(nameElements[0]);
      result.setMiddleName(" ");
      result.setLastName(" ");
    } else if (nameElements.length == 2) {
      result.setFirstName(nameElements[0]);
      result.setMiddleName(nameElements[1]);
      result.setLastName(" ");
    } else {
      result.setFirstName(nameElements[0]);
      result.setMiddleName(nameElements[1]);
      result.setLastName(
          request
              .getFullName()
              .substring(
                  request.getFullName().indexOf(nameElements[1]) + nameElements[1].length()));
    }
    return result;
  }
}
