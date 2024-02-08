package com.train.trainingmaterial.shared.constants;

public class CommonConstant {
  public static final int NORMAL_TEXT_MAX_LENGTH = 250;

  private CommonConstant() {}

  public static final String REQUEST_ID = "requestId";
  public static final String CORRELATION_ID = "correlationId";
  public static final String REF_NO = "refNo";
  public static final String USERNAME = "username";
  public static final String USER_ID = "userId";
  public static final String EMAIL = "email";
  public static final String PARTNER = "partner";
  public static final String QUEUE_NAME = "queueName";
  public static final String ROLE = "role";

  // Localize
  public static final String LOCAL_ENGLISH_SHORT = "en";
  public static final String LOCAL_VIETNAMESE_SHORT = "vi";

  // Request attributes
  public static final String REQUEST_TIMESTAMP = "requestTimestamp";
  public static final String REQUEST_PATH = "requestPath";
  public static final String REQUEST_METHOD = "requestMethod";
  public static final String REQUEST_SOURCE_IP = "requestSourceIp";

  // Response attributes
  public static final String RESPONSE_TIMESTAMP = "responseTimestamp";
  public static final String RESPONSE_STATUS = "responseStatus";
  public static final String REQUEST_DURATION = "requestDuration";

  // Headers
  public static final String REQUEST_ID_HEADER = "X-Request-Id";
  public static final String AMAZON_REQUEST_ID_HEADER = "x-amzn-RequestId";
  public static final String AUTHORIZATION_HEADER = "Authorization";
  public static final String CORRELATION_ID_HEADER = "X-Correlation-Id";
  public static final String USER_ID_HEADER = "X-User-Id";
  public static final String REF_NO_HEADER = "X-Ref-No";
}
