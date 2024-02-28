package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/user")
@Slf4j
@AllArgsConstructor
public class UserController {
  private final UserService userService;

  @GetMapping(
      value = "/get-all-user",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetAllUserResponse> getAllUser() {
    return userService.getAllUser();
  }

  @PostMapping(
      value = "/post-user",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<Boolean> createUser(@RequestBody AddUserRequest request) {
    log.info(request.toString());
    return userService.createUser(request);
  }
}
