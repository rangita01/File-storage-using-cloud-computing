package com.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="ReqTableDataOwner")
public class RequestTablePojo_Owner {
	
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	
	private String ReqFrom,ReqTo,UserDp,Status;

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getReqFrom() {
		return ReqFrom;
	}

	public void setReqFrom(String reqFrom) {
		ReqFrom = reqFrom;
	}

	public String getReqTo() {
		return ReqTo;
	}

	public void setReqTo(String reqTo) {
		ReqTo = reqTo;
	}

	public String getUserDp() {
		return UserDp;
	}

	public void setUserDp(String userDp) {
		UserDp = userDp;
	}

}
