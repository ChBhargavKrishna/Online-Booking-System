package com.example.entity;

import jakarta.persistence.*;

@Entity
public class Card {
	@Id
	@GeneratedValue
	private Long card_id;
	private String card_number;
	private String card_holder;
	private String expiryDate;
	private String cvv;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "fullName", unique = true)
	private Register register;

	public Card() {

	}

	public Card(Long card_id, String card_number, String card_holder, String expiryDate, String cvv,
			Register register) {
		super();
		this.card_id = card_id;
		this.card_number = card_number;
		this.card_holder = card_holder;
		this.expiryDate = expiryDate;
		this.cvv = cvv;
		this.register = register;
	}

	public Long getCard_id() {
		return card_id;
	}

	public void setCard_id(Long card_id) {
		this.card_id = card_id;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getCard_holder() {
		return card_holder;
	}

	public void setCard_holder(String card_holder) {
		this.card_holder = card_holder;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public Register getRegister() {
		return register;
	}

	public void setRegister(Register register) {
		this.register = register;
	}
}
