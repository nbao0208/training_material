package com.train.trainingmaterial.dao;

import com.train.trainingmaterial.entity.TagEntity;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface TagDao {
  List<TagEntity> getAllTag();

  boolean addTag(TagEntity tagEntity);

  boolean updateTag(Long tagId, TagEntity tagEntity);

  boolean deleteTag(Long tagId);
}
