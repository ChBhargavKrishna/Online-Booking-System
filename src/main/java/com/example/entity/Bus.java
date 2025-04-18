package com.example.entity;

import java.time.*;
import java.util.*;

import jakarta.persistence.*;

@Entity
public class Bus {
	@Id
	@GeneratedValue
	private Long bus_id;

	private String busName;
	private String category;
	private LocalDate travelDate;
	private LocalTime travelTime;
	private String departurePlace;
	private String arrivalPlace;
	private Double price;

	@ElementCollection
	private List<String> seats;

	@ElementCollection
	private Set<String> booked_Seats = new HashSet<>();

	public Bus() {
		this.seats = List.of("A1 L", "A2 U", "A3 S", "A4 L", "A5 U", "B1 L", "B2 U", "B3 L", "B4 S", "B5 U", "C1 S",
				"C2 L", "C3 U", "C4 L", "C5 U", "D1 L", "D2 S", "D3 U", "D4 L", "D5 U");
		this.booked_Seats = new HashSet<>();
	}

	public Bus(Long bus_id, String busName, String category, LocalDate travelDate, LocalTime travelTime,
			String departurePlace, String arrivalPlace, Double price) {
		this.bus_id = bus_id;
		this.busName = busName;
		this.category = category;
		this.travelDate = travelDate;
		this.travelTime = travelTime;
		this.departurePlace = departurePlace;
		this.arrivalPlace = arrivalPlace;
		this.price = price;
		this.seats = List.of("A1 L", "A2 U", "A3 S", "A4 L", "A5 U", "B1 L", "B2 U", "B3 L", "B4 S", "B5 U", "C1 S",
				"C2 L", "C3 U", "C4 L", "C5 U", "D1 L", "D2 S", "D3 U", "D4 L", "D5 U");
		this.booked_Seats = new HashSet<>();
	}

	public List<String> getAvailableSeats() {
		List<String> availableSeats = new ArrayList<>(seats);
		availableSeats.removeAll(booked_Seats);
		return availableSeats;
	}

	public void bookSeat(String seat) {
		if (!booked_Seats.contains(seat)) {
			booked_Seats.add(seat);
		}
	}

	public List<List<String>> getSeatGroups() {
		List<List<String>> groups = new ArrayList<>();
		List<String> rowA = List.of("A1 L", "A2 U", "A3 S", "A4 L", "A5 U", "B1 L", "B2 U", "B3 L", "B4 S", "B5 U");
		List<String> rowB = List.of("C1 S", "C2 L", "C3 U", "C4 L", "C5 U", "D1 L", "D2 S", "D3 U", "D4 L", "D5 U");

		groups.add(rowA);
		groups.add(rowB);

		return groups;
	}

	public int getAvailableSeatsCount() {
		return seats.size() - booked_Seats.size();
	}

	public int getBookSeatCount() {
		return booked_Seats.size();
	}

	public Long getBus_id() {
		return bus_id;
	}

	public void setBus_id(Long bus_id) {
		this.bus_id = bus_id;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public LocalDate getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(LocalDate travelDate) {
		this.travelDate = travelDate;
	}

	public LocalTime getTravelTime() {
		return travelTime;
	}

	public void setTravelTime(LocalTime travelTime) {
		this.travelTime = travelTime;
	}

	public String getDeparturePlace() {
		return departurePlace;
	}

	public void setDeparturePlace(String departurePlace) {
		this.departurePlace = departurePlace;
	}

	public String getArrivalPlace() {
		return arrivalPlace;
	}

	public void setArrivalPlace(String arrivalPlace) {
		this.arrivalPlace = arrivalPlace;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public List<String> getSeats() {
		return seats;
	}

	public void setSeats(List<String> seats) {
		this.seats = seats;
	}

	public Set<String> getBooked_Seats() {
		return booked_Seats;
	}

	public void setBooked_Seats(Set<String> booked_Seats) {
		this.booked_Seats = booked_Seats;
	}
}