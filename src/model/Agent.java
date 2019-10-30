/* Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers */

package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the agents database table.
 * 
 */
@Entity
@Table(name="agents")
@NamedQuery(name="Agent.findAll", query="SELECT a FROM Agent a")
public class Agent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int agentId;

	private String agtEmail;

	private String agtFirstName;

	private String agtLastName;

	private String agtMiddleInitial;

	private String agtPhone;

	private String agtPosition;

	private String agtUserID;

	private String agtUserPwd;

	public Agent() {
	}

	public int getAgentId() {
		return this.agentId;
	}

	
	public Agent(int agentId, String agtFirstName, String agtMiddleInitial, String agtLastName, String agtPhone,
			String agtEmail, String agtPosition, String agtUserID, String agtUserPwd) {
		super();
		this.agentId = agentId;
		this.agtFirstName = agtFirstName;
		this.agtMiddleInitial = agtMiddleInitial;
		this.agtLastName = agtLastName;
		this.agtPhone = agtPhone;
		this.agtEmail = agtEmail;
		this.agtPosition = agtPosition;
		this.agtUserID = agtUserID;
		this.agtUserPwd = agtUserPwd;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public String getAgtEmail() {
		return this.agtEmail;
	}

	public void setAgtEmail(String agtEmail) {
		this.agtEmail = agtEmail;
	}

	public String getAgtFirstName() {
		return this.agtFirstName;
	}

	public void setAgtFirstName(String agtFirstName) {
		this.agtFirstName = agtFirstName;
	}

	public String getAgtLastName() {
		return this.agtLastName;
	}

	public void setAgtLastName(String agtLastName) {
		this.agtLastName = agtLastName;
	}

	public String getAgtMiddleInitial() {
		return this.agtMiddleInitial;
	}

	public void setAgtMiddleInitial(String agtMiddleInitial) {
		this.agtMiddleInitial = agtMiddleInitial;
	}

	public String getAgtPhone() {
		return this.agtPhone;
	}

	public void setAgtPhone(String agtPhone) {
		this.agtPhone = agtPhone;
	}

	public String getAgtPosition() {
		return this.agtPosition;
	}

	public void setAgtPosition(String agtPosition) {
		this.agtPosition = agtPosition;
	}

	public String getAgtUserID() {
		return this.agtUserID;
	}

	public void setAgtUserID(String agtUserID) {
		this.agtUserID = agtUserID;
	}

	public String getAgtUserPwd() {
		return this.agtUserPwd;
	}

	public void setAgtUserPwd(String agtUserPwd) {
		this.agtUserPwd = agtUserPwd;
	}

}