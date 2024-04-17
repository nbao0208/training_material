package com.train.trainingmaterial.dao;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface RatingDao {
  List<Integer> getAllRatingLevel();

  List<String> getAllCommentTemplate(Long ratingId);

  String doRating(
      Long userId,
      Long lessonId,
      Long ratingId,
      List<Long> commentTemplateId,
      String optionalComment);
}
