package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.AnswerEntity;
import com.train.trainingmaterial.entity.QuestionEntity;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.model.response.test.TestForResponse;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public interface TestDao {
  boolean addTest(Long lessonId, Long userId, String title, String rule, List<Question> questions);

  boolean modifyTest(
      Long testId,
      Long userId,
      String title,
      String rule,
      List<Long> deleteQuestions,
      ModifyQuestionDetails modifyQuestionDetails,
      List<Question> addQuestions);

  List<Map.Entry<QuestionEntity, List<AnswerEntity>>> getTest(
      Long testId, Long userId, Long lessonId);

  float submitTest(Long testId, Long lessonId, Long userId, List<Map<Long, Boolean>> answerIds);

  List<TestForResponse> showDetailedResult(Long testId, Long lessonId, Long userId);
}
