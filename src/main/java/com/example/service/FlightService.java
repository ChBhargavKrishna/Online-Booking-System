package com.example.service;

import com.example.dao.*;

import com.example.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
public class FlightService {

	@Autowired
	private IFlightDao fRepo;

	// ----Admin Methods-----
	public Flight saveFlight(Flight flight) {
		if (flight.getDepartTime() != null) {
			flight.setArriveTime(flight.getDepartTime().plusHours(5));
		}
		Flight f = fRepo.save(flight);
		System.out.println(f);
		return f;
	}

	public List<Flight> getAllFlights() {
		return fRepo.findAll();
	}

	public Optional<Flight> getFlightById(Long id) {
		return fRepo.findById(id);
	}

	public Flight getFlightId(Long id) {
		return fRepo.findById(id).orElse(null);
	}

	public Flight editFlight(Flight f) {
		Optional<Flight> existingFlight = fRepo.findById(f.getId());
		if (existingFlight.isPresent()) {
			Flight updatedFlight = existingFlight.get();
			updatedFlight.setFlightName(f.getFlightName());
			updatedFlight.setCategory(f.getCategory());
			updatedFlight.setDepartDate(f.getDepartDate());
			updatedFlight.setDepartTime(f.getDepartTime());
			updatedFlight.setStartLocation(f.getStartLocation());
			updatedFlight.setDestination(f.getDestination());
			updatedFlight.setPrice(f.getPrice());
			updatedFlight.setArriveTime(f.getDepartTime().plusHours(7));

			return fRepo.save(updatedFlight);
		}
		return null;
	}

	public void deleteFlight(Long id) {
		fRepo.deleteById(id);
	}

	public boolean flightExists(Long id) {
		return fRepo.existsById(id);
	}

	public long getFlightCount() {
		return fRepo.count();
	}

	public int getFlightAvailableSeats() {
		return fRepo.findAll().stream().mapToInt(Flight::getFlightSeatsCount).sum();
	}

	public int getFlightBookedSeats() {
		return fRepo.findAll().stream().mapToInt(Flight::getFlightBookCount).sum();
	}

	// -----User Methods-----
	public List<Flight> searchFlights(String startLocation, String destination, LocalDate departDate) {
		if (departDate.isBefore(LocalDate.now())) {
			return Collections.emptyList(); // Return empty list if date is in the past
		}

		return fRepo.findByStartLocationAndDestinationAndDepartDateIgnoreCase(startLocation, destination, departDate);
	}

	public boolean bookFlightSeats(Long id, List<String> seats) {
		Flight flight = fRepo.findById(id).orElse(null);
		if (flight != null) {
			Set<String> bookedSeats = flight.getBookedSeats();
			bookedSeats.addAll(seats);
			flight.setBookedSeats(bookedSeats);
			fRepo.save(flight);
			return true;
		}
		return false;
	}

	// ---Cancel Seats & Update Payment----
	@Autowired
	private IPaymentDao payRepo;

	public boolean cancelFlight(Long id, String seat, Long paymentId) {
		Flight flight = getFlightId(id);
		Payment payment = payRepo.findById(paymentId).orElse(null);

		if (flight != null && payment != null && flight.getBookedSeats().contains(seat)) {
			LocalDate travelDate = flight.getDepartDate();
			LocalDate currentDate = LocalDate.now();

			if (currentDate.isAfter(travelDate)) {
				return false;
			}

			if (!currentDate.isBefore(travelDate.minusDays(1))) {
				return false;
			}

			flight.getBookedSeats().remove(seat);
			fRepo.save(flight);

			// Update payment details
			List<String> updatedSeats = payment.getPaymentSeats();
			updatedSeats.remove(seat);

			if (updatedSeats.isEmpty()) {
				payRepo.delete(payment);
			} else {
				payment.setPaymentSeats(updatedSeats);
				double seatPrice = payment.getAmount() / (updatedSeats.size() + 1);
				payment.setAmount(seatPrice * updatedSeats.size());
				payRepo.save(payment);
			}
			return true;
		}
		return false;
	}
}
