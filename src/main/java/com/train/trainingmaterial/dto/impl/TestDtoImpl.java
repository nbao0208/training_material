package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.TestDao;
import com.train.trainingmaterial.dto.TestDto;
import com.train.trainingmaterial.model.request.test.AddTestRequest;
import com.train.trainingmaterial.model.request.test.ModifyTestRequest;
import com.train.trainingmaterial.model.response.test.AddTestResponse;
import com.train.trainingmaterial.model.response.test.ModifyTestResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TestDtoImpl implements TestDto {
  private final TestDao testDao;

  @Override
  public AddTestResponse addTest(Long lessonId, Long userId, AddTestRequest request) {
    return AddTestResponse.builder()
        .isSuccess(
            testDao.addTest(
                lessonId, userId, request.getTitle(), request.getRule(), request.getQuestions()))
        .build();
  }

  @Override
  public ModifyTestResponse modifyTest(Long testId, Long userId, ModifyTestRequest request) {
    return ModifyTestResponse.builder()
        .isSuccess(
            testDao.modifyTest(
                testId,
                userId,
                request.getTitle(),
                request.getRule(),
                request.getDeleteQuestionId(),
                request.getModifyQuestionDetails(),
                request.getAddQuestion()))
        .build();
  }
}
