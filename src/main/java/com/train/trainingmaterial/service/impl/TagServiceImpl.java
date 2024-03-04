package com.train.trainingmaterial.service.impl;

import com.train.trainingmaterial.dto.TagDto;
import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.tag.AddTagRequest;
import com.train.trainingmaterial.model.request.tag.UpdateTagRequest;
import com.train.trainingmaterial.model.response.tag.AddTagResponse;
import com.train.trainingmaterial.model.response.tag.DeleteTagResponse;
import com.train.trainingmaterial.model.response.tag.GetAllTagResponse;
import com.train.trainingmaterial.model.response.tag.UpdateTagResponse;
import com.train.trainingmaterial.service.TagService;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TagServiceImpl implements TagService {
  private final TagDto tagDto;

  @Override
  public Response<GetAllTagResponse> getAllTag() {
    return Response.<GetAllTagResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(tagDto.getAllTag())
        .build();
  }

  @Override
  public Response<AddTagResponse> addTag(AddTagRequest request) {
    return Response.<AddTagResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(tagDto.addTag(request))
        .build();
  }

  @Override
  public Response<UpdateTagResponse> updateTag(Long tagId, UpdateTagRequest request) {
    return Response.<UpdateTagResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(tagDto.updateTag(tagId, request))
        .build();
  }

  @Override
  public Response<DeleteTagResponse> deleteTag(Long tagId) {
    return Response.<DeleteTagResponse>builder()
        .id(UUID.randomUUID().toString())
        .data(tagDto.deleteTag(tagId))
        .build();
  }
}
