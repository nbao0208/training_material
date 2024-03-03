package com.train.trainingmaterial.dto;

import com.train.trainingmaterial.model.request.tag.AddTagRequest;
import com.train.trainingmaterial.model.request.tag.UpdateTagRequest;
import com.train.trainingmaterial.model.response.tag.AddTagResponse;
import com.train.trainingmaterial.model.response.tag.DeleteTagResponse;
import com.train.trainingmaterial.model.response.tag.GetAllTagResponse;
import com.train.trainingmaterial.model.response.tag.UpdateTagResponse;
import org.springframework.stereotype.Service;

@Service
public interface TagDto {
    GetAllTagResponse getAllTag();
    AddTagResponse addTag(AddTagRequest request);
    UpdateTagResponse updateTag(Long tagId, UpdateTagRequest request);
    DeleteTagResponse deleteTag(Long tagId);
}
