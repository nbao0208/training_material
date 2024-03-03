package com.train.trainingmaterial.model.response.tag;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TagDetailResponse {
    private int level;
    private String substance;
}
