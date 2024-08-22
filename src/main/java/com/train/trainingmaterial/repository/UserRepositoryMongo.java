package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.document.UserDocument;
import java.util.Optional;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface UserRepositoryMongo extends MongoRepository<UserDocument, ObjectId> {
  @Query("{'user_id': ?0}")
  Optional<UserDocument> findLearnedUserById(Long userId);

  @Query("{'user_id': ?0, 'lessons.lessonId': ?1}")
  Optional<UserDocument> findLearnedUserLearnExactQuestionBy(Long userId, String lessonId);
}
