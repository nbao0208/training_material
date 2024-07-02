package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.request.userAuth.RegisterUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.model.response.user_account.RegisterUserResponse;
import com.train.trainingmaterial.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/authentication")
@RequiredArgsConstructor
public class AuthenticationController {
  private final AuthenticationService authenticationService;

  @GetMapping(value = "/logIn", produces = (MediaType.APPLICATION_JSON_VALUE))
  public Response<LogInUserResponse> logInUser(@Valid @RequestBody LogInUserRequest request) {
    return authenticationService.logInUser(request);
  }

  @PostMapping(
      value = "/register",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<RegisterUserResponse> registerUser(
      @Valid @RequestBody RegisterUserRequest request) {
    return authenticationService.registerUser(request);
  }
}
