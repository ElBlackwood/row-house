package com.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.event.model.EventModel;
import com.event.service.EventModelService;
import com.event.service.SendMail;

@Controller
public class HomeController {
	
	private static Logger LOG = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private EventModelService eventModelService;
	
	@Autowired
	private SendMail sendMail;
	
	@Value("${alertGuestSubmission}")
	private boolean alertGuestSubmission;

	@RequestMapping("/home")
	public String home(Model model, @RequestParam(value = "guestEvent", required = false) String guestEvent) {

		LOG.debug("Homepage hit");
		
		model.addAttribute("events", eventModelService.listEvents(false));
		model.addAttribute("guestEvents", eventModelService.listGuestEvents(false));
		
		if (guestEvent != null) {
			model.addAttribute("msg", "Thank you for your submission. Our admin team have been notified and should approve your event shortly");
		}
		
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
	public String addEvent(Model model, @ModelAttribute EventModel event, @RequestParam("previewFlag") String flag) {
		
		if (flag.equals("true")) {
			model.addAttribute("event", event);
			return "singleEvent";
		}

		LOG.debug("Adding guest event: {}", event.getName());
		
		event.setApproved(false);
		event.setGuestEvent(true);
		
		eventModelService.addEvent(event);
		
		if (alertGuestSubmission) {
			sendMail.sendMail(event);
		}
		
		return "redirect:/home?guestEvent";
		
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
	
	@RequestMapping("/singleEvent/{id}")
	public String showSingleEvent(Model model, @PathVariable("id") int id) {
		
		model.addAttribute("event", eventModelService.getEvent(id));
		
		return "singleEvent";
	}
}
