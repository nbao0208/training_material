package com.train.trainingmaterial.config;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.train.trainingmaterial.model.request.auth.MultiReadHttpServletRequest;
import com.train.trainingmaterial.model.request.auth.RequestCorrelation;
import com.train.trainingmaterial.shared.constants.CommonConstant;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingResponseWrapper;

@Slf4j
@Component
@Order(2)
public class RequestLoggingFilter extends OncePerRequestFilter {
  private static final String[] HEADERS_TO_GET_IP = {
    "X-Forwarded-For",
    "Proxy-Client-IP",
    "WL-Proxy-Client-IP",
    "HTTP_X_FORWARDED_FOR",
    "HTTP_X_FORWARDED",
    "HTTP_X_CLUSTER_CLIENT_IP",
    "HTTP_CLIENT_IP",
    "HTTP_FORWARDED_FOR",
    "HTTP_FORWARDED",
    "HTTP_VIA",
    "REMOTE_ADDR"
  };

  private static final List<String> LOG_IGNORED_FIELDS =
      List.of("password", "otp", "refreshToken", "mpin");

  public static final int MAX_PAYLOAD_LENGTH = 2000;

  @Value("${logging.log-request-body:true}")
  private boolean isLogRequestBodyEnabled;

  @Value("${logging.log-response-body:false}")
  private boolean isLogResponseBodyEnabled;

  @Value("${logging.log-response-error:true}")
  private boolean isLogResponseErrorEnabled;

  private final Gson gson;

  public RequestLoggingFilter(@Qualifier("gsonWithTrim") Gson gsonWithTrim) {
    this.gson = gsonWithTrim;
  }

  @Override
  protected void doFilterInternal(
      @NonNull HttpServletRequest request,
      @NonNull HttpServletResponse response,
      @NonNull FilterChain filterChain)
      throws ServletException, IOException {
    MultiReadHttpServletRequest wrappedRequest = new MultiReadHttpServletRequest(request);
    ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(response);

    OffsetDateTime requestTimestamp = OffsetDateTime.now();
    long startTime = System.currentTimeMillis();

    String userAgent = request.getHeader(CommonConstant.USER_AGENT_HEADER);
    String ipAddress = getClientIpAddress(request);
    String screenName = request.getHeader(CommonConstant.SCREEN_NAME_HEADER);

    request.setAttribute(CommonConstant.REQUEST_TIMESTAMP, requestTimestamp.toString());
    request.setAttribute(CommonConstant.REQUEST_SCREEN_NAME, screenName);

    MDC.put(CommonConstant.REQUEST_TIMESTAMP, requestTimestamp.toString());
    MDC.put(CommonConstant.REQUEST_SCREEN_NAME, screenName);
    MDC.put(CommonConstant.REQUEST_PATH, request.getRequestURI());
    MDC.put(CommonConstant.REQUEST_METHOD, request.getMethod());
    MDC.put(CommonConstant.REQUEST_SOURCE_IP, ipAddress);
    MDC.put(CommonConstant.REQUEST_CONTENT_TYPE, request.getContentType());
    MDC.put(CommonConstant.REQUEST_USER_AGENT, userAgent);

    RequestCorrelation.setApi(request.getRequestURI());
    RequestCorrelation.setRequestTimeStamp(requestTimestamp);
    RequestCorrelation.setIp(ipAddress);
    RequestCorrelation.setScreenName(screenName);

    boolean isRequestJson =
        request.getContentType() != null
            && request
                .getContentType()
                .toLowerCase()
                .contains(ContentType.APPLICATION_JSON.getMimeType().toLowerCase());

    if (isLogRequestBodyEnabled && isRequestJson) {
      byte[] requestBuffer = wrappedRequest.getInputStream().readAllBytes();
      String requestBody = this.getContentAsString(requestBuffer, request.getCharacterEncoding());

      log.info("Request: {}", requestBody);
    } else {
      log.info("Request: {}", request.getRequestURI());
    }

    // Run other filters
    filterChain.doFilter(wrappedRequest, wrappedResponse);

    OffsetDateTime responseTimestamp = OffsetDateTime.now();
    long endTime = System.currentTimeMillis();
    long duration = endTime - startTime;

    MDC.put(CommonConstant.RESPONSE_TIMESTAMP, responseTimestamp.toString());
    MDC.put(CommonConstant.RESPONSE_STATUS, String.valueOf(response.getStatus()));
    MDC.put(CommonConstant.REQUEST_DURATION, String.valueOf(duration));

    boolean isResponseJson =
        response.getContentType() != null
            && response
                .getContentType()
                .toLowerCase()
                .contains(ContentType.APPLICATION_JSON.getMimeType().toLowerCase());

    HttpStatus httpStatus = HttpStatus.resolve(response.getStatus());
    if (httpStatus == null) {
      httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
    }

    boolean shouldLogResponse =
        isLogResponseBodyEnabled || (httpStatus.isError() && isLogResponseErrorEnabled);

    if (shouldLogResponse && isResponseJson) {
      byte[] responseBuffer = wrappedResponse.getContentAsByteArray();

      String responseBody = getContentAsString(responseBuffer, response.getCharacterEncoding());

      log.info(
          "Response status {} length {} data: {}",
          response.getStatus(),
          responseBuffer.length,
          responseBody);
    } else {
      log.info("Response: {}", response.getStatus());
    }

    wrappedResponse.copyBodyToResponse();
  }

  public static String getClientIpAddress(HttpServletRequest request) {
    for (String header : HEADERS_TO_GET_IP) {
      String ip = request.getHeader(header);
      if (ip != null && !ip.isEmpty() && !"unknown".equalsIgnoreCase(ip)) {
        return ip;
      }
    }

    return request.getRemoteAddr();
  }

  private String getContentAsString(byte[] buf, String charsetName) {
    if (buf == null || buf.length == 0) return "";

    int length = Math.min(buf.length, MAX_PAYLOAD_LENGTH);
    boolean isTruncated = buf.length != length;

    String content = "";

    try {
      content = new String(buf, 0, length, charsetName);

      if (!isTruncated) {
        LinkedTreeMap<?, ?> parsed = gson.fromJson(content, LinkedTreeMap.class);

        hideIgnoredMap(parsed);

        content = gson.toJson(parsed);
      }

      return content;
    } catch (UnsupportedEncodingException ex) {
      return "Unsupported Encoding";
    } catch (Exception e) {
      log.error("Parse JSON error: {}", e.getMessage(), e);

      return content;
    }
  }

  public void hideIgnoredEntry(Map.Entry<?, ?> entry) {
    if (entry.getValue() instanceof Map) {
      hideIgnoredMap((Map<?, ?>) entry.getValue());
    } else {
      String key = entry.getKey().toString().toLowerCase();

      for (String fieldName : LOG_IGNORED_FIELDS) {
        if (key.contains(fieldName.toLowerCase())) {
          entry.setValue(null);
        }
      }
    }
  }

  public void hideIgnoredMap(Map<?, ?> map) {
    map.entrySet().forEach(this::hideIgnoredEntry);
  }
}
