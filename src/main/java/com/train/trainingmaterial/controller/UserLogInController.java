package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.userAuth.LogInUserRequest;
import com.train.trainingmaterial.model.response.user_account.LogInUserResponse;
import com.train.trainingmaterial.service.UserLogInService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1/log_in/user")
@AllArgsConstructor
@Slf4j
public class UserLogInController {
  private final UserLogInService userLogInService;

  @GetMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<LogInUserResponse> userLogIn(@Valid @RequestBody LogInUserRequest request) {
    //    return userLogInService.userLogIn(request);
    return null;
  }
}
