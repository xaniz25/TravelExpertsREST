package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;

/**
 * The persistent class for the bookings database table.
 * 
 */
@Entity
@Table(name = "bookings")
@NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b")
public class Booking implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int bookingId;

	@Temporal(TemporalType.DATE)
	private Date bookingDate;

	private Integer travelerCount;

	private String tripTypeId;

	private Integer customerId;
	
	private Integer packageId;

	public Booking() {
	}

	
	public Booking(int bookingId, Date bookingDate, Integer travelerCount, Integer customerId,
			String tripTypeId, Integer packageId) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.travelerCount = travelerCount;
		this.customerId = customerId;
		this.tripTypeId = tripTypeId;
		this.packageId = packageId;
	}


	public int getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Date getBookingDate() {
		return this.bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Integer getTravelerCount() {
		return this.travelerCount;
	}

	public void setTravelerCount(Integer travelerCount) {
		this.travelerCount = travelerCount;
	}

	public String getTripType() {
		return this.tripTypeId;
	}

	public void setTripType(String tripType) {
		this.tripTypeId = tripType;
	}

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	
	public Integer getPackageId() {
		return this.packageId;
	}

	public void setPackageId(Integer packageId) {
		this.packageId = packageId;
	}

}