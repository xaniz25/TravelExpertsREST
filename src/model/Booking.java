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

	private String tripType;

	private Integer customerId;
	
	private Integer packageId;
	
	@Temporal(TemporalType.DATE)
	private Date tripStart;

	@Temporal(TemporalType.DATE)
	private Date tripEnd;

	public Booking() {
	}

	
	public Booking(int bookingId, Date bookingDate, Integer travelerCount, Integer customerId,
			String tripType, Integer packageId, Date tripStart, Date tripEnd) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.travelerCount = travelerCount;
		this.customerId = customerId;
		this.tripType = tripType;
		this.packageId = packageId;
		this.tripStart = tripStart;
		this.tripEnd = tripEnd;
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
		return this.tripType;
	}

	public void setTripType(String tripType) {
		this.tripType = tripType;
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

	public Date getTripStart() {
		return tripStart;
	}


	public void setTripStart(Date tripStart) {
		this.tripStart = tripStart;
	}


	public Date getTripEnd() {
		return tripEnd;
	}


	public void setTripEnd(Date tripEnd) {
		this.tripEnd = tripEnd;
	}
}