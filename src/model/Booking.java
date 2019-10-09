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

	@Temporal(TemporalType.TIMESTAMP)
	private Date bookingDate;

	private String bookingNo;

	private double travelerCount;

	private String tripTypeId;

	private Integer customerId;
	
	private Integer packageId;

	/*
	 * //bi-directional many-to-one association to Customer
	 * 
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="CustomerId") private Customer customer;
	 *
	 * /* //bi-directional many-to-one association to Package
	 * 
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="PackageId") private Package package;
	 * 
	 */

	public Booking() {
	}

	
	public Booking(int bookingId, Date bookingDate, String bookingNo, double travelerCount, Integer customerId,
			String tripTypeId, Integer packageId) {
		super();
		this.bookingId = bookingId;
		this.bookingDate = bookingDate;
		this.bookingNo = bookingNo;
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

	public String getBookingNo() {
		return this.bookingNo;
	}

	public void setBookingNo(String bookingNo) {
		this.bookingNo = bookingNo;
	}

	public double getTravelerCount() {
		return this.travelerCount;
	}

	public void setTravelerCount(double travelerCount) {
		this.travelerCount = travelerCount;
	}

	public String getTripTypeId() {
		return this.tripTypeId;
	}

	public void setTripTypeId(String tripTypeId) {
		this.tripTypeId = tripTypeId;
	}

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	public Integer getPackageId() {
		return this.packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}
	
	/*
	 * public Customer getCustomer() { return this.customer; }
	 * 
	 * public void setCustomer(Customer customer) { this.customer = customer; }
	 * 
	 * public Package getPackage() { return this.package; }
	 * 
	 * public void setPackage(Package package) { this.package = package; }
	 */

}