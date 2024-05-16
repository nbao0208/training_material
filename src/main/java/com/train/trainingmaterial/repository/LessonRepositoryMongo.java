package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.document.LessonDocument;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface LessonRepositoryMongo extends MongoRepository<LessonDocument, ObjectId> {}
