package com.train.trainingmaterial.controller;

import com.train.trainingmaterial.model.common.Response;
import com.train.trainingmaterial.model.request.tag.AddTagRequest;
import com.train.trainingmaterial.model.request.tag.UpdateTagRequest;
import com.train.trainingmaterial.model.response.tag.AddTagResponse;
import com.train.trainingmaterial.model.response.tag.DeleteTagResponse;
import com.train.trainingmaterial.model.response.tag.GetAllTagResponse;
import com.train.trainingmaterial.model.response.tag.UpdateTagResponse;
import com.train.trainingmaterial.service.TagService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/tag")
@Slf4j
@AllArgsConstructor
public class TagController {
    private final TagService tagService;

    @GetMapping(value = "")
    public Response<GetAllTagResponse> getAllTag(){
        return tagService.getAllTag();
    }

    @PostMapping(value = "",produces = {MediaType.APPLICATION_JSON_VALUE})
    public Response<AddTagResponse> addTag(@Valid @RequestBody AddTagRequest request){
        return tagService.addTag(request);
    }

    @PutMapping(value = "/{tag_id}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public Response<UpdateTagResponse> updateTag(@PathVariable(value = "tag_id")Long tagId,@RequestBody UpdateTagRequest request){
        return tagService.updateTag(tagId,request);
    }
    @DeleteMapping(value = "/{tag_id}")
    public Response<DeleteTagResponse> deleteTag(@PathVariable(value = "tag_id")Long tagId){
        return tagService.deleteTag(tagId);
    }
}
