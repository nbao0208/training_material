package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.GroupEntity;
import com.train.trainingmaterial.entity.UserGroupEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserGroupRepository extends JpaRepository<UserGroupEntity, Long> {
  @Query("select u.groupEntity from UserGroupEntity u where u.userEntity.id=:userId")
  List<GroupEntity> roleOf(Long userId);
}
