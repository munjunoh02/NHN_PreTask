package com.spring.nhn.model;

public class NHNModel {
	private String _email;
	private String _password;
	private String _content;
	private String _date = null;
	
	public NHNModel(){
		
	}
	
	public NHNModel(String email, String password, String content){
		this._email = email;
		this._password = password;
		this._content = content;
	}
	
	public String getEmail() {
		return this._email;
	}

	public void setEmail(String email) {
		this._email = email;
	}

	public String getPassword() {
		return this._password;
	}

	public void setPassword(String password) {
		this._password = password;
	}

	public String getContent() {
		return this._content;
	}

	public void setContent(String content) {
		this._content = content;
	}
	
	public String getDate() {
		return this._date;
	}

	public void setDate(String date) {
		this._date = date;
	}

}