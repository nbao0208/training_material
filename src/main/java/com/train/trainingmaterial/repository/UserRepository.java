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
  //  @Query( "update UserEntity u " +
  //          "set u.first_name=case when :#{#user.first_name} is not null then :#{#user.first_name}
  // else u.first_name end," +
  //          "u.middle_name=case when :#{#user.middle_name} is not null then :#{#user.middle_name}
  // else u.middle_name end," +
  //          "u.last_name=case when :#{#user.last_name} is not null then :#{#user.last_name} else
  // u.last_name end," +
  //          "u.dob=case when :#{#user.dob} is not null then :#{#user.dob} else u.dob end," +
  //          "u.address=case when :#{#user.address} is not null then :#{#user.address} else
  // u.address end," +
  //          "u.created=:#{#user.created}," +
  //          "u.modified=:#{#user.modified}," +
  //          "u.created_by=:#{#user.created_by}," +
  //          "u.modified_by=:#{#user.modified_by}," +
  //          "u.is_deleted=:#{#user._deleted} " +
  //          "where u.national_id=:#{#user.national_id}")
  //  void updateById(@Param("user") UserEntity user);
}
