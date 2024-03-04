package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.user.AddUserRequest;
import com.train.trainingmaterial.model.request.user.UpdateUserRequest;
import com.train.trainingmaterial.model.response.user.*;
import com.train.trainingmaterial.service.UserService;
import jakarta.validation.Valid;
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
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetAllUserResponse> getAllUser() {
    return userService.getAllUser();
  }

  @PostMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AddUserResponse> createUser(@Valid @RequestBody AddUserRequest request) {
    log.info("===> request" + request.toString());
    return userService.createUser(request);
  }

  @PutMapping(
      value = "/{user_id}",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<UpdateUserResponse> updateUser(
      @PathVariable(value = "user_id") Long userId, @RequestBody UpdateUserRequest request) {
    log.info(request.toString());
    return userService.updateUser(request, userId);
  }

  @DeleteMapping(value = "/{user_id}")
  public Response<DeleteUserResponse> deleteUser(@PathVariable(name = "user_id") Long userId) {
    return userService.deleteUser(userId);
  }
}
