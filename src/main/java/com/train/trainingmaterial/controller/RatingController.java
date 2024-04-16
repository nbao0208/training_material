package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import com.train.trainingmaterial.service.RatingService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/v1/rating")
@AllArgsConstructor
@Slf4j
public class RatingController {
  private final RatingService ratingService;

  @GetMapping(value = "/level")
  public Response<GetAllRatingLevelResponse> getAllRatingLevel() {
    return ratingService.getAllRatingLevel();
  }

  @GetMapping(value = "/{rating_id}/comment-template")
  Response<GetAllCommentTemplateResponse> getAllCommentTemplate(
      @PathVariable(value = "rating_id") Long ratingId) {
    return ratingService.getAllCommentTemplate(ratingId);
  }
}
