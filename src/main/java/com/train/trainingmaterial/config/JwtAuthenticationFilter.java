package com.train.trainingmaterial.config;

import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.service.JwtService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@RequiredArgsConstructor
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {
  private final JwtService jwtService;
  private final UserAccountRepository userAccountRepository;

  @Override
  protected void doFilterInternal(
          HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull FilterChain filterChain)
      throws ServletException, IOException {
    final String authorizationHeaderField = request.getHeader("Authorization");
    if (authorizationHeaderField == null || !authorizationHeaderField.startsWith("Bearer ")) {
      filterChain.doFilter(request, response);
      return;
    }

    String jwt = authorizationHeaderField.substring("Bearer ".length());
    if (!jwtService.isTokenValid(jwt)) {
      filterChain.doFilter(request, response);
      return;
    }

    UserAccountEntity userAccount = userAccountRepository.findByAccount(jwtService.extractUsername(jwt)).orElseThrow(()-> new UsernameNotFoundException("User not found"));
    if (SecurityContextHolder.getContext().getAuthentication() == null) {
      UsernamePasswordAuthenticationToken authenticatedToken =
          new UsernamePasswordAuthenticationToken(userAccount, null, userAccount.getAuthorities());
      // catch IP and address of request's location
      authenticatedToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
      // for next filter to save this authenticated one to know user role and authorities
      SecurityContextHolder.getContext().setAuthentication(authenticatedToken);
      log.info("======>Security Context: " + SecurityContextHolder.getContext().getAuthentication().toString());
    }
    filterChain.doFilter(request, response);
  }
}
