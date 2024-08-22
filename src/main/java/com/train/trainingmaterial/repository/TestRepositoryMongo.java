package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.document.TestDocument;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface TestRepositoryMongo extends MongoRepository<TestDocument, ObjectId> {}
