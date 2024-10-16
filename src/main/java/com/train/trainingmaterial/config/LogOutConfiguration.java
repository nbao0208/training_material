package com.train.trainingmaterial.config;

import com.train.trainingmaterial.service.JwtService;
import com.train.trainingmaterial.shared.constants.CacheNames;
import com.train.trainingmaterial.shared.constants.ErrorMessage;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.CacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@RequiredArgsConstructor
public class LogOutConfiguration {
  private final CacheManager cacheManager;
  private final JwtService jwtService;

  @Bean
  public LogoutHandler logoutHandler() {
    return (request, response, authentication) -> {
      String authorization = request.getHeader("Authorization");
      if (authorization == null || !authorization.startsWith("Bearer ")) {
        throw new BadCredentialsException(ErrorMessage.INVALID_TOKEN);
      }

      String token = authorization.substring(7);
      String userId = jwtService.extractId(token);
      var tokenCache = cacheManager.getCache(CacheNames.TOKEN_CACHE);
      assert tokenCache != null;

      if (!jwtService.isTokenValid(token) || tokenCache.get(userId) == null) {
        throw new BadCredentialsException(ErrorMessage.INVALID_TOKEN);
      }
      // delete the cache of token or can mean that's the request's life
      tokenCache.evict(userId);
      // clear the security context of last request(user)
      SecurityContextHolder.clearContext();
    };
  }

  @Bean
  public LogoutSuccessHandler logoutSuccessHandler() {
    return (request, response, authentication) -> {
      response.setStatus(HttpServletResponse.SC_OK);
      response.getWriter().write("Log out successful");
    };
  }
}
