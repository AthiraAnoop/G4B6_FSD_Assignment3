package com.gl.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gl.entity.TicketModel;
import com.gl.service.TicketService;

@Controller
@RequestMapping(value={"/ticket","/"})
public class TicketController {

	@Autowired
	private TicketService ticketService;
	@RequestMapping(value={"/lists","/"})
	public String list(Model model) {
		List<TicketModel> ticketslist=ticketService.getAllTickets();
		model.addAttribute("ticketlists",ticketslist);
		return "list";
	}
	
	@RequestMapping("/showForm")
	public String addTicket(Model model) {
		
		TicketModel ticketnew=new TicketModel();
		model.addAttribute("ticket",ticketnew);
		return "add-ticket";
	}
	
	@RequestMapping(value= {"/updateForm","/viewForm"})
	public String editTicket(@RequestParam("ticketId") int getId, Model model) {
		TicketModel getTicket=ticketService.getTicket(getId);
		model.addAttribute("ticket",getTicket);
		String uriPath=ServletUriComponentsBuilder.fromCurrentRequestUri().build().getPath();
		Path segmentUri=Paths.get(uriPath);
		String currentUri=segmentUri.getFileName().toString();
		model.addAttribute("currentUri", currentUri);
		return "add-ticket";
	}
		
	
	@PostMapping("/saveTicket")
	public String saveTicket(@ModelAttribute("newticket") TicketModel addNewTicket) {
		
		TicketModel tickets=new TicketModel();
		tickets.setId(addNewTicket.getId());
		tickets.setTitle(addNewTicket.getTitle());
		tickets.setDescription(addNewTicket.getDescription());
		tickets.setContent(addNewTicket.getContent());
		Date current_Date = new Date();
		tickets.setCreatedon(current_Date);
		ticketService.saveTicket(tickets);
		return "redirect:/";	
	}
	
	@RequestMapping("/searchTicket")
	public String searchTicket(@RequestParam("title") String searchTitle,Model model) {
		List <TicketModel> ticketLists=ticketService.getSearchWithTitle(searchTitle);
		System.out.println(ticketLists);
		model.addAttribute("ticketlists",ticketLists);
		return "list";
	}
	
	@RequestMapping("/deleteForm")
	public String deleteForm(@RequestParam("ticketId") int deleteId) {
		ticketService.deleteTicket(deleteId);
		return "redirect:/";
	}
}
