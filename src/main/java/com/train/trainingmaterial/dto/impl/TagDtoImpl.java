package com.train.trainingmaterial.dto.impl;

import com.train.trainingmaterial.dao.TagDao;
import com.train.trainingmaterial.dto.TagDto;
import com.train.trainingmaterial.entity.TagEntity;
import com.train.trainingmaterial.model.request.tag.AddTagRequest;
import com.train.trainingmaterial.model.request.tag.BaseTagRequest;
import com.train.trainingmaterial.model.request.tag.UpdateTagRequest;
import com.train.trainingmaterial.model.response.tag.*;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TagDtoImpl implements TagDto {
  private TagDao tagDao;

  @Override
  public GetAllTagResponse getAllTag() {
    List<TagDetailResponse> tagDetail = this.allTagDetailFrom(tagDao.getAllTag());
    return GetAllTagResponse.builder().total(tagDetail.size()).tagDetail(tagDetail).build();
  }

  @Override
  public AddTagResponse addTag(AddTagRequest request) {
    if (this.checkValidField(request)) {
      return AddTagResponse.builder().success(false).build();
    }
    return AddTagResponse.builder().success(tagDao.addTag(this.toTagEntityFrom(request))).build();
  }

  @Override
  public UpdateTagResponse updateTag(Long tagId, UpdateTagRequest request) {
    return UpdateTagResponse.builder()
        .success(tagDao.updateTag(tagId, this.toTagEntityFrom(request)))
        .build();
  }

  @Override
  public DeleteTagResponse deleteTag(Long tagId) {
    return DeleteTagResponse.builder().success(tagDao.deleteTag(tagId)).build();
  }

  private boolean checkValidField(AddTagRequest request) {
    return request.getLevel() < 1 || request.getLevel() > 3 || request.getSubstance() == null;
  }

  private <T extends BaseTagRequest> TagEntity toTagEntityFrom(T request) {
    return TagEntity.builder().level(request.getLevel()).substance(request.getSubstance()).build();
  }

  private TagDetailResponse TagDetailFrom(TagEntity tagEntity) {
    return TagDetailResponse.builder()
        .level(tagEntity.getLevel())
        .substance(tagEntity.getSubstance())
        .build();
  }

  private List<TagDetailResponse> allTagDetailFrom(List<TagEntity> tagEntities) {
    List<TagDetailResponse> result = new ArrayList<>();
    for (TagEntity tagEntity : tagEntities) {
      result.add(this.TagDetailFrom(tagEntity));
    }
    return result;
  }
}
