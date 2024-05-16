package com.train.trainingmaterial.config;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import java.util.Collection;
import java.util.Collections;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoClientConfiguration;
import org.springframework.data.mongodb.config.EnableMongoAuditing;

@Configuration
@EnableMongoAuditing
public class MongoConfig extends AbstractMongoClientConfiguration {
  @Override
  protected String getDatabaseName() {
    return "training_material_mongodb";
  }

  @Override
  public MongoClient mongoClient() {
    return MongoClients.create(
        "mongodb://baonguyen:123@localhost:27017/training_material_mongodb?authSource=admin");
  }

  @Override
  public Collection<String> getMappingBasePackages() {
    return Collections.singleton("com.train.trainingmaterial");
  }
}
