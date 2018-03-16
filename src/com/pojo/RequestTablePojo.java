package com.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;


@Entity
@Table(name="ReqTableGroManager")
public class RequestTablePojo {
	
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int Id;
	
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	private String ReqFrom,ReqTo,UserDp,OwnerDp,Status;

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getOwnerDp() {
		return OwnerDp;
	}

	public void setOwnerDp(String ownerDp) {
		OwnerDp = ownerDp;
	}

	public String getUserDp() {
		return UserDp;
	}

	public void setUserDp(String userDp) {
		UserDp = userDp;
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

	

}
