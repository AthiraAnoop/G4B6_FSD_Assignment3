package com.gl.dao;

import java.util.List;

import com.gl.entity.TicketModel;

public interface TicketDAO {

	public List<TicketModel> getAllTickets();
	public void saveTicket(TicketModel theTicket);
	public TicketModel getTicket(int theId);
	public void deleteTicket(int theId);
	public List<TicketModel> getSearchWithTitle(String title);
	
}
