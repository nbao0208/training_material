package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.rating.DoRatingRequest;
import com.train.trainingmaterial.model.response.rating.DoRatingResponse;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import org.springframework.stereotype.Service;

@Service
public interface RatingService {
  Response<GetAllRatingLevelResponse> getAllRatingLevel();

  Response<GetAllCommentTemplateResponse> getAllCommentTemplate(Long ratingId);

  Response<DoRatingResponse> doRating(DoRatingRequest request);
}
