package com.example.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;

@Entity
public class Payment {
	@Id
	@GeneratedValue
	private Long id;

	private String paymentId;
	private Long referenceId;

	@ManyToOne
	private Register user;

	@Enumerated(EnumType.STRING)
	private TransportType transportType;

	@ManyToOne
	private Bus bus;

	@ManyToOne
	private Flight flight;

	@ManyToOne
	private Car car;

	private double amount;
	private int rentalDaysPaid; 

	@ManyToOne
	private Card card;

	@ElementCollection
	@CollectionTable(name = "payment_seats", joinColumns = @JoinColumn(name = "payment_id"))
	@Column(name = "paymentSeats")
	private List<String> paymentSeats;

	public enum TransportType {
		BUS, FLIGHT, CAR
	}

	public Payment() {

	}

	public Payment(Long id, String paymentId, Long referenceId, Register user, TransportType transportType, Bus bus,
			Flight flight, Car car, double amount, int rentalDaysPaid, Card card, List<String> paymentSeats) {
		super();
		this.id = id;
		this.paymentId = paymentId;
		this.referenceId = referenceId;
		this.user = user;
		this.transportType = transportType;
		this.bus = bus;
		this.flight = flight;
		this.car = car;
		this.amount = amount;
		this.rentalDaysPaid = rentalDaysPaid;
		this.card = card;
		this.paymentSeats = paymentSeats;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public Long getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(Long referenceId) {
		this.referenceId = referenceId;
	}

	public Register getUser() {
		return user;
	}

	public void setUser(Register user) {
		this.user = user;
	}

	public TransportType getTransportType() {
		return transportType;
	}

	public void setTransportType(TransportType transportType) {
		this.transportType = transportType;
	}

	public Bus getBus() {
		return bus;
	}

	public void setBus(Bus bus) {
		this.bus = bus;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getRentalDaysPaid() {
		return rentalDaysPaid;
	}

	public void setRentalDaysPaid(int rentalDaysPaid) {
		this.rentalDaysPaid = rentalDaysPaid;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public List<String> getPaymentSeats() {
		return paymentSeats;
	}

	public void setPaymentSeats(List<String> paymentSeats) {
		this.paymentSeats = paymentSeats;
	}
}
