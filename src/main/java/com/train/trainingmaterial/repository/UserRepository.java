package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserEntity;
import jakarta.persistence.OrderBy;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
  @Query("select u from UserEntity u where year (u.dob)=:yearBorn")
  @OrderBy("last_name asc")
  List<UserEntity> findByYearBorn(@Param("yearBorn") int yearBorn);
}
