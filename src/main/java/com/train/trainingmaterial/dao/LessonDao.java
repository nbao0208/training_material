package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.model.response.lesson.GetLessonReportResponse;
import com.train.trainingmaterial.model.response.lesson.LessonDetailResponse;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface LessonDao {
  <T> LessonDetailResponse getLesson(T lessonId, Long userId);

  <T> boolean cancelLesson(T lessonId, Long userId);

  String evaluateLesson(Long lessonId, Long userId, int evaluation);

  boolean completeLesson(Long userId, Long lessonId);

  boolean completeLessonMongo(Long userId, String lessonId);

  boolean createLesson(
      Long userId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      int timeRemaining);

  <T> boolean updateLesson(
      T lessonId,
      Long userId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining);

  GetLessonReportResponse getLessonReport(Long userId, Long lessonId);
}
