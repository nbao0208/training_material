package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.CommentTemplateEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentTemplateRepository extends JpaRepository<CommentTemplateEntity, Long> {
  @Query(
      value = "select comment from tm_comment_template where tm_rating_id =:ratingId",
      nativeQuery = true)
  List<String> getAllComment(@Param(value = "ratingId") Long ratingId);

  @Query("select cm from CommentTemplateEntity cm where cm.id in (:ids)")
  List<CommentTemplateEntity> findAllCommentTemplateByListOfId(
      @Param(value = "ids") List<Long> ids);

  @Query("select ct.ratingEntity.id from CommentTemplateEntity ct where ct.id = :id")
  Long findRatingIdById(@Param(value = "id") Long id);

  @Query("select ct.comment from CommentTemplateEntity ct where ct.id in (:ids)")
  List<String> findCommentTemplateByListOfId(@Param(value = "ids") List<Long> commentTemplateId);
}
