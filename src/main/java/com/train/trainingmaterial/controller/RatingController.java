package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.rating.DoRatingRequest;
import com.train.trainingmaterial.model.response.rating.DoRatingResponse;
import com.train.trainingmaterial.model.response.rating.GetAllCommentTemplateResponse;
import com.train.trainingmaterial.model.response.rating.GetAllRatingLevelResponse;
import com.train.trainingmaterial.service.RatingService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

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
  public Response<GetAllCommentTemplateResponse> getAllCommentTemplate(
      @PathVariable(value = "rating_id") Long ratingId) {
    return ratingService.getAllCommentTemplate(ratingId);
  }

  @PostMapping(
      value = "",
      produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<DoRatingResponse> doRating(@Valid @RequestBody DoRatingRequest request) {
    return ratingService.doRating(request);
  }
}
