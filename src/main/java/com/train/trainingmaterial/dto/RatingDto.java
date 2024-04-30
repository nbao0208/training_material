package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.rating.DoRatingRequest;
import com.train.trainingmaterial.model.response.rating.DoRatingResponse;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import org.springframework.stereotype.Service;

@Service
public interface RatingDto {
  GetAllRatingLevelResponse getAllRatingLevel();

  GetAllCommentTemplateResponse getAllCommentTemplate(Long ratingId);

  DoRatingResponse doRating(DoRatingRequest request);
}
