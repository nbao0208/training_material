package com.train.trainingmaterial.dao.impl;

import com.train.trainingmaterial.dao.TagDao;
import com.train.trainingmaterial.entity.TagEntity;
import com.train.trainingmaterial.repository.TagRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;
import java.util.List;

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
        this.addDefaultField(tagEntity);
        tagRepository.save(tagEntity);
        return true;
    }

    @Override
    public boolean updateTag(Long tagId,TagEntity tagEntity) {
        TagEntity tagFromDb = tagRepository.findById(tagId).orElse(null);
        if(tagFromDb==null){
            return false;
        }
        if(tagEntity.getLevel()>=1 && tagEntity.getLevel()<=3){
            tagFromDb.setLevel(tagEntity.getLevel());
        }
        if(tagEntity.getSubstance()!=null){
            tagFromDb.setSubstance(tagEntity.getSubstance());
        }
        this.addDefaultField(tagFromDb);
        tagRepository.save(tagFromDb);
        return true;
    }

    @Override
    public boolean deleteTag(Long tagId) {
        TagEntity tagFromDb = tagRepository.findById(tagId).orElse(null);
        if(tagFromDb==null){
            return false;
        }
        this.addDefaultField(tagFromDb);
        tagFromDb.setDeleted(true);
        tagRepository.save(tagFromDb);
        return true;
    }

    private void addDefaultField(TagEntity tagEntity){
        tagEntity.setCreated(OffsetDateTime.now());
        tagEntity.setModified(OffsetDateTime.now());
        tagEntity.setCreatedBy("Bao Nguyen");
        tagEntity.setModifiedBy("Bao Nguyen");
        tagEntity.setDeleted(false);
    }


}
