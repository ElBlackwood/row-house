package com.event.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.event.model.EventModel;

@Service
public class SendMail {

	private static final Logger LOG = LoggerFactory.getLogger(SendMail.class);
	
	@Value("${alertEmails}")
	private String emailsToAlert;
	
	@Autowired
	private MailSender mailSender;
	
	@Async
	public void sendMail(final EventModel event) {
		
		LOG.info("Alerting on guest event {}", event.getName());
		
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(emailsToAlert);
        message.setFrom("row-house@no-reply.com");
        message.setSubject("Guest event to approve");
        
        StringBuilder messageText = new StringBuilder();
        messageText.append("Name: ");
        messageText.append(event.getName());
        messageText.append("\n");
        messageText.append("Description: ");
        messageText.append(event.getDescription());
        messageText.append("\n");
        messageText.append("Date: ");
        messageText.append(event.getDate());
        messageText.append("\n");
        messageText.append("Email: ");
        messageText.append(event.getEmail());
        
        message.setText(messageText.toString());
        
        try {
        	
        	mailSender.send(message);
        } catch (MailException e) {
        	LOG.error("", e);
        }
		
		LOG.info("Mail done");
	}
}
