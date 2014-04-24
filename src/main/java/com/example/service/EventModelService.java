package com.example.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;

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
	public List<EventModel> listEvents() {
		Query e = em.createQuery("select e from EventModel e where e.guestEvent = false");
		
		List<EventModel> events = e.getResultList();
		return events;
	}
	
	@Transactional
	public List<EventModel> listGuestEvents() {
		Query e = em.createQuery("select e from EventModel e where e.guestEvent = true");//TODO check approved
		
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
}
