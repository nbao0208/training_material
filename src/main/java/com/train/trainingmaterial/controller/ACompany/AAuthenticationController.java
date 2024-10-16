package com.train.trainingmaterial.controller.ACompany;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.RegisterAUserRequest;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1/company/A/authentication")
@RequiredArgsConstructor
@Slf4j
public class AAuthenticationController {
  private final AuthenticationService aCompanyAuthenticationService;

  @PostMapping(
      value = "/register",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<RegisterUserResponse> register(@Valid @RequestBody RegisterAUserRequest request) {
    return aCompanyAuthenticationService.registerAUser(request);
  }
}
