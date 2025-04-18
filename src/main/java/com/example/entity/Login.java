package com.example.entity;

import jakarta.persistence.*;

@Entity
public class Login {

	@Id
	public String userName;
	public String passCode;

	public Login(String userName, String passCode) {
		super();
		this.userName = userName;
		this.passCode = passCode;
	}

	public Login() {

	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassCode() {
		return passCode;
	}

	public void setPassCode(String passCode) {
		this.passCode = passCode;
	}

	@Override
	public String toString() {
		return "Login [userName=" + userName + ", passCode=" + passCode + "]";
	}

}
