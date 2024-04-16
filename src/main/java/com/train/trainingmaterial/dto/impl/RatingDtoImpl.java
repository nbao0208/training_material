package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.RatingDao;
import com.train.trainingmaterial.dto.RatingDto;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class RatingDtoImpl implements RatingDto {
  private final RatingDao ratingDao;

  @Override
  public GetAllRatingLevelResponse getAllRatingLevel() {
    return GetAllRatingLevelResponse.builder().levels(ratingDao.getAllRatingLevel()).build();
  }

  @Override
  public GetAllCommentTemplateResponse getAllCommentTemplate(Long ratingId) {
            return
     GetAllCommentTemplateResponse.builder().commentTemplates(ratingDao.getAllCommentTemplate(ratingId)).build();
  }
}
