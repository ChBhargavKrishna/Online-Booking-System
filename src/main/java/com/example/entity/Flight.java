package com.example.entity;

import java.time.*;
import java.util.*;
import jakarta.persistence.*;

@Entity
public class Flight {
	@Id
	@GeneratedValue
	private Long id;

	private String flightName;
	private String category;
	private LocalDate departDate;
	private LocalTime departTime;
	private LocalTime arriveTime;
	private String startLocation;
	private String destination;
	private Double price;

	@ElementCollection
	private List<String> seats;

	@ElementCollection
	private Set<String> bookedSeats = new HashSet<>();

	public Flight() {
		this.seats = List.of("A1 L", "A2 S", "A3 U", "A4 L", "A5 S", "A6 U", "A7 L", "A8 S", "A9 U", "A10 L", "B1 S",
				"B2 U", "B3 L", "B4 S", "B5 U", "B6 L", "B7 S", "B8 U", "B9 L", "B10 U");
		this.bookedSeats = new HashSet<>();
	}

	public Flight(Long id, String flightName, String category, LocalDate departDate, LocalTime departTime,
			String startLocation, String destination, Double price) {
		this.id = id;
		this.flightName = flightName;
		this.category = category;
		this.departDate = departDate;
		this.departTime = departTime;
		this.startLocation = startLocation;
		this.destination = destination;
		this.price = price;
		this.seats = List.of("A1 L", "A2 S", "A3 U", "A4 L", "A5 S", "A6 U", "A7 L", "A8 S", "A9 U", "A10 L", "B1 S",
				"B2 U", "B3 L", "B4 S", "B5 U", "B6 L", "B7 S", "B8 U", "B9 L", "B10 U");
		this.bookedSeats = new HashSet<>();
		this.arriveTime = departTime.plusHours(5); // Calculate arrival time
	}

	public void bookSeat(String seat) {
		if (!bookedSeats.contains(seat)) {
			bookedSeats.add(seat);
		}
	}

	public Set<String> getBookedSeats() {
		return bookedSeats;
	}

	public void setBookedSeats(Set<String> bookedSeats) {
		this.bookedSeats = bookedSeats;
	}

	public List<String> getAvailableFlgSeats() {
		List<String> available_Seats = new ArrayList<>(seats);
		available_Seats.removeAll(bookedSeats);
		return available_Seats;
	}

	public List<List<String>> getSeat() {
		List<List<String>> groups = new ArrayList<>();
		List<String> rowA = List.of("A1 L", "A2 S", "A3 U", "A4 L", "A5 S", "A6 U", "A7 L", "A8 S", "A9 U", "A10 L");
		List<String> rowB = List.of("B1 S", "B2 U", "B3 L", "B4 S", "B5 U", "B6 L", "B7 S", "B8 U", "B9 L", "B10 U");

		groups.add(rowA);
		groups.add(rowB);

		return groups;
	}

	public int getFlightSeatsCount() {
		return seats.size() - bookedSeats.size();
	}

	public int getFlightBookCount() {
		return bookedSeats.size();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public LocalDate getDepartDate() {
		return departDate;
	}

	public void setDepartDate(LocalDate departDate) {
		this.departDate = departDate;
	}

	public LocalTime getDepartTime() {
		return departTime;
	}

	public void setDepartTime(LocalTime departTime) {
		this.departTime = departTime;
	}

	public LocalTime getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(LocalTime arriveTime) {
		this.arriveTime = arriveTime;
	}

	public String getStartLocation() {
		return startLocation;
	}

	public void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
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

}
