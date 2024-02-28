package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserTestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTestRepository extends JpaRepository<UserTestEntity, Long> {
  @Query("SELECT u FROM UserTestEntity u where u.id = 1")
  public UserTestEntity getUserTestById(Long id);
}
