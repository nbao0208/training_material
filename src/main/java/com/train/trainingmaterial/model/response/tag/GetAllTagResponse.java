package com.train.trainingmaterial.model.response.tag;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetAllTagResponse {
  long total;
  List<TagDetailResponse> tagDetail;
}
