package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.LessonEntity;
import org.springframework.stereotype.Service;

@Service
public interface LessonDao {
  LessonEntity getLesson(Long lessonId, Long userId);
}
