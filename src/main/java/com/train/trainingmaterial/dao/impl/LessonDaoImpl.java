package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.entity.LessonEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.entity.UserLessonEntity;
import com.train.trainingmaterial.repository.LessonRepository;
import com.train.trainingmaterial.repository.ReportRepository;
import com.train.trainingmaterial.repository.UserLessonRepository;
import com.train.trainingmaterial.repository.UserRepository;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Data
public class LessonDaoImpl implements LessonDao {
  private final LessonRepository lessonRepository;
  private final UserLessonRepository userLessonRepository;
  private final UserRepository userRepository;
  private final ReportRepository reportRepository;

  @Override
  public LessonEntity getLesson(Long lessonId, Long userId) {
    UserLessonEntity userLesson =
        userLessonRepository.findByLessonIdAndUserId(lessonId, userId).orElse(null);
    if (userLesson == null) {
      UserEntity userEntity =
          userRepository
              .findById(userId)
              .orElseThrow(() -> new NullValueException("Don't find any user with id " + userId));
      LessonEntity lessonEntity =
          lessonRepository
              .findById(lessonId)
              .orElseThrow(
                  () -> new NullValueException("Don't find any lesson with id " + lessonId));
      userLesson = this.generateFrom(userEntity, lessonEntity);
      userLessonRepository.save(userLesson);
      return lessonEntity;
    }
    this.addDefaultField(userLesson);
    userLesson.setView(userLesson.getView() + 1);
    userLessonRepository.save(userLesson);
    return lessonRepository
        .findById(lessonId)
        .orElseThrow(() -> new NullValueException("Don't find any lesson with id " + lessonId));
  }

  private UserLessonEntity generateFrom(UserEntity userEntity, LessonEntity lessonEntity) {
    UserLessonEntity userLesson =
        UserLessonEntity.builder()
            .userEntity(userEntity)
            .lessonEntity(lessonEntity)
            .view(1)
            .timeReading(LocalTime.of(0, 0))
            .reportEntity(reportRepository.findById(Long.valueOf(2)).orElse(null))
            .build();
    this.addDefaultField(userLesson);
    return userLesson;
  }

  private void addDefaultField(UserLessonEntity userLesson) {
    userLesson.setCreated(OffsetDateTime.now());
    userLesson.setModified(OffsetDateTime.now());
    userLesson.setCreatedBy("Bao Nguyen");
    userLesson.setModifiedBy("Bao Nguyen");
    userLesson.setDeleted(false);
  }
}
