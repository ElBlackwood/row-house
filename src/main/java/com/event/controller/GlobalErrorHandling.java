package com.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalErrorHandling {

	private static Logger LOG = LoggerFactory.getLogger(GlobalErrorHandling.class);
	
	@ExceptionHandler(value = Exception.class)
	public String catchAllErrorHandler(Exception e) {
		
		LOG.error("Error got all the way here?!", e);
		
		System.out.println("ERROR");
		System.out.println(e);
		return "error";
	}
}
