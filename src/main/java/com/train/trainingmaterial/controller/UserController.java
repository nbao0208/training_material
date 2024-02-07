package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.response.user.GetAllUserResponse;
import com.train.trainingmaterial.model.response.user.UserDetailResponse;
import java.util.List;
import java.util.UUID;
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
    return Response.<GetAllUserResponse>builder()
        .id(String.valueOf(UUID.randomUUID()))
        .data(
            GetAllUserResponse.builder()
                .userDetails(
                    List.of(
                        UserDetailResponse.builder()
                            .fullName("Nguyen Van A")
                            .age(18)
                            .nationalId("123456789")
                            .build()))
                .total(1)
                .build())
        .build();
  }
}
