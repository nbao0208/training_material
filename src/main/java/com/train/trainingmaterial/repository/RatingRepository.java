package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.RatingEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RatingRepository extends JpaRepository<RatingEntity, Long> {
  @Query(value = "select level from tm_rating", nativeQuery = true)
  List<Integer> getAllRatingLevel();
}
