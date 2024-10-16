package com.train.trainingmaterial.model.request.userAuth;

import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterAUserRequest {
  @NotNull private String username;
  @NotNull private String password;
  @NotNull private String confirmPassword;
  @NotNull private String fullName;
  @NotNull private String citizenId;
  @NotNull private String address;
  @NotNull private LocalDate dob;
  @NotNull private String position;
  @NotNull private LocalDate startDay;
}
