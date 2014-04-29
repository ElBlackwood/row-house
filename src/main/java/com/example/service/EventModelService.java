package com.example.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.EventModel;

@Service
public class EventModelService {

	private static Logger LOG = LoggerFactory.getLogger(EventModelService.class);
	
	@PersistenceContext
	EntityManager em;
	
	@Transactional
	public void addEvent(EventModel event) {
		em.persist(event);
	}
	
	@Transactional
	public List<EventModel> listEvents(boolean all) {
		String query = "select e from EventModel e where e.guestEvent = false";
		
		return queryEvents(all, query);
	}
	
	@Transactional
	public List<EventModel> listGuestEvents(boolean all) {
		String query = "select e from EventModel e where e.guestEvent = true";
		
		return queryEvents(all, query);
	}
	
	private List<EventModel> queryEvents(boolean all, String query) {
		if (!all) {
			query += " and e.approved = true order by e.id";
		}
		Query e = em.createQuery(query);
		
		List<EventModel> events = e.getResultList();
		return events;
	}
	
	@Transactional
	public void removeEvent(Integer id) {
		EventModel event = em.find(EventModel.class, id);
		
		if (event != null) {
			em.remove(event);
		}
	}

	@Transactional
	public void disableEvent(int id) {
		EventModel event = em.find(EventModel.class, id);
		event.setApproved(false);
		em.merge(event);
	}
	
	@Transactional
	public void enableEvent(int id) {
		EventModel event = em.find(EventModel.class, id);
		
		event.setApproved(true);
		em.merge(event);
	}

	@Transactional
	public EventModel getEvent(int id) {
		EventModel event = em.find(EventModel.class, id);
		
		return event;
		
	}

	@Transactional
	public void updateEvent(EventModel event, int id) {
		EventModel eventToUpdate = em.find(EventModel.class, id);
		eventToUpdate.setDate(event.getDate());
		eventToUpdate.setDescription(event.getDescription());
		eventToUpdate.setEmail(event.getEmail());
		eventToUpdate.setLocation(event.getLocation());
		eventToUpdate.setName(event.getName());
		em.merge(eventToUpdate);
		
		
	}
}
