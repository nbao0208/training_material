package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.model.request.test.ModifyQuestionDetails;
import com.train.trainingmaterial.model.request.test.Question;
import java.util.List;
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
}
