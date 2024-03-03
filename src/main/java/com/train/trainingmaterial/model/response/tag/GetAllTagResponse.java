package com.train.trainingmaterial.model.response.tag;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class GetAllTagResponse {
    long total;
    List<TagDetailResponse> tagDetail;
}
