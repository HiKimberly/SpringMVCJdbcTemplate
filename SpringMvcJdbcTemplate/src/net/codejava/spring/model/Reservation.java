package net.codejava.spring.model;

public class Reservation {
	private String BookingNO;
    private String Customer;
    private String ReserveDate;
    private String ReserveTime;
    private String Phone;
    private int    Amount;

    public Reservation() {
	}

	public Reservation(String bookingNO ,String customer, String reserveDate, String reserveTime, String phone,int amount) {
		this.BookingNO = bookingNO;
		this.Customer = customer;
		this.ReserveDate = reserveDate;
		this.ReserveTime = reserveTime;
		this.Phone = phone;
		this.Amount = amount;
	}
    
	public void setBookingNO(String bookingNO){
    	this.BookingNO = bookingNO;
    }
    public String getBookingNO(){
    	return BookingNO;
    }
	
    public void setCustomer(String customer){
    	this.Customer = customer;
    }
    public String getCustomer(){
    	return Customer;
    }
    
    public void setReserveDate(String reserveDate){
    	this.ReserveDate = reserveDate;
    }
    public String getReserveDate(){
    	return ReserveDate;
    }
    
    public void setReserveTime(String reserveTime){
    	this.ReserveTime = reserveTime;
    }
    public String getReserveTime(){
    	return ReserveTime;
    }
    
    public void setPhone(String phone){
    	this.Phone = phone;
    }
    public String getPhone(){
    	return Phone;
    }
    
    public void setAmount(int amount){
    	this.Amount = amount;
    }
    public int getAmount(){
    	return Amount;
    }
}
