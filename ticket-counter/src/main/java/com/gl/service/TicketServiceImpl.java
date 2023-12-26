package com.gl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.TicketDAO;
import com.gl.entity.TicketModel;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	private TicketDAO ticketDAO;
	
	@Override
	@Transactional
	public List<TicketModel> getAllTickets() {
		return ticketDAO.getAllTickets();
	}

	@Override
	@Transactional
	public List<TicketModel> getSearchWithTitle(String title) {
		return ticketDAO.getSearchWithTitle(title);
	}
	
	@Override
	@Transactional
	public void saveTicket(TicketModel theTicket) {
		ticketDAO.saveTicket(theTicket);	
	}

	@Override
	@Transactional
	public TicketModel getTicket(int theId) {
		
		return ticketDAO.getTicket(theId);
	}

	@Override
	@Transactional
	public void deleteTicket(int theId) {
		
		ticketDAO.deleteTicket(theId);
		
	}

	
	
	

}
