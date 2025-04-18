package com.example.service;

import java.util.*;
import java.time.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ICarDao;
import com.example.entity.*;

@Service
public class CarService {
	@Autowired
	private ICarDao cRepo;

	// ----Admin Methods-----
	public Car addCar(Car c1) {
		Car car = cRepo.save(c1);
		System.out.println(car);
		return car;
	}

	public List<Car> getAllCars() {
		return cRepo.findAll();
	}

	public Optional<Car> getCarById(Long carId) {
		return cRepo.findById(carId);
	}

	public Car getCarId(Long carId) {
		return cRepo.findById(carId).orElse(null);
	}

	public Car updateCar(Car c) {
		Optional<Car> exCar = cRepo.findById(c.getCarId());
		if (exCar.isPresent()) {
			Car updatedCar = exCar.get();
			updatedCar.setCarName(c.getCarName());
			updatedCar.setCarModel(c.getCarModel());
			updatedCar.setSeater(c.getSeater());
			updatedCar.setHalfDayPrice(c.getHalfDayPrice());
			updatedCar.setFullDayPrice(c.getFullDayPrice());

			return cRepo.save(updatedCar);
		}
		return null;
	}

	public void deleteCar(Long carId) {
		cRepo.deleteById(carId);
	}

	public boolean carExists(Long carId) {
		return cRepo.existsById(carId);
	}

	public long getCarCount() {
		return cRepo.count();
	}

	public long getBookedCarsCount() {
		return cRepo.findAll().stream().filter(car -> car.getBookedCars() > 0).count();
	}

	public long getAvailableCars() {
		return cRepo.countNotBookedCars();
	}

	public long getActiveCars() {
		return cRepo.findAll().stream().filter(car -> "Booked".equals(car.getStatus())).count();
	}

	// ----User Methods----
	public void bookCar(Long carId) {
		Car car = cRepo.findById(carId).orElseThrow(() -> new RuntimeException("Car not found"));
		if ("Not_Booked".equals(car.getStatus())) {
			car.setStatus("Booked");
		}
		car.setBookedCars(car.getBookedCars() + 1);
		cRepo.save(car);
	}

	public List<Car> searchCars(LocalDate pickupDate) {
		return cRepo.findByPickupDateAndStatus(pickupDate, "Not_Booked");
	}
}
