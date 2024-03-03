package com.train.trainingmaterial.model.response.tag;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DeleteTagResponse {
    private boolean success;
}
