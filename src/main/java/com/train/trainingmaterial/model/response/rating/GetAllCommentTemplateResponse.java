package com.train.trainingmaterial.model.response.rating;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetAllCommentTemplateResponse {
  private List<String> commentTemplates;
}
