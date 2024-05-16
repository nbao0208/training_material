package com.train.trainingmaterial.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

  private static final String[] AUTH_WHITELIST = {
    // Swagger
    "/api-docs",
    "/v3/api-docs",
    "/api-docs/**",
    "/v3/api-docs/**",
    "/swagger-ui/**",
    "/swagger-resources",
    "/swagger-resources/**",
    "/configuration/ui",
    "/configuration/security",
    "/swagger-ui.html",
    "/webjars/**",

    // Actuator
    "/actuator/**",

    // Debug
    "/debug/**",

    // Will remove when integrate with Keycloak
    "/api/v1/**",
    "/api/v2/**"
  };

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    return http
        // CORS configuration
        .cors(AbstractHttpConfigurer::disable)

        // CSRF configuration
        .csrf(AbstractHttpConfigurer::disable)

        // Disable Session for every request
        .sessionManagement(
            sessionManagement ->
                sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

        // Disable default login form
        .formLogin(AbstractHttpConfigurer::disable)
        .httpBasic(AbstractHttpConfigurer::disable)

        // Add filters
        .authorizeHttpRequests(
            authorizationManagerRequestMatcherRegistry -> {
              authorizationManagerRequestMatcherRegistry
                  .requestMatchers(AUTH_WHITELIST)
                  .permitAll();
              authorizationManagerRequestMatcherRegistry.anyRequest().authenticated();
            })
        .build();
  }
}
