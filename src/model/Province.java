/* Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers */

package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the province database table.
 * 
 */
@Entity
@Table(name="provinces")
@NamedQuery(name="Province.findAll", query="SELECT p FROM Province p")
public class Province implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String provCode;

	private String country;

	private String provName;

	public Province() {
	}

	public String getProvCode() {
		return this.provCode;
	}

	public void setProvCode(String provCode) {
		this.provCode = provCode;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvName() {
		return this.provName;
	}

	public void setProvName(String provName) {
		this.provName = provName;
	}

}