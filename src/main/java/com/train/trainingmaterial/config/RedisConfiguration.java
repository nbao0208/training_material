package com.train.trainingmaterial.config;

import com.train.trainingmaterial.shared.constants.CacheNames;
import com.train.trainingmaterial.shared.constants.TokenSecretInformation;
import java.time.Duration;
import java.util.Map;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;

@Configuration
public class RedisConfiguration {
  // Define a bean of type "redis cache" and it's a manager to manage the type of cache saving in
  // redis
  // The RedisConnectionFactory is come from the config in application.yml
  @Bean
  public RedisCacheManager redisCacheManager(RedisConnectionFactory redisConnectionFactory) {
    RedisCacheConfiguration defaultCacheConfiguration =
        RedisCacheConfiguration.defaultCacheConfig()
            .entryTtl(Duration.ofHours(1))
            // serialize the value to json when saving in redis cache
            .serializeValuesWith(
                RedisSerializationContext.SerializationPair.fromSerializer(
                    new GenericJackson2JsonRedisSerializer()))
            .disableCachingNullValues();

    Map<String, RedisCacheConfiguration> multipleCachesConfiguration =
        Map.of(
            CacheNames.LESSON_CACHE, defaultCacheConfiguration.entryTtl(Duration.ofHours(1)),
            CacheNames.TEST_CACHE, defaultCacheConfiguration.entryTtl(Duration.ofHours(1)),
            CacheNames.TOKEN_CACHE,
                defaultCacheConfiguration.entryTtl(
                    Duration.ofMillis(TokenSecretInformation.EXPIRED)));

    // create the cache manager of the redis connection factory to manage redis caches
    return RedisCacheManager.builder(redisConnectionFactory)
        .cacheDefaults(defaultCacheConfiguration)
        .withInitialCacheConfigurations(multipleCachesConfiguration)
        .build();
  }
}
