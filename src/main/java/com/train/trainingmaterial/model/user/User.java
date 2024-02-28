package com.train.trainingmaterial.model.user;

import java.time.LocalDate;
import lombok.*;

@RequiredArgsConstructor
@Getter
@Setter
public class User {
  private Long Id;
  private String firstName;
  private String middleName;
  private String lastName;
  private String nationalId;
  private String address;
  private LocalDate dob;
}
