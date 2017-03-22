package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Reservation;

public class ReservationDAOImpl implements ReservationDAO {

	private JdbcTemplate jdbcTemplate;
	
	
	public ReservationDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Reservation get(String bookingno) {
		//System.out.println("&"+ bookingno);
		String sql = "SELECT * FROM  Customer WHERE bookingno = " + bookingno;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Reservation>() {

			@Override
			public Reservation extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					
					Reservation reservation = new Reservation();
					reservation.setBookingNO(rs.getString("bookingNO"));
					reservation.setCustomer(rs.getString("customer"));
					reservation.setReserveDate(rs.getString("reserveDate"));
					reservation.setReserveTime(rs.getString("reserveTime"));
					reservation.setPhone(rs.getString("phone"));
					reservation.setAmount(rs.getInt("amount"));
					return reservation;
				}
				
				return null;
			}
			
		});
	}

	@Override
	public List<Reservation> list(String reserveDate) {
		String plusCondition = (reserveDate==null)?"":("WHERE `ReserveDate` = " + reserveDate);
		String sql = "SELECT * FROM  Customer " + plusCondition;
//		System.out.println(2);
		List<Reservation> listReservation = jdbcTemplate.query(sql, new RowMapper<Reservation>() {
			
			@Override
			public Reservation mapRow(ResultSet rs, int rowNum) throws SQLException {
//				System.out.println("!!!rs.next");
				Reservation reservation = new Reservation();
				
				reservation.setBookingNO(rs.getString("bookingNO"));
				reservation.setCustomer(rs.getString("customer"));
				reservation.setReserveDate(rs.getString("reserveDate"));
				reservation.setReserveTime(rs.getString("reserveTime"));
				reservation.setPhone(rs.getString("phone"));
				reservation.setAmount(rs.getInt("amount"));
				return reservation;
			}
			
		});
//		System.out.println("3");
		return listReservation;
	}
	
	@Override
	public void delete(String bookingno) {
		String sql = "DELETE FROM Customer WHERE bookingno=?";
		jdbcTemplate.update(sql, bookingno);
	}


	@Override
	public void saveOrUpdate(Reservation reservation) {
		System.out.println("+"+reservation.getCustomer());
		System.out.println("+"+reservation.getReserveDate());
		System.out.println("+"+reservation.getReserveTime());
		System.out.println("+"+reservation.getPhone());
		System.out.println("+"+reservation.getAmount());
		System.out.println("+"+reservation.getBookingNO());
		
		if (!"".equals(reservation.getBookingNO())) {
			// update
			System.out.println("UPD:"+reservation.getBookingNO());
//			String sql = "UPDATE Customer SET customer=? WHERE bookingno = '20170320120002'";
//			jdbcTemplate.update(sql, "Judy");
			String sql = "UPDATE Customer SET customer=?, reserveDate=?, reserveTime=?, "
						+ "phone=? , amount=?" + " WHERE bookingno = ?";
			jdbcTemplate.update(sql, reservation.getCustomer() , reservation.getReserveDate() , 
					                 reservation.getReserveTime(),reservation.getPhone(),
					                 reservation.getAmount(),reservation.getBookingNO());
		} else {
			// insert
			System.out.println("ins");
			String sql = "INSERT INTO Customer (bookingno, customer, reserveDate, reserveTime, phone, amount)"
						+ " VALUES (?, ?, ?, ? , ?, ?)";
			String bookingno = genBookingno(reservation.getReserveDate() , reservation.getReserveTime());
			jdbcTemplate.update(sql, bookingno, reservation.getCustomer() , 
					                 reservation.getReserveDate() , reservation.getReserveTime(),
					                 reservation.getPhone(),reservation.getAmount());
		}
		
	}
	
	@Override
    public String genBookingno(String date, String time){
		String bookingno = "";
		String sql="SELECT GETBKNO(?,?) FROM DUAL";
		//String sql = "SELECT GETBKNO("+date","1200") FROM DUAL
		
				
		String bkno = (String) jdbcTemplate.queryForObject(sql,new Object[]{date , time},java.lang.String.class);
        System.out.println(date + time +"@@##" + bkno);
		if ( bkno.isEmpty() ){
			bookingno= "";
		}else { // list contains exactly 1 element
			bookingno = bkno;
		}
		return bookingno;
			
	}

}
