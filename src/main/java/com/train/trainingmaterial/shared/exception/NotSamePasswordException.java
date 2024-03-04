package com.train.trainingmaterial.shared.exception;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class NotSamePasswordException extends BaseException{
    public NotSamePasswordException(String message){
        super(message);
    }
}
