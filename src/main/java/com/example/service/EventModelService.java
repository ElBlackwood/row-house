package com.example.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

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
		CriteriaQuery<EventModel> e = em.getCriteriaBuilder().createQuery(EventModel.class);
		e.from(EventModel.class);
		
		return em.createQuery(e).getResultList();
	}
	
	@Transactional
	public void removeEvent(Integer id) {
		EventModel event = em.find(EventModel.class, id);
		
		if (event != null) {
			em.remove(event);
		}
	}
}
