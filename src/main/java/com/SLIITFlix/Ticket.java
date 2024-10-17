package com.SLIITFlix;

public class Ticket {

	String tid;
	String uid;
	String name;
	String subject;
	String description;
	String status;
	String priority;
	String date;
	
	
	public Ticket(String tid, String uid, String name, String subject, String description, String status, String priority, String date) {
		
		this.tid = tid;
		this.uid = uid;
		this.name = name;
		this.subject = subject;
		this.description = description;
		this.status = status;
		this.priority = priority;
		this.date = date;
	}

	

	public Ticket() {
		super();
	}



	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTid() {
		return tid;
	}


	public void setTid(String tid) {
		this.tid = tid;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPriority() {
		return priority;
	}


	public void setPriority(String priority) {
		this.priority = priority;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}

}
