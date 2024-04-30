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
import java.time.Duration;
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
    userLesson.setView(userLesson.getView() + 1);
    userLessonRepository.save(userLesson);
    return lessonRepository
        .findById(lessonId)
        .orElseThrow(() -> new NullValueException("Don't find any lesson with id " + lessonId));
  }

  @Override
  public boolean cancelLesson(Long lessonId, Long userId) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException("Don't have this user or lesson"));
    LocalTime timeLearning = this.timeBetween(userLesson.getModified(), OffsetDateTime.now());
    userLesson.setTimeReading(
        userLesson
            .getTimeReading()
            .plusHours(timeLearning.getHour())
            .plusMinutes(timeLearning.getMinute())
            .plusSeconds(timeLearning.getSecond()));
    userLessonRepository.save(userLesson);
    return true;
  }

  @Override
  public String evaluateLesson(Long lessonId, Long userId, int evaluation) {
    UserLessonEntity userLesson =
        userLessonRepository
            .findByLessonIdAndUserId(lessonId, userId)
            .orElseThrow(() -> new NullValueException("OOps not found @@"));
    LocalTime timeLearning = this.timeBetween(userLesson.getModified(), OffsetDateTime.now());
    userLesson.setTimeReading(
        userLesson
            .getTimeReading()
            .plusHours(timeLearning.getHour())
            .plusMinutes(timeLearning.getMinute())
            .plusSeconds(timeLearning.getSecond()));
    userLesson.setEvaluation(evaluation);
    userLessonRepository.save(userLesson);
    return this.rankingFeedback(evaluation);
  }

  private String rankingFeedback(int evaluation) {
    if (evaluation <= 2) {
      return "We will get better next time";
    } else if (evaluation == 3) {
      return "Thanks for your response";
    } else if (evaluation == 4) {
      return "Really appreciate with your response";
    }
    return "Big thanks for you sir/ma am";
  }

  private LocalTime timeBetween(OffsetDateTime first, OffsetDateTime end) {
    Duration duration = Duration.between(first, end);
    return LocalTime.of(
        (int) duration.toHours(),
        (int) (duration.toMinutes() % 60),
        (int) (duration.getSeconds() % 60));
  }

  private UserLessonEntity generateFrom(UserEntity userEntity, LessonEntity lessonEntity) {
    return UserLessonEntity.builder()
        .userEntity(userEntity)
        .lessonEntity(lessonEntity)
        .view(1)
        .timeReading(LocalTime.of(0, 0))
        .reportEntity(reportRepository.findById(2L).orElse(null))
        .build();
  }
}
