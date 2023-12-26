package com.gl.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gl.entity.TicketModel;

@Repository
public class TicketDAOImpl implements TicketDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<TicketModel> getAllTickets() {
		
		Session session=sessionFactory.getCurrentSession();
		CriteriaBuilder cb=session.getCriteriaBuilder();
		CriteriaQuery <TicketModel> cq=cb.createQuery(TicketModel.class);
		Root <TicketModel> root=cq.from(TicketModel.class);
		cq.select(root);
		Query query=session.createQuery(cq);
		
		return query.getResultList();
	}

	@Override
	public void saveTicket(TicketModel theTicket) {
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theTicket);
			
	}

	@Override
	public TicketModel getTicket(int theId) {
		Session currentSession=sessionFactory.getCurrentSession();
		TicketModel fetchTicket=currentSession.get(TicketModel.class,theId);
		return fetchTicket;
	}

	@Override
	public void deleteTicket(int theId) {
		Session currentSession=sessionFactory.getCurrentSession();
		TicketModel ticket =currentSession.byId(TicketModel.class).load(theId);
		currentSession.delete(ticket);
		
	}

	@Override
	public List<TicketModel> getSearchWithTitle(String title) {
		
		Session session=sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<TicketModel> cq= cb.createQuery(TicketModel.class);
		Root<TicketModel> root = cq.from(TicketModel.class);
		cq.select(root).where(cb.like(cb.lower(root.get("title")),"%" + title.toLowerCase() + "%"));
		Query query =session.createQuery(cq);
		return query.getResultList();
	}
	
	

}
