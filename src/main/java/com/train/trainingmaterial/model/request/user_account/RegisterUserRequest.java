package com.train.trainingmaterial.model.request.user_account;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RegisterUserRequest {
    private String account;
    private String password;
    private String rewritePassword;
}
