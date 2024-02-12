package com.train.trainingmaterial.config;

import com.google.gson.ExclusionStrategy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializer;
import com.train.trainingmaterial.utility.GsonExclusionStrategy;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
public class CommonBeans {
  public static final JsonSerializer<LocalDateTime> LOCAL_DATE_TIME_SERIALIZER =
      (localDateTime, type, jsonSerializationContext) ->
          new JsonPrimitive(localDateTime.toString());
  public static final JsonDeserializer<LocalDateTime> LOCAL_DATE_TIME_DE_SERIALIZER =
      (jsonElement, type, jsonDeserializationContext) ->
          OffsetDateTime.parse(jsonElement.getAsJsonPrimitive().getAsString()).toLocalDateTime();
  public static final JsonSerializer<OffsetDateTime> OFFSET_DATE_TIME_SERIALIZER =
      (offsetDateTime, type, jsonSerializationContext) ->
          new JsonPrimitive(offsetDateTime.toString());
  public static final JsonDeserializer<OffsetDateTime> OFFSET_DATE_TIME_DE_SERIALIZER =
      (jsonElement, type, jsonDeserializationContext) ->
          OffsetDateTime.parse(jsonElement.getAsJsonPrimitive().getAsString());
  public static final ExclusionStrategy TRIM_EXCLUSION_STRATEGY = new GsonExclusionStrategy();

  @Bean("gsonWithTrim")
  public Gson gsonWithTrim() {
    JsonSerializer<String> stringSerializer =
        (s, type, jsonSerializationContext) -> {
          if (s.length() <= 255) {
            return new JsonPrimitive(s);
          }

          String prefix = StringUtils.left(s, 10);
          String suffix = StringUtils.right(s, 10);
          String truncatedString = prefix + "**********" + suffix;

          return new JsonPrimitive(truncatedString);
        };

    return new GsonBuilder()
        .setExclusionStrategies(TRIM_EXCLUSION_STRATEGY)
        .registerTypeHierarchyAdapter(String.class, stringSerializer)
        .registerTypeHierarchyAdapter(LocalDateTime.class, LOCAL_DATE_TIME_SERIALIZER)
        .registerTypeHierarchyAdapter(LocalDateTime.class, LOCAL_DATE_TIME_DE_SERIALIZER)
        .registerTypeHierarchyAdapter(OffsetDateTime.class, OFFSET_DATE_TIME_SERIALIZER)
        .registerTypeHierarchyAdapter(OffsetDateTime.class, OFFSET_DATE_TIME_DE_SERIALIZER)
        .create();
  }
}
