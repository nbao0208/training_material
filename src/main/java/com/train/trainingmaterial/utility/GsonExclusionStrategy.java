package com.train.trainingmaterial.utility;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.train.trainingmaterial.shared.annotation.GsonExclude;
import java.util.List;

public class GsonExclusionStrategy implements ExclusionStrategy {

  private final List<String> ignoredFieldNames;

  public GsonExclusionStrategy() {
    ignoredFieldNames = null;
  }

  public GsonExclusionStrategy(List<String> ignoredFields) {
    ignoredFieldNames = ignoredFields.stream().map(String::toLowerCase).toList();
  }

  @Override
  public boolean shouldSkipField(FieldAttributes fieldAttributes) {
    boolean isAnnotated = fieldAttributes.getAnnotation(GsonExclude.class) != null;

    if (isAnnotated) {
      return true;
    }

    if (ignoredFieldNames == null) {
      return false;
    }

    for (String name : ignoredFieldNames) {
      if (fieldAttributes.getName().toLowerCase().contains(name)) {
        return true;
      }
    }

    return false;
  }

  @Override
  public boolean shouldSkipClass(Class<?> aClass) {
    return false;
  }
}
