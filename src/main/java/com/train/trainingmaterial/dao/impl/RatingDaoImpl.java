package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.RatingDao;
import com.train.trainingmaterial.repository.CommentTemplateRepository;
import com.train.trainingmaterial.repository.RatingRepository;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class RatingDaoImpl implements RatingDao {
  private final RatingRepository ratingRepository;
  private final CommentTemplateRepository commentTemplateRepository;

  @Override
  public List<Integer> getAllRatingLevel() {
    return ratingRepository.getAllRatingLevel();
  }

  @Override
  public List<String> getAllCommentTemplate(Long ratingId) {
    return commentTemplateRepository.getAllComment(ratingId);
  }
}
