package com.train.trainingmaterial.controller;

import java.time.LocalTime;
import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class CheckingTime {
  private LocalTime startMoment;
  private LocalTime endMoment;

  public CheckingTime() {
    this.startMoment = LocalTime.of(0, 0);
    this.endMoment = LocalTime.of(0, 0);
  }
}
