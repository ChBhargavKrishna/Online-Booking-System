package com.example.entity;

import jakarta.persistence.*;
import java.util.*;
import java.time.*;

@Entity
public class Car {

	@Id
	@GeneratedValue
	private Long carId;
	private String carName;
	private String carModel;
	private int seater;
	private double halfDayPrice;
	private double fullDayPrice;
	private int bookedCars;
	private long rentalDays;

	private String pickupLocation;
	private LocalDate pickupDate;
	private String pickupTime;
	private LocalDate dropoffDate;
	private String dropoffTime;

	private String status = "Not_Booked";

	public Car() {

	}

	public Car(Long carId, String carName, String carModel, int seater, double halfDayPrice, double fullDayPrice,
			int bookedCars, long rentalDays, String pickupLocation, LocalDate pickupDate, String pickupTime,
			LocalDate dropoffDate, String dropoffTime, String status) {
		super();
		this.carId = carId;
		this.carName = carName;
		this.carModel = carModel;
		this.seater = seater;
		this.halfDayPrice = halfDayPrice;
		this.fullDayPrice = fullDayPrice;
		this.bookedCars = bookedCars;
		this.rentalDays = rentalDays;
		this.pickupLocation = pickupLocation;
		this.pickupDate = pickupDate;
		this.pickupTime = pickupTime;
		this.dropoffDate = dropoffDate;
		this.dropoffTime = dropoffTime;
		this.status = status;
	}

	public Long getCarId() {
		return carId;
	}

	public void setCarId(Long carId) {
		this.carId = carId;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public int getSeater() {
		return seater;
	}

	public void setSeater(int seater) {
		this.seater = seater;
	}

	public double getHalfDayPrice() {
		return halfDayPrice;
	}

	public void setHalfDayPrice(double halfDayPrice) {
		this.halfDayPrice = halfDayPrice;
	}

	public double getFullDayPrice() {
		return fullDayPrice;
	}

	public void setFullDayPrice(double fullDayPrice) {
		this.fullDayPrice = fullDayPrice;
	}

	public int getBookedCars() {
		return bookedCars;
	}

	public void setBookedCars(int bookedCars) {
		this.bookedCars = bookedCars;
	}

	public long getRentalDays() {
		return rentalDays;
	}

	public void setRentalDays(long rentalDays) {
		this.rentalDays = rentalDays;
	}

	public String getPickupLocation() {
		return pickupLocation;
	}

	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}

	public LocalDate getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(LocalDate pickupDate) {
		this.pickupDate = pickupDate;
	}

	public String getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}

	public LocalDate getDropoffDate() {
		return dropoffDate;
	}

	public void setDropoffDate(LocalDate dropoffDate) {
		this.dropoffDate = dropoffDate;
	}

	public String getDropoffTime() {
		return dropoffTime;
	}

	public void setDropoffTime(String dropoffTime) {
		this.dropoffTime = dropoffTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
