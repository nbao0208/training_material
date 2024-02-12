package com.train.trainingmaterial.model.request.auth;

import java.time.OffsetDateTime;
import java.util.UUID;

public class RequestCorrelation {
  private static final InheritableThreadLocal<String> requestId = new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<String> correlationId =
      new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<String> refNo = new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<String> username = new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<Long> authId = new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<String> api = new InheritableThreadLocal<>();
  private static final InheritableThreadLocal<String> ip = new InheritableThreadLocal<>();
  private static final InheritableThreadLocal<String> screenName = new InheritableThreadLocal<>();

  private static final InheritableThreadLocal<OffsetDateTime> requestTimeStamp =
      new InheritableThreadLocal<>();

  private RequestCorrelation() {}

  /**
   * Get request ID of current request
   *
   * @return Request ID
   */
  public static String getRequestId() {
    if (requestId.get() == null) {
      return UUID.randomUUID().toString();
    }

    return requestId.get();
  }

  /**
   * Set request ID, thread safe
   *
   * @param id Request ID
   */
  public static void setRequestId(String id) {
    requestId.set(id);
  }

  /** Remove request ID, thread safe */
  public static void unloadRequestId() {
    requestId.remove();
  }

  /**
   * Get correlation ID of current request
   *
   * @return Correlation ID
   */
  public static String getCorrelationId() {
    if (correlationId.get() == null) {
      return UUID.randomUUID().toString();
    }

    return correlationId.get();
  }

  /**
   * Set correlation ID, thread safe
   *
   * @param id Correlation ID
   */
  public static void setCorrelationId(String id) {
    correlationId.set(id);
  }

  /** Remove Correlation ID, thread safe */
  public static void unloadCorrelationId() {
    correlationId.remove();
  }

  /**
   * Get ref no of current request
   *
   * @return Ref no
   */
  public static String getRefNo() {
    return refNo.get();
  }

  /**
   * Set ref number, thread safe
   *
   * @param id ref number
   */
  public static void setRefNo(String id) {
    refNo.set(id);
  }

  /** Remove ref number, thread safe */
  public static void unloadRefNo() {
    refNo.remove();
  }

  /**
   * Get user ID of current request
   *
   * @return User ID
   */
  public static Long getAuthId() {
    return authId.get();
  }

  /**
   * Set user ID, thread safe
   *
   * @param id User ID
   */
  public static void setAuthId(Long id) {
    authId.set(id);
  }

  /**
   * Get username of current request
   *
   * @return User ID
   */
  public static String getUsername() {
    return username.get();
  }

  /**
   * Set username, thread safe
   *
   * @param username User name
   */
  public static void setUsername(String username) {
    RequestCorrelation.username.set(username);
  }

  /**
   * Get Request Api of current request
   *
   * @return Request Api
   */
  public static String getApi() {
    return api.get();
  }

  /**
   * Set request Api, thread safe
   *
   * @param requestApi Request Api
   */
  public static void setApi(String requestApi) {
    api.set(requestApi);
  }

  /** Remove Api, thread safe */
  public static void unloadApi() {
    api.remove();
  }

  /**
   * Get Request Time Stamp of current request
   *
   * @return OffsetDateTime requestTimeStamp
   */
  public static OffsetDateTime getRequestTimeStamp() {
    return requestTimeStamp.get();
  }

  /**
   * Set Request Time Stamp, thread safe
   *
   * @param timeStamp Request Time stamp
   */
  public static void setRequestTimeStamp(OffsetDateTime timeStamp) {
    requestTimeStamp.set(timeStamp);
  }

  /** Remove Request Timestamp, thread safe */
  public static void unloadRequestTimeStamp() {
    requestTimeStamp.remove();
  }

  /** Remove User ID, thread safe */
  public static void unloadUserId() {
    authId.remove();
  }

  /** Remove username, thread safe */
  public static void unloadUsername() {
    username.remove();
  }

  /**
   * Get Request IP of current request
   *
   * @return Request IP
   */
  public static String getIp() {
    return ip.get();
  }

  /**
   * Set request IP, thread safe
   *
   * @param requestIp Request Ip
   */
  public static void setIp(String requestIp) {
    ip.set(requestIp);
  }

  /** Remove Ip, thread safe */
  public static void unloadIp() {
    ip.remove();
  }

  public static void setScreenName(String requestScreenName) {
    screenName.set(requestScreenName);
  }
}
