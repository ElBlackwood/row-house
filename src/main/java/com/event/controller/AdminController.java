package com.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.event.model.EventModel;
import com.event.service.EventModelService;

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
	 * Displays create event page
	 * @param model
	 * @return
	 */
	@RequestMapping("/editEvent/{id}")
	public String editEvent(Model model, @PathVariable("id") int id) {
		LOG.debug("Editting event");
		
		try {
			
			EventModel event = eventModelService.getEvent(id);
			model.addAttribute("event", event);
			
		} catch (IndexOutOfBoundsException e) {
			LOG.warn("Tried to get event with index {}. Found no such event.", id, e);
			model.addAttribute("msg", "Could not find that event");

		}
		
		return "editEvent";
	}
	
	/**
	 * Displays create event page
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateEvent/{id}")
	public String updateEvent(Model model, @ModelAttribute EventModel event, @PathVariable("id") int id) {
		LOG.debug("Updating event");
		
		eventModelService.updateEvent(event, id);
		
		return "redirect:/admin/deleteEvent";
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
		
		model.addAttribute("events", eventModelService.listEvents(true));
		model.addAttribute("guestEevents", eventModelService.listGuestEvents(true));
		
		return "redirect:/home";
		
	}
	
	@RequestMapping("/deleteEvent")
	public String deleteEvent(Model model) {
		
		LOG.debug("Delete event page");
		model.addAttribute("deleting", "true");
		model.addAttribute("events", eventModelService.listEvents(true));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(true));
		
		return "home";
	}
	
	@RequestMapping("/deleteEvent/{event-id}")
	public String deleteSingleEvent(Model model, @PathVariable("event-id") int eventId) {
		
		LOG.debug("Delete an event with id {}", eventId);
		
		eventModelService.removeEvent(eventId);
		
		model.addAttribute("events", eventModelService.listEvents(true));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(true));
		
		return "redirect:/admin/deleteEvent";
	}
	
	@RequestMapping("/disableEvent/{event-id}")
	public String disableSingleEvent(Model model, @PathVariable("event-id") int eventId) {
		
		LOG.debug("Delete an event with id {}", eventId);
		
		eventModelService.disableEvent(eventId);
		model.addAttribute("events", eventModelService.listEvents(true));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(true));
		
		return "redirect:/admin/deleteEvent";
	}
	
	@RequestMapping("/enableEvent/{event-id}")
	public String enableSingleEvent(Model model, @PathVariable("event-id") int eventId) {
		
		LOG.debug("Enable an event with id {}", eventId);
		
		eventModelService.enableEvent(eventId);
		model.addAttribute("events", eventModelService.listEvents(true));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(true));
		
		return "redirect:/admin/deleteEvent";
	}
}
