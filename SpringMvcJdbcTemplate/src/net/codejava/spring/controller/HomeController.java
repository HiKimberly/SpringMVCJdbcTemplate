package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import net.codejava.spring.dao.ReservationDAO;
import net.codejava.spring.dao.ReservationDAOImpl;
import net.codejava.spring.model.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * This controller routes accesses to the application to the appropriate
 * hanlder methods. 
 * @author www.codejava.net
 *
 */
@Controller
public class HomeController {

//	@Autowired
//	private ContactDAO contactDAO;
	@Autowired
	private ReservationDAO reservationDAO;
	
	@RequestMapping(value = "/index")
	public ModelAndView index(@ModelAttribute Reservation reservation) {
//		System.out.println("!!!!***"+reservation.getBookingNO());
//		System.out.println("!!!!***"+reservation.getAmount());
		ModelAndView model = new ModelAndView("index2");	
		return model;
	}
	
	@RequestMapping(value="/")
	public ModelAndView listContact(ModelAndView model) throws IOException{
//		List<Contact> listContact = contactDAO.list();
//		model.addObject("listContact", listContact);
		
		List<Reservation> listReserve = reservationDAO.list(null);
		model.addObject("listReserve", listReserve);
		
		
		//List<Reservation> listReserve = reservationDAO.list();
//		for(int i = 0 ; i < listReserve.size() ; i++){
//			Reservation r = listReserve.get(i);
//			System.out.println("r:" + r.getBookingNO());
//		}
		
//		model.addObject("listReserve", listReserve);
		
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value="/selectReservation", method = RequestMethod.GET)
	public ModelAndView selectReservation(HttpServletRequest request){
		//System.out.println("reservation");
		String bookdate = request.getParameter("datepicker");
//		System.out.println(bookdate);
		List<Reservation> listReserve = reservationDAO.list(bookdate);
		ModelAndView model = new ModelAndView();
		model.addObject("listReserve", listReserve);
		model.setViewName("home");
		return model;
		//contactDAO.delete(contactId);
		//return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/deleteBooking", method = RequestMethod.GET)
	public ModelAndView deleteBooking(HttpServletRequest request) {
		String bookingNO = request.getParameter("bookingNO");
		
		reservationDAO.delete(bookingNO);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/editBooking", method = RequestMethod.GET)
	public ModelAndView editBooking(HttpServletRequest request) {
		String bookingNO = request.getParameter("bookingNO");
		Reservation reservation = reservationDAO.get(bookingNO);
		ModelAndView model = new ModelAndView("EditForm");
		model.addObject("reservation", reservation);		
		return model;
	}	

	@RequestMapping(value = "/saveBooking", method = RequestMethod.POST)
	public ModelAndView saveBooking(@ModelAttribute Reservation reservation) {
//		System.out.println("!!!!***"+reservation.getBookingNO());
//		System.out.println("!!!!***"+reservation.getAmount());
		reservationDAO.saveOrUpdate(reservation);		
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/newReservation", method = RequestMethod.GET)
	public ModelAndView newReservation(ModelAndView model) {
		Reservation newReservation = new Reservation();
		model.addObject("reservation", newReservation);	
		model.setViewName("EditForm");
		return model;
	}
	
}
