package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.response.GetAllUserResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/user")
@Slf4j
public class UserController {
  @GetMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<GetAllUserResponse> getAllUser() {
    log.info(
        "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    log.info(
        "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");

    return null;
  }
}
