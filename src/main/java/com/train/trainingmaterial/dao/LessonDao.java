package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.LessonEntity;
import org.springframework.stereotype.Service;

@Service
public interface LessonDao {
  LessonEntity getLesson(Long lessonId, Long userId);

  boolean cancelLesson(Long lessonId, Long userId);

  String evaluateLesson(Long lessonId, Long userId, int evaluation);
}
