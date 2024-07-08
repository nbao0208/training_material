package com.train.trainingmaterial.config;

import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.service.JwtService;
import com.train.trainingmaterial.shared.constants.CacheNames;
import com.train.trainingmaterial.shared.constants.WhiteListRequest;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
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
  private final CacheManager cacheManager;

  @Override
  protected void doFilterInternal(
      HttpServletRequest request,
      @NonNull HttpServletResponse response,
      @NonNull FilterChain filterChain)
      throws ServletException, IOException {
    final String requestURI = request.getRequestURI();
    //any request satisfy with the condition is requestURI start with will return true, otherwise return false
    if (Arrays.stream(WhiteListRequest.WHITE_LIST).anyMatch(whiteRequest->requestURI.startsWith(whiteRequest))){
      filterChain.doFilter(request, response);
      return;
    }
    final String authorizationHeaderField = request.getHeader("Authorization");
    if (authorizationHeaderField == null || !authorizationHeaderField.startsWith("Bearer ")) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      response.getWriter().write("Invalid JWT token");
      throw new ServletException("Invalid JWT token");
    }

    String jwt = authorizationHeaderField.substring("Bearer ".length());
    String userId = jwtService.extractId(jwt);
    var tokenCache = cacheManager.getCache(CacheNames.TOKEN_CACHE);
    assert tokenCache != null;

    if (!jwtService.isTokenValid(jwt) || tokenCache.get(userId) == null) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      response.getWriter().write("Invalid token or maybe out of permissions");
      throw new ServletException("Invalid token or maybe out of permissions");
    }

    UserAccountEntity userAccount =
        userAccountRepository
            .findByAccount(jwtService.extractUsername(jwt))
            .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    if (SecurityContextHolder.getContext().getAuthentication() == null) {
      UsernamePasswordAuthenticationToken authenticatedToken =
          new UsernamePasswordAuthenticationToken(userAccount, null, userAccount.getAuthorities());
      // catch IP and address of request's location
      authenticatedToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
      // for next filter to save this authenticated one to know user role and authorities
      SecurityContextHolder.getContext().setAuthentication(authenticatedToken);
      log.info(
          "======>Security Context: "
              + SecurityContextHolder.getContext().getAuthentication().toString());
    }
    filterChain.doFilter(request, response);
  }
}
