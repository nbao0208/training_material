package com.train.trainingmaterial.config;

import com.train.trainingmaterial.model.request.auth.RequestCorrelation;
import com.train.trainingmaterial.shared.constants.CommonConstant;
import jakarta.annotation.Nonnull;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.MDC;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@Order(1)
public class RequestIdFilter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(
      @Nonnull HttpServletRequest request,
      @Nonnull HttpServletResponse response,
      @Nonnull FilterChain filterChain)
      throws ServletException, IOException {
    String amazonRequestId =
        this.getHeaderAttributeOrDefault(
            request, CommonConstant.AMAZON_REQUEST_ID_HEADER, UUID.randomUUID().toString());
    String requestId =
        this.getHeaderAttributeOrDefault(
            request, CommonConstant.REQUEST_ID_HEADER, amazonRequestId);
    String correlationId =
        this.getHeaderAttributeOrDefault(request, CommonConstant.CORRELATION_ID_HEADER, requestId);
    String refNo = this.getHeaderAttributeOrDefault(request, CommonConstant.REF_NO_HEADER, null);

    this.setAttributesAndMDC(request, requestId, correlationId, refNo);

    this.setRequestCorrelation(requestId, correlationId, refNo);

    filterChain.doFilter(request, response);

    this.setResponseHeaders(response, requestId, correlationId, refNo);
  }

  private String getHeaderAttributeOrDefault(
      HttpServletRequest request, String headerName, String defaultValue) {
    String headerValue = request.getHeader(headerName);

    return (StringUtils.isBlank(headerValue)) ? defaultValue : headerValue;
  }

  private void setAttributesAndMDC(
      HttpServletRequest request, String requestId, String correlationId, String refNo) {
    request.setAttribute(CommonConstant.REQUEST_ID, requestId);
    request.setAttribute(CommonConstant.CORRELATION_ID, correlationId);
    request.setAttribute(CommonConstant.REF_NO, refNo);

    MDC.put(CommonConstant.REQUEST_ID, requestId);
    MDC.put(CommonConstant.CORRELATION_ID, correlationId);
    MDC.put(CommonConstant.REF_NO, refNo);
  }

  private void setRequestCorrelation(String requestId, String correlationId, String refNo) {
    RequestCorrelation.setRequestId(requestId);
    RequestCorrelation.setCorrelationId(correlationId);
    RequestCorrelation.setRefNo(refNo);
  }

  private void setResponseHeaders(
      HttpServletResponse response, String requestId, String correlationId, String refNo) {
    response.setHeader(CommonConstant.REQUEST_ID_HEADER, requestId);
    response.setHeader(CommonConstant.CORRELATION_ID_HEADER, correlationId);
    response.setHeader(CommonConstant.REF_NO_HEADER, refNo);
  }
}
