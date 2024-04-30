package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.RatingDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.rating.DoRatingRequest;
import com.train.trainingmaterial.model.response.rating.DoRatingResponse;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import com.train.trainingmaterial.service.RatingService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class RatingServiceImpl implements RatingService {
  private final RatingDto ratingDto;

  @Override
  public Response<GetAllRatingLevelResponse> getAllRatingLevel() {
    return Response.<GetAllRatingLevelResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(ratingDto.getAllRatingLevel())
        .build();
  }

  @Override
  public Response<GetAllCommentTemplateResponse> getAllCommentTemplate(Long ratingId) {
    return Response.<GetAllCommentTemplateResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(ratingDto.getAllCommentTemplate(ratingId))
        .build();
  }

  @Override
  public Response<DoRatingResponse> doRating(DoRatingRequest request) {
    return Response.<DoRatingResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(ratingDto.doRating(request))
        .build();
  }
}
