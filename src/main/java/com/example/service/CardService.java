package com.example.service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.*;
import com.example.entity.*;

@Service
public class CardService {

	@Autowired
	private ICardDao cardRepo;

	public Card findCardByRegister(Register reg) {
		return cardRepo.findByRegister(reg);
	}

	public void saveCard(Card card) {
		cardRepo.save(card);
	}

	// ---Payment-----
	@Autowired
	private IPaymentDao payRepo;

	public void save(Payment payment) {
		payRepo.save(payment);
	}

	public List<Payment> getAllPayments() {
		return payRepo.findAll();
	}

	public List<Payment> getLatestPayments() {
		return payRepo.findLatestPayments();
	}
	
	public List<Payment> getPaymentsByUser(Register user) {
		return payRepo.findByUser(user);
	}

	public Payment getPaymentId(Long id) {
		return payRepo.findById(id).orElse(null);
	}

	//Payment History----
	public List<Map<String, Object>> getPaymentHistory() {
		List<Payment> allPayments = getAllPayments();

		return allPayments.stream().collect(Collectors.groupingBy(Payment::getUser)).entrySet().stream()
				.map(entry -> createPaymentSummary(entry.getKey(), entry.getValue())).collect(Collectors.toList());
	}

	private Map<String, Object> createPaymentSummary(Register user, List<Payment> userPayments) {
		Set<String> uniqueBuses = new HashSet<>();
		Set<String> uniqueFlights = new HashSet<>();
		int busSeats = 0, flightSeats = 0, carCount = 0;

		for (Payment p : userPayments) {
			switch (p.getTransportType()) {
			case BUS:
				if (p.getBus() != null) {
					uniqueBuses.add(
							p.getBus().getBus_id() + "-" + p.getBus().getBusName() + "-" + p.getBus().getTravelDate());
					busSeats += p.getPaymentSeats() != null ? p.getPaymentSeats().size() : 0;
				}
				break;
			case FLIGHT:
				if (p.getFlight() != null) {
					uniqueFlights.add(p.getFlight().getId() + "-" + p.getFlight().getFlightName() + "-"
							+ p.getFlight().getDepartDate());
					flightSeats += p.getPaymentSeats() != null ? p.getPaymentSeats().size() : 0;
				}
				break;
			case CAR:
				if (p.getCar() != null) {
					carCount++;
				}
				break;
			}
		}

		Map<String, Object> summary = new HashMap<>();
		summary.put("user", user);
		summary.put("busCount", uniqueBuses.size());
		summary.put("busSeats", busSeats);
		summary.put("flightCount", uniqueFlights.size());
		summary.put("flightSeats", flightSeats);
		summary.put("carCount", carCount);
		summary.put("totalCount", uniqueBuses.size() + uniqueFlights.size() + carCount);

		return summary;
	}

	// ---Cancel Car & Update Payment----
	@Autowired
	private ICarDao cRepo;

	public boolean cancelCar(Long carId, Long paymentId, int cancelDays) {
		Payment paymentOpt = getPaymentId(paymentId);
		Car car = cRepo.findById(carId).orElse(null);

		if (car != null && paymentOpt != null) {
			LocalDate pickupDate = car.getPickupDate();
			LocalDate currentDate = LocalDate.now();

			if (!currentDate.isBefore(pickupDate)) {
				return false;
			}

			int remainingDays = (int) (car.getRentalDays() - cancelDays);
			if (remainingDays > 0) {
				car.setRentalDays(remainingDays);
				LocalDate updatedDropoffDate = car.getDropoffDate().minusDays(cancelDays);
				car.setDropoffDate(updatedDropoffDate);
				double perDayCost = paymentOpt.getAmount() / (car.getRentalDays() + cancelDays);
				paymentOpt.setAmount(perDayCost * remainingDays);
				cRepo.save(car);
				payRepo.save(paymentOpt);
				return true;
			}
		}
		return false;
	}

	public boolean cancelFullCar(Long carId, Long paymentId) {
		Payment payment = getPaymentId(paymentId);
		Car car = cRepo.findById(carId).orElse(null);
		if (car != null && payment != null) {
			LocalDate pickupDate = car.getPickupDate();
			LocalDate currentDate = LocalDate.now();

			if (!currentDate.isBefore(pickupDate.minusDays(1))) {
				return false;
			}

			payRepo.delete(payment);
			if (car.getBookedCars() > 0) {
				car.setBookedCars(car.getBookedCars() - 1);
			}
			car.setStatus("Not_Booked");
			cRepo.save(car);
			return true;
		}
		return false;
	}
}
