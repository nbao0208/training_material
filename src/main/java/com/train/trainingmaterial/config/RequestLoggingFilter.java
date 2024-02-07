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
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.slf4j.MDC;
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
@RequiredArgsConstructor
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

  private final Gson gsonWithTrim;

  @Value("${logging.log-request-body:true}")
  private boolean isLogRequestBodyEnabled;

  @Value("${logging.log-response-body:false}")
  private boolean isLogResponseBodyEnabled;

  @Value("${logging.log-response-error:true}")
  private boolean isLogResponseErrorEnabled;

  @Override
  protected void doFilterInternal(
      @NonNull HttpServletRequest request,
      @NonNull HttpServletResponse response,
      FilterChain filterChain)
      throws ServletException, IOException {
    MultiReadHttpServletRequest wrappedRequest = new MultiReadHttpServletRequest(request);
    ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(response);

    OffsetDateTime requestTimestamp = OffsetDateTime.now();
    long startTime = System.currentTimeMillis();

    String ipAddress = getClientIpAddress(request);

    setupRequestContext(request, requestTimestamp, ipAddress);

    logRequestDetails(request);

    filterChain.doFilter(wrappedRequest, wrappedResponse);

    OffsetDateTime responseTimestamp = OffsetDateTime.now();
    long endTime = System.currentTimeMillis();
    long duration = endTime - startTime;

    setupResponseContext(response, responseTimestamp, duration);

    logResponseDetails(wrappedResponse);
  }

  private void setupRequestContext(
      HttpServletRequest request, OffsetDateTime requestTimestamp, String ipAddress) {
    request.setAttribute(CommonConstant.REQUEST_TIMESTAMP, requestTimestamp.toString());

    MDC.put(CommonConstant.REQUEST_TIMESTAMP, requestTimestamp.toString());
    MDC.put(CommonConstant.REQUEST_PATH, request.getRequestURI());
    MDC.put(CommonConstant.REQUEST_METHOD, request.getMethod());
    MDC.put(CommonConstant.REQUEST_SOURCE_IP, ipAddress);

    RequestCorrelation.setApi(request.getRequestURI());
    RequestCorrelation.setRequestTimeStamp(requestTimestamp);
    RequestCorrelation.setIp(ipAddress);
  }

  private void logRequestDetails(HttpServletRequest request) throws IOException {
    boolean isRequestJson =
        request.getContentType() != null
            && request
                .getContentType()
                .toLowerCase()
                .contains(ContentType.APPLICATION_JSON.getMimeType().toLowerCase());

    if (isLogRequestBodyEnabled && isRequestJson) {
      logRequestBody(request);
    } else {
      log.info("Request: {}", request.getRequestURI());
    }
  }

  private void logRequestBody(HttpServletRequest request) throws IOException {
    byte[] requestBuffer = new byte[0];
    if (request.getInputStream().available() > 0) {
      requestBuffer = request.getInputStream().readAllBytes();
    }

    String requestBody = getContentAsString(requestBuffer, request.getCharacterEncoding());

    log.info("Request: {}", requestBody);
  }

  private void setupResponseContext(
      HttpServletResponse response, OffsetDateTime responseTimestamp, long duration) {
    MDC.put(CommonConstant.RESPONSE_TIMESTAMP, responseTimestamp.toString());
    MDC.put(CommonConstant.RESPONSE_STATUS, String.valueOf(response.getStatus()));
    MDC.put(CommonConstant.REQUEST_DURATION, String.valueOf(duration));
  }

  private void logResponseDetails(ContentCachingResponseWrapper wrappedResponse)
      throws IOException {
    HttpStatus httpStatus = HttpStatus.resolve(wrappedResponse.getStatus());
    if (httpStatus == null) {
      httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
    }

    if (this.shouldLogResponse(httpStatus) && this.isResponseJson(wrappedResponse)) {
      logResponseBody(wrappedResponse);
    } else {
      log.info("Response: {}", wrappedResponse.getStatus());
    }

    wrappedResponse.copyBodyToResponse();
  }

  private boolean shouldLogResponse(HttpStatus httpStatus) {
    return (this.isLogResponseBodyEnabled
        || (httpStatus.isError() && this.isLogResponseErrorEnabled));
  }

  private boolean isResponseJson(ContentCachingResponseWrapper wrappedResponse) {
    return wrappedResponse.getContentType() != null
        && wrappedResponse
            .getContentType()
            .toLowerCase()
            .contains(ContentType.APPLICATION_JSON.getMimeType().toLowerCase());
  }

  private void logResponseBody(ContentCachingResponseWrapper wrappedResponse) {
    byte[] responseBuffer = wrappedResponse.getContentAsByteArray();

    String responseBody =
        getContentAsString(responseBuffer, wrappedResponse.getCharacterEncoding());

    log.info(
        "Response: status {} length {} data: {}",
        wrappedResponse.getStatus(),
        responseBuffer.length,
        responseBody);
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
        LinkedTreeMap<?, ?> parsed = this.gsonWithTrim.fromJson(content, LinkedTreeMap.class);

        hideIgnoredMap(parsed);

        content = this.gsonWithTrim.toJson(parsed);
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
