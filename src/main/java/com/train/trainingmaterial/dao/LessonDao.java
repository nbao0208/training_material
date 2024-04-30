package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.LessonEntity;
import com.train.trainingmaterial.model.response.lesson.GetLessonReportResponse;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface LessonDao {
  LessonEntity getLesson(Long lessonId, Long userId);

  boolean cancelLesson(Long lessonId, Long userId);

  String evaluateLesson(Long lessonId, Long userId, int evaluation);

  boolean completeLesson(Long userId, Long lessonId);

  boolean createLesson(
      Long userId,
      Long categoryId,
      List<Long> tagId,
      String contentLink,
      String title,
      String intro,
      int timeRemaining);

  boolean updateLesson(
      Long lessonId,
      Long userId,
      Long categoryId,
      String contentLink,
      String title,
      String intro,
      Integer timeRemaining);

  GetLessonReportResponse getLessonReport(Long userId, Long lessonId);
}
