package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.EventModel;
import com.example.service.EventModelService;


@Controller
public class HomeController {
	
	private static Logger LOG = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private EventModelService eventModelService;

	@RequestMapping("/home")
	public String home(Model model) {

		LOG.debug("Homepage hit");
		
		model.addAttribute("events", eventModelService.listEvents());
		
		return "home";
	}
	
	@RequestMapping("/admin")
	public String adminPage(Model model) {
		
		LOG.debug("Admit hit");
		
		
		model.addAttribute("eventModel", new EventModel());
		
		return "admin";
	}
	
	@RequestMapping("/addEvent")
	public String addEvent(Model model, @ModelAttribute EventModel event) {
		
		LOG.debug("Adding event: {}", event.getName());
		
		eventModelService.addEvent(event);
		
		model.addAttribute("events", eventModelService.listEvents());
		
		return "redirect:/people/home";
		
	}
}
