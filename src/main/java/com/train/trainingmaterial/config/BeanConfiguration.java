package com.train.trainingmaterial.config;

import com.train.trainingmaterial.repository.UserAccountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
public class BeanConfiguration {
  private final UserAccountRepository userAccountRepository;

  @Bean
  public UserDetailsService userDetailsService() {
    return username ->
        userAccountRepository
            .findByAccount(username)
            .orElseThrow(() -> new UsernameNotFoundException("User not found"));
  }

  // get the authentication manager from spring and then put it like a bean
  @Bean
  public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration)
      throws Exception {
    return configuration.getAuthenticationManager();
  }

  @Bean
  public AuthenticationProvider authenticationProvider() {
    DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
    // method help provider take user info
    authenticationProvider.setUserDetailsService(this.userDetailsService());
    // encode the password and then compare with the password in database has taken by bean
    // userDetailService
    authenticationProvider.setPasswordEncoder(this.passwordEncoder());
    return authenticationProvider;
  }

  private PasswordEncoder passwordEncoder() {
    // using Bcrypt password encoder
    return new BCryptPasswordEncoder();
  }
}
