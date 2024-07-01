package com.train.trainingmaterial.config;

import com.train.trainingmaterial.shared.enums.Authority;
import com.train.trainingmaterial.shared.enums.Role;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@Slf4j
public class SecurityConfiguration {
  private final AuthenticationProvider authenticationProvider;
  private final JwtAuthenticationFilter jwtAuthenticationFilter;
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
    "/api/v1/authentication/**",
    "/api/v2/authentication/**",
  };

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    log.info("==========>Security Filter Chain");
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
              authorizationManagerRequestMatcherRegistry
                  .requestMatchers("/api/v1/user/**")
                  .hasAnyRole(Role.STUDENT.name(), Role.TEACHER.name())
                  .requestMatchers("/api/v1/user")
                  .hasAuthority(Authority.STUDENT_GET_INFO.getAuthority());

              authorizationManagerRequestMatcherRegistry
                  .requestMatchers("/api/v1/lesson/**")
                  .hasAnyRole(Role.STUDENT.name(), Role.TEACHER.name())
                  //
                  .requestMatchers(HttpMethod.GET, "/api/v1/lesson/*")
                  .hasAuthority(Authority.STUDENT_GET_LESSON.getAuthority())
                  //
//                  .requestMatchers(HttpMethod.POST, "/api/v1/lesson/create")
//                  .hasAuthority(Authority.TEACHER_POST_LESSON.getAuthority())
                  //
                  .requestMatchers(HttpMethod.PUT, "/api/v1/lesson/*")
                  .hasAuthority(Authority.TEACHER_UPDATE_LESSON.getAuthority())
                  //
                  .requestMatchers(HttpMethod.PUT, "/api/v1/lesson/cancel/*")
                  .hasAuthority(Authority.STUDENT_CANCEL_LESSON.getAuthority())
                  //
                  .requestMatchers(HttpMethod.PUT, "/api/v1/lesson/*/user/*/complete")
                  .hasAuthority(Authority.STUDENT_COMPLETE_LESSON.getAuthority())
                  //
                  .requestMatchers(HttpMethod.GET, "/api/v1/lesson/report")
                  .hasAuthority(Authority.STUDENT_GET_LESSON_REPORT.getAuthority());

              authorizationManagerRequestMatcherRegistry
                  .requestMatchers("/api/v1/test/**")
                  .hasAnyRole(Role.STUDENT.name(), Role.TEACHER.name())
                  //
                  .requestMatchers(HttpMethod.POST, "/api/v1/test/lesson/*/user/*")
                  .hasAuthority(Authority.TEACHER_POST_TEST.getAuthority())
                  //
                  .requestMatchers(HttpMethod.PUT, "/api/v1/test/*/user/*")
                  .hasAuthority(Authority.TEACHER_UPDATE_TEST.getAuthority())
                  //
                  .requestMatchers(HttpMethod.GET, "/api/v1/test/*")
                  .hasAuthority(Authority.STUDENT_GET_TEST.getAuthority())
                  //
                  .requestMatchers(HttpMethod.PUT, "/api/v1/test/*/lesson/*")
                  .hasAuthority(Authority.STUDENT_SUBMIT_TEST.getAuthority())
                  //
                  .requestMatchers(HttpMethod.GET, "/api/v1/test/*/lesson/*/show-detailed-results")
                  .hasAuthority(Authority.STUDENT_GET_TEST_RESULT.getAuthority())
                  //
                  .requestMatchers(HttpMethod.GET, "/api/v1/test/report")
                  .hasAuthority(Authority.STUDENT_GET_TEST_REPORT.getAuthority());

              authorizationManagerRequestMatcherRegistry
                  .requestMatchers("/api/v1/rating/**")
                  .hasAnyRole(Role.STUDENT.name(), Role.TEACHER.name())
                  //
                  .requestMatchers(HttpMethod.POST, "/api/v1/rating/")
                  .hasAuthority(Authority.STUDENT_POST_RATING.getAuthority())
                  //
                  ;
              //the rest request should go through the filters
              authorizationManagerRequestMatcherRegistry.requestMatchers(HttpMethod.POST, "/api/v1/lesson/create")
                      .hasAuthority(Authority.TEACHER_POST_LESSON.getAuthority()).anyRequest().authenticated();
            })
        // Add the authentication provider for helping authenticate
        .authenticationProvider(authenticationProvider)
        // Add jwt filter before the UPA filter
        .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
        .build();
  }
}
