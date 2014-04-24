package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.EventModel;
import com.example.service.EventModelService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static Logger LOG = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private EventModelService eventModelService;
	

	/**
	 * Displays create event page
	 * @param model
	 * @return
	 */
	@RequestMapping("/createEvent")
	public String createEvent(Model model) {
		LOG.debug("Creating event");
		
		model.addAttribute("eventModel", new EventModel());
		
		return "createEvent";
	}
	
	/**
	 * Creates the event
	 * @param model
	 * @param event
	 * @return
	 */
	@RequestMapping("/addEvent")
	public String addEvent(Model model, @ModelAttribute EventModel event) {
		
		LOG.debug("Adding event: {}", event.getName());
		
		eventModelService.addEvent(event);
		
		model.addAttribute("events", eventModelService.listEvents());
		
		return "redirect:/home";
		
	}
	
	@RequestMapping("/deleteEvent")
	public String deleteEvent(Model model) {
		
		LOG.debug("Delete event page");
		
		model.addAttribute("events", eventModelService.listEvents());
		
		model.addAttribute("deleting", "true");
		return "home";
	}
	
	@RequestMapping("/deleteEvent/{event-id}")
	public String deleteSingleEvent(Model model, @PathVariable("event-id") int eventId) {
		
		LOG.debug("Delete an event with id {}", eventId);
		
		eventModelService.removeEvent(eventId);
		
		model.addAttribute("events", eventModelService.listEvents());
		
		return "redirect:/admin/deleteEvent";
	}
}
