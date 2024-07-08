package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.AnswerEntity;
import com.train.trainingmaterial.entity.QuestionEntity;
import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import com.train.trainingmaterial.model.response.test.GetTestReportResponse;
import com.train.trainingmaterial.model.response.test.QuestionWithNoCorrectAnswer;
import com.train.trainingmaterial.model.response.test.TestForResponse;
import com.train.trainingmaterial.model.response.test.TestForResponseMongo;
import com.train.trainingmaterial.model.test.SelectedAnswerPerQuestion;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public interface TestDao {
  boolean addTest(Long lessonId, Long userId, String title, String rule, List<Question> questions);

  boolean addTestByMongo(
      String lessonId,
      Long userId,
      String title,
      String description,
      List<com.train.trainingmaterial.model.test.Question> questions);

  boolean modifyTest(
      Long testId,
      Long userId,
      String title,
      String rule,
      List<Long> deleteQuestions,
      ModifyQuestionDetails modifyQuestionDetails,
      List<Question> addQuestions);

  boolean modifyTestByMongo(
      String testId,
      Long userId,
      String newTitle,
      String newDescription,
      List<com.train.trainingmaterial.model.test.Question> newQuestions);

  List<Map.Entry<QuestionEntity, List<AnswerEntity>>> getTest(
      Long testId, Long userId, Long lessonId);

  List<QuestionWithNoCorrectAnswer> getTestByMongo(String testId, Long userId, String lessonId);

  float submitTest(Long testId, Long lessonId, Long userId, List<Map<Long, Boolean>> answerIds);

  float submitTestByMongo(
      String testId,
      String lessonId,
      Long userId,
      List<SelectedAnswerPerQuestion> selectedAnswerPerQuestions);

  List<TestForResponse> showDetailedResult(Long testId, Long lessonId, Long userId);

  List<TestForResponseMongo> showDetailedResultMongo(String testId, Long userId, String lessonId);

  GetTestReportResponse getTestReport(Long userId, Long testId, Long lessonId);
}
