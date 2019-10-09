package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the customers database table.
 * 
 */
@Entity
@Table(name="customers")
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int customerId;

	private String custAddress;

	private String custCity;

	private String custCountry;

	private String custEmail;

	private String custFirstName;

	private String custLastName;

	private String custPhone;

	private String custPostal;

	private String custProv;

	private String custUserID;

	private String custUserPwd;

	/*
	 * //bi-directional many-to-one association to Booking
	 * 
	 * @OneToMany(mappedBy="customer") private List<Booking> bookings;
	 */

	public Customer() {
	}

	public Customer(int customerId, String custFirstName, String custLastName, String custAddress, String custCity,
			String custProv, String custCountry, String custPostal, String custPhone, String custEmail,
			String custUserID, String custUserPwd) {
		super();
		this.customerId = customerId;
		this.custFirstName = custFirstName;
		this.custLastName = custLastName;
		this.custAddress = custAddress;
		this.custCity = custCity;
		this.custProv = custProv;
		this.custCountry = custCountry;
		this.custPostal = custPostal;
		this.custPhone = custPhone;
		this.custEmail = custEmail;
		this.custUserID = custUserID;
		this.custUserPwd = custUserPwd;
	}

	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustAddress() {
		return this.custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public String getCustCity() {
		return this.custCity;
	}

	public void setCustCity(String custCity) {
		this.custCity = custCity;
	}

	public String getCustCountry() {
		return this.custCountry;
	}

	public void setCustCountry(String custCountry) {
		this.custCountry = custCountry;
	}

	public String getCustEmail() {
		return this.custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustFirstName() {
		return this.custFirstName;
	}

	public void setCustFirstName(String custFirstName) {
		this.custFirstName = custFirstName;
	}

	public String getCustLastName() {
		return this.custLastName;
	}

	public void setCustLastName(String custLastName) {
		this.custLastName = custLastName;
	}

	public String getCustPhone() {
		return this.custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustPostal() {
		return this.custPostal;
	}

	public void setCustPostal(String custPostal) {
		this.custPostal = custPostal;
	}

	public String getCustProv() {
		return this.custProv;
	}

	public void setCustProv(String custProv) {
		this.custProv = custProv;
	}

	public String getCustUserID() {
		return this.custUserID;
	}

	public void setCustUserID(String custUserID) {
		this.custUserID = custUserID;
	}

	public String getCustUserPwd() {
		return this.custUserPwd;
	}

	public void setCustUserPwd(String custUserPwd) {
		this.custUserPwd = custUserPwd;
	}

	/*
	 * public List<Booking> getBookings() { return this.bookings; }
	 * 
	 * public void setBookings(List<Booking> bookings) { this.bookings = bookings; }
	 * 
	 * public Booking addBooking(Booking booking) { getBookings().add(booking);
	 * booking.setCustomer(this);
	 * 
	 * return booking; }
	 * 
	 * public Booking removeBooking(Booking booking) {
	 * getBookings().remove(booking); booking.setCustomer(null);
	 * 
	 * return booking; }
	 */
}