package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
		model.addAttribute("events", eventModelService.listEvents(false));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(false));
		
		return "home";
	}
	
	@RequestMapping("/admin")
	public String adminPage() {
		
		LOG.debug("Admit hit");
		
		return "admin";
	}
	
	@RequestMapping("/aboutus")
	public String aboutusPage(Model model) {
		
		LOG.debug("About us hit");
		
		return "aboutus";
	}
	
	@RequestMapping("/contact")
	public String contactPage(Model model) {
		
		LOG.debug("Contact us hit");
		
		return "contact";
	}
	

	//Spring Security see this :
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {
 
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
 
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
 
		return model;
 
	}
	
	@RequestMapping("/addEvent")
	public String addEvent(Model model, @ModelAttribute EventModel event) {
		
		LOG.debug("Adding guest event: {}", event.getName());
		
		event.setApproved(false);
		event.setGuestEvent(true);
		
		eventModelService.addEvent(event);
		
		model.addAttribute("events", eventModelService.listEvents(false));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(false));
		
		return "redirect:/home";
		
	}
	
	
	/**
	 * Displays create event page for guests
	 * @param model
	 * @return
	 */
	@RequestMapping("/guestSubmit")
	public String createEvent(Model model) {
		LOG.debug("Creating guest event");
		
		model.addAttribute("guest", true);
		model.addAttribute("eventModel", new EventModel());
		
		return "createEvent";
	}
}
