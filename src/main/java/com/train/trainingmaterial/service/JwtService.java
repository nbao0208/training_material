package com.train.trainingmaterial.service;

import com.train.trainingmaterial.entity.UserAccountEntity;
import com.train.trainingmaterial.repository.UserAccountRepository;
import com.train.trainingmaterial.shared.constants.TokenSecretInformation;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class JwtService {
  private final UserAccountRepository userAccountRepository;

  public String generateJwtToken(Map<String, Object> claims, UserAccountEntity user) {
    return Jwts.builder()
        .setClaims(claims)
        .setSubject(user.getUsername())
        .setIssuedAt(new Date())
        .setExpiration(new Date(TokenSecretInformation.EXPIRATION_TIME))
        .setId(user.getId().toString())
        .signWith(this.getSignInKey(), SignatureAlgorithm.HS256)
        .compact();
  }

  public String generateJwtToken(UserAccountEntity user) {
    return this.generateJwtToken(new HashMap<>(), user);
  }

  public boolean isTokenValid(String token) {
    UserAccountEntity user = userAccountRepository.findByAccount(this.extractUsername(token)).orElseThrow(()-> new UsernameNotFoundException("User not found"));
    log.info("=====>user account: " + user);
    return !this.isTokenExpired(token);
  }

  public boolean isTokenExpired(String token) {
    return this.extractExpirationTime(token).before(new Date());
  }

  public String extractId(String token) {
    return this.extractClaim(token, Claims::getId);
  }

  public Date extractExpirationTime(String token) {
    return this.extractClaim(token, Claims::getExpiration);
  }

  public String extractUsername(String token) {
    return this.extractClaim(token, Claims::getSubject);
  }

  private <T> T extractClaim(String token, Function<Claims, T> extract) {
    Claims claims = this.extractAllClaims(token);
    return extract.apply(claims);
  }

  private Claims extractAllClaims(String token) {
    return Jwts.parserBuilder()
        .setSigningKey(this.getSignInKey())
        .build()
        .parseClaimsJws(token)
        .getBody();
  }

  private Key getSignInKey() {
    byte[] keyBytes = Decoders.BASE64.decode(TokenSecretInformation.SIGNATURE_KEY);
    return Keys.hmacShaKeyFor(keyBytes);
  }
}
