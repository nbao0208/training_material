package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserOptionalCommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserOptionalCommentRepository
    extends JpaRepository<UserOptionalCommentEntity, Long> {
  @Query(
      "select uoc.comment from UserOptionalCommentEntity uoc where"
          + " uoc.commentRatingEntity.id=:commentRatingId")
  String findOptionalCommentByCommentRatingId(
      @Param(value = "commentRatingId") Long commentRatingId);
}
