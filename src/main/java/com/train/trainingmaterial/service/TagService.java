package com.train.trainingmaterial.service;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.tag.AddTagRequest;
import com.train.trainingmaterial.model.request.tag.UpdateTagRequest;
import com.train.trainingmaterial.model.response.tag.AddTagResponse;
import com.train.trainingmaterial.model.response.tag.DeleteTagResponse;
import com.train.trainingmaterial.model.response.tag.GetAllTagResponse;
import com.train.trainingmaterial.model.response.tag.UpdateTagResponse;
import org.springframework.stereotype.Service;

@Service
public interface TagService {
    Response<GetAllTagResponse> getAllTag();

    Response<AddTagResponse> addTag(AddTagRequest request);

    Response<UpdateTagResponse> updateTag(Long tagId, UpdateTagRequest request);

    Response<DeleteTagResponse> deleteTag(Long tagId);
}
