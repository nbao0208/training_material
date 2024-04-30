package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.LessonDao;
import com.train.trainingmaterial.entity.LessonEntity;
import com.train.trainingmaterial.entity.UserEntity;
import com.train.trainingmaterial.entity.UserLessonEntity;
import com.train.trainingmaterial.repository.LessonRepository;
import com.train.trainingmaterial.repository.ReportRepository;
import com.train.trainingmaterial.repository.UserLessonRepository;
import com.train.trainingmaterial.repository.UserRepository;
import com.train.trainingmaterial.shared.enums.LessonStatus;
import com.train.trainingmaterial.shared.enums.RankingValue;
import com.train.trainingmaterial.shared.exception.NullValueException;
import com.train.trainingmaterial.shared.exception.WrongValueException;
import java.time.Duration;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
@Data
@Slf4j
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
      UserEntity userEntity = this.findUserByUserId(userId);
      LessonEntity lessonEntity = this.findLessonByLessonId(lessonId);
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
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLessonRepository.save(userLesson);
    return true;
  }

  @Override
  public String evaluateLesson(Long lessonId, Long userId, int evaluation) {
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLesson.setEvaluation(evaluation);
    userLessonRepository.save(userLesson);
    return this.rankingFeedback(evaluation);
  }

  @Override
  public boolean completeLesson(Long userId, Long lessonId) {
    UserLessonEntity userLesson = this.trackingStatusForUser(userId, lessonId);
    userLesson.setReportEntity(
        reportRepository.findById(LessonStatus.DONE.getStatusId()).orElse(null));
    userLessonRepository.save(userLesson);
    return true;
  }

  private String rankingFeedback(int evaluation) {
    if (evaluation <= 0 || evaluation > RankingValue.FIVE_STARTS.getStar()) {
      throw new WrongValueException("Error value of evaluation");
    }
    if (evaluation <= RankingValue.TWO_STARS.getStar()) {
      return "We will get better next time";
    } else if (evaluation == RankingValue.THREE_STARS.getStar()) {
      return "Thanks for your response";
    } else if (evaluation == RankingValue.FOUR_STARS.getStar()) {
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
        .reportEntity(reportRepository.findById(LessonStatus.DOING.getStatusId()).orElse(null))
        .build();
  }

  private UserLessonEntity trackingStatusForUser(Long userId, Long lessonId) {
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
    return userLesson;
  }

  private UserEntity findUserByUserId(Long userId) {
    return userRepository
        .findById(userId)
        .orElseThrow(() -> new NullValueException("Don't find any user with id " + userId));
  }

  private LessonEntity findLessonByLessonId(Long lessonId) {
    return lessonRepository
        .findById(lessonId)
        .orElseThrow(() -> new NullValueException("Don't find any lesson with id " + lessonId));
  }
}
