package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Reservation;

public interface ReservationDAO {
    
	public Reservation get(String bookingNO);
	
	public List<Reservation> list(String reserveDate);
	
	
	public void delete(String bookingNO);
	
	public void saveOrUpdate(Reservation reservation);
	
	public String genBookingno(String date, String time);

}
