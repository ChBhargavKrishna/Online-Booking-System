package com.example.entity;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
public class Register {

	@Id
	private String fullName;
	private String gender;
	private int age;
	private LocalDate DOB;
	private String contactNo;
	private String state;
	private String pinCode;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Login")
	private Login login;

	public Register() {

	}

	public Register(String fullName, String gender, int age, LocalDate dOB, String contactNo, String state,
			String pinCode, Login login) {
		super();
		this.fullName = fullName;
		this.gender = gender;
		this.age = age;
		DOB = dOB;
		this.contactNo = contactNo;
		this.state = state;
		this.pinCode = pinCode;
		this.login = login;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public LocalDate getDOB() {
		return DOB;
	}

	public void setDOB(LocalDate dOB) {
		DOB = dOB;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	@Override
	public String toString() {
		return "Register [fullName=" + fullName + ", gender=" + gender + ", age=" + age + ", DOB=" + DOB
				+ ", contactNo=" + contactNo + ", state=" + state + ", pinCode=" + pinCode + ", login=" + login + "]";
	}

}
