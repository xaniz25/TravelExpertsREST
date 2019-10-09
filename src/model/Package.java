package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the packages database table.
 * 
 */
@Entity
@Table(name="packages")
@NamedQuery(name="Package.findAll", query="SELECT p FROM Package p")
public class Package implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int packageId;

	private BigDecimal pkgAgencyCommission;

	private BigDecimal pkgBasePrice;

	private String pkgDesc;

	@Temporal(TemporalType.DATE)
	private Date pkgEndDate;

	private String pkgName;

	@Temporal(TemporalType.DATE)
	private Date pkgStartDate;

	/*
	 * //bi-directional many-to-one association to Booking
	 * 
	 * @OneToMany(mappedBy="package") private List<Booking> bookings;
	 */

	public Package() {
	}

	public Package(int packageId, String pkgName, Date pkgStartDate, Date pkgEndDate, String pkgDesc,
			BigDecimal pkgBasePrice, BigDecimal pkgAgencyCommission) {
		super();
		this.packageId = packageId;
		this.pkgName = pkgName;
		this.pkgStartDate = pkgStartDate;
		this.pkgEndDate = pkgEndDate;
		this.pkgDesc = pkgDesc;
		this.pkgBasePrice = pkgBasePrice;
		this.pkgAgencyCommission = pkgAgencyCommission;
	}

	public int getPackageId() {
		return this.packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public BigDecimal getPkgAgencyCommission() {
		return this.pkgAgencyCommission;
	}

	public void setPkgAgencyCommission(BigDecimal pkgAgencyCommission) {
		this.pkgAgencyCommission = pkgAgencyCommission;
	}

	public BigDecimal getPkgBasePrice() {
		return this.pkgBasePrice;
	}

	public void setPkgBasePrice(BigDecimal pkgBasePrice) {
		this.pkgBasePrice = pkgBasePrice;
	}

	public String getPkgDesc() {
		return this.pkgDesc;
	}

	public void setPkgDesc(String pkgDesc) {
		this.pkgDesc = pkgDesc;
	}

	public Date getPkgEndDate() {
		return this.pkgEndDate;
	}

	public void setPkgEndDate(Date pkgEndDate) {
		this.pkgEndDate = pkgEndDate;
	}

	public String getPkgName() {
		return this.pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

	public Date getPkgStartDate() {
		return this.pkgStartDate;
	}

	public void setPkgStartDate(Date pkgStartDate) {
		this.pkgStartDate = pkgStartDate;
	}

	/*
	 * public List<Booking> getBookings() { return this.bookings; }
	 * 
	 * public void setBookings(List<Booking> bookings) { this.bookings = bookings; }
	 * 
	 * public Booking addBooking(Booking booking) { getBookings().add(booking);
	 * booking.setPackage(this);
	 * 
	 * return booking; }
	 * 
	 * public Booking removeBooking(Booking booking) {
	 * getBookings().remove(booking); booking.setPackage(null);
	 * 
	 * return booking; }
	 */

}