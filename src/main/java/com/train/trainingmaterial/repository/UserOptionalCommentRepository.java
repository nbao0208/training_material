package com.train.trainingmaterial.repository;

import com.train.trainingmaterial.entity.UserOptionalCommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserOptionalCommentRepository
    extends JpaRepository<UserOptionalCommentEntity, Long> {}
