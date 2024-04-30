package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TagDao;
import com.train.trainingmaterial.entity.TagEntity;
import com.train.trainingmaterial.repository.TagRepository;
import com.train.trainingmaterial.shared.enums.TagLevelConstant;
import com.train.trainingmaterial.shared.exception.NullValueException;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TagDaoImpl implements TagDao {
  private TagRepository tagRepository;

  @Override
  public List<TagEntity> getAllTag() {
    return tagRepository.findAll();
  }

  @Override
  public boolean addTag(TagEntity tagEntity) {
    tagRepository.save(tagEntity);
    return true;
  }

  @Override
  public boolean updateTag(Long tagId, TagEntity tagEntity) {
    TagEntity tagFromDb =
        tagRepository
            .findById(tagId)
            .orElseThrow(() -> new NullValueException("Not Found this tag"));
    if (tagEntity.getLevel() >= TagLevelConstant.START_LEVEL.getLevel()
        && tagEntity.getLevel() <= TagLevelConstant.END_LEVEL.getLevel()) {
      tagFromDb.setLevel(tagEntity.getLevel());
    } else {
      return false;
    }
    if (tagEntity.getSubstance() != null) {
      tagFromDb.setSubstance(tagEntity.getSubstance());
    }
    tagRepository.save(tagFromDb);
    return true;
  }

  @Override
  public boolean deleteTag(Long tagId) {
    TagEntity tagFromDb = tagRepository.findById(tagId).orElse(null);
    if (tagFromDb == null) {
      return false;
    }
    tagFromDb.setDeleted(true);
    tagRepository.save(tagFromDb);
    return true;
  }
}
