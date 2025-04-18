package com.example.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.time.*;
import java.time.format.DateTimeParseException;
import java.util.*;
import com.example.entity.*;
import com.example.service.*;
import jakarta.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

	// ---Bus User methods----
	@Autowired
	private BusService bServ;

	@Autowired
	private CardService cardServ;

	@GetMapping("/book/{bus_id}")
	public String busBookForm(@PathVariable Long bus_id, HttpSession session, Model model) {
		Bus bus = bServ.getBusId(bus_id);
		if (bus != null) {
			session.setAttribute("selectedBus", bus);
			model.addAttribute("bus", bus);
			return "userPages/bookBus";
		} else {
			model.addAttribute("error", "Bus not found!");
			return "userPages/searchBus";
		}
	}

	@PostMapping("/book/{bus_id}")
	public String busBook(@PathVariable Long bus_id, @RequestParam("seats") List<String> seats, HttpSession session) {
		String fullName = (String) session.getAttribute("fullName");
		Register user = (Register) session.getAttribute("loggedInUser");
		if (user == null) {
			user = lgServ.getRegisterByFullName(fullName);
			session.setAttribute("loggedInUser", user);
		}

		Bus bookedBus = bServ.getBusId(bus_id);
		if (bookedBus == null || !bServ.bookSeats(bus_id, seats)) {
			return "redirect:/error?msg=Seats%20unavailable";
		}

		double totalAmount = bookedBus.getPrice() * seats.size();

		Payment payment = new Payment();
		payment.setPaymentId(UUID.randomUUID().toString());
		payment.setUser(user);
		payment.setReferenceId(bus_id);
		payment.setTransportType(Payment.TransportType.BUS);
		payment.setBus(bookedBus);
		payment.setAmount(totalAmount);
		payment.setPaymentSeats(seats);

		cardServ.save(payment);

		return "redirect:/userDashboard";
	}

	@PostMapping("/cancelBus/{bus_id}")
	public String busCancel(@PathVariable Long bus_id, @RequestParam String seat, @RequestParam Long paymentId,
			RedirectAttributes rdAttr) {
		if (bServ.cancelBus(bus_id, seat, paymentId)) {
			rdAttr.addFlashAttribute("message", "Cancelled Successfully of Bus Seat is " + seat);
			return "redirect:/booking/history";
		} else {
			rdAttr.addFlashAttribute("message", "Cancellation not allowed: Time has expired.");
			return "redirect:/booking/history";
		}
	}

	@PostMapping("/searchBuses")
	public String searchBuses(@RequestParam String departurePlace, @RequestParam String arrivalPlace,
			@RequestParam String travelDate, Model model) {
		try {
			LocalDate date = LocalDate.parse(travelDate); // Parse travelDate
			List<Bus> buses = bServ.searchBuses(departurePlace, arrivalPlace, date);

			if (buses.isEmpty()) {
				model.addAttribute("message", "No Buses Present on this Date");
			} else {
				for (Bus bus : buses) {
					model.addAttribute("availableSeatsCount", bus.getAvailableSeatsCount());
				}
				model.addAttribute("buses", buses);
			}
		} catch (DateTimeParseException ex) {
			model.addAttribute("message", "Invalid date format. Please use YYYY-MM-DD.");
		}

		return "userPages/searchBus";
	}

	// ---Bus Payments---
	@GetMapping("/bus/payment")
	public String busCard(@RequestParam("seats") String seats, Model model, HttpSession session) {
		Register loggedInUser = lgServ.getRegisterByFullName((String) session.getAttribute("fullName"));
		model.addAttribute("register", loggedInUser);
		model.addAttribute("card", new Card());
		model.addAttribute("bus", session.getAttribute("selectedBus"));
		model.addAttribute("existingCard", cardServ.findCardByRegister(loggedInUser));
		session.setAttribute("selectedSeats", seats);
		return "userPages/busCard";
	}

	@PostMapping("/bus/payments")
	public String carddetails(@ModelAttribute Card r, @RequestParam("seats") String seats, Model model,
			HttpSession session) {
		cardServ.saveCard(r);
		return busCard(seats, model, session);
	}

	@GetMapping("/confirmBus")
	public String confirmBus(Model model, HttpSession session) {
		Bus selectedBus = (Bus) session.getAttribute("selectedBus");
		String selectedSeats = (String) session.getAttribute("selectedSeats");
		int seatCount = selectedSeats.split(",").length;
		Double totalCost = selectedBus.getPrice() * seatCount;

		model.addAttribute("selectedSeats", selectedSeats);
		model.addAttribute("bus", selectedBus);
		model.addAttribute("seatCount", seatCount);
		model.addAttribute("totalCost", totalCost);
		model.addAttribute("category", selectedBus.getCategory());
		model.addAttribute("price", selectedBus.getPrice());
		model.addAttribute("travelDate", selectedBus.getTravelDate());
		model.addAttribute("busName", selectedBus.getBusName());
		model.addAttribute("bus_id", selectedBus.getBus_id());
		return "userPages/confirmBusPayment";
	}

	// ----Flight User methods----
	@Autowired
	private FlightService fServ;

	@GetMapping("/flight/book/{id}")
	public String flightBookForm(@PathVariable Long id, HttpSession session, Model model) {
		Flight flight = fServ.getFlightId(id);
		if (flight != null) {
			session.setAttribute("selectedFlight", flight);
			model.addAttribute("flight", flight);
			return "userPages/bookFlight";
		} else {
			model.addAttribute("error", "Flight not found!");
			return "userPages/searchFlight";
		}
	}

	@PostMapping("/flight/book/{id}")
	public String flightBook(@PathVariable Long id, @RequestParam("seats") List<String> seats, HttpSession session) {
		String fullName = (String) session.getAttribute("fullName");
		Register user = (Register) session.getAttribute("loggedInUser");
		if (user == null) {
			user = lgServ.getRegisterByFullName(fullName);
			session.setAttribute("loggedInUser", user);
		}

		Flight bookedFlight = fServ.getFlightId(id);
		if (bookedFlight == null || !fServ.bookFlightSeats(id, seats)) {
			return "redirect:/error?msg=Seats%20unavailable";
		}

		double totalAmount = bookedFlight.getPrice() * seats.size();

		Payment payment = new Payment();
		payment.setPaymentId(UUID.randomUUID().toString());
		payment.setUser(user);
		payment.setReferenceId(id);
		payment.setTransportType(Payment.TransportType.FLIGHT);
		payment.setFlight(bookedFlight);
		payment.setAmount(totalAmount);
		payment.setPaymentSeats(seats);

		cardServ.save(payment);

		return "redirect:/userDashboard";
	}

	@PostMapping("/cancelFlight/{id}")
	public String flightCancel(@PathVariable Long id, @RequestParam String seat, @RequestParam Long paymentId,
			RedirectAttributes rdAttr) {
		if (fServ.cancelFlight(id, seat, paymentId)) {
			rdAttr.addFlashAttribute("message", "Cancelled Successfully of Flight Seat is " + seat);
			return "redirect:/booking/history";
		} else {
			rdAttr.addFlashAttribute("message", "Cancellation not allowed: Time has expired.");
			return "redirect:/booking/history";
		}
	}

	@PostMapping("/searchFlights")
	public String searchFlights(@RequestParam String startLocation, @RequestParam String destination,
			@RequestParam String departDate, Model model) {
		try {
			LocalDate date = LocalDate.parse(departDate); // Parse travelDate
			List<Flight> flights = fServ.searchFlights(startLocation, destination, date);

			if (flights.isEmpty()) {
				model.addAttribute("message", "No Flights Present on this Date");
			} else {
				model.addAttribute("flights", flights);
			}
		} catch (DateTimeParseException ex) {
			model.addAttribute("message", "Invalid date format. Please use YYYY-MM-DD.");
		}

		return "userPages/searchFlight";
	}

	// ---Flight payments----
	@GetMapping("/flight/payment")
	public String flgCard(@RequestParam("seats") String seats, Model model, HttpSession session) {
		Register loggedInUser = lgServ.getRegisterByFullName((String) session.getAttribute("fullName"));
		model.addAttribute("register", loggedInUser);
		model.addAttribute("card", new Card());
		model.addAttribute("flg", session.getAttribute("selectedFlight"));
		model.addAttribute("existingCard", cardServ.findCardByRegister(loggedInUser));
		session.setAttribute("selectedSeats", seats);
		return "userPages/flightCard";
	}

	@PostMapping("/flight/payments")
	public String saveCard(@ModelAttribute Card r, @RequestParam("seats") String seats, Model model,
			HttpSession session) {
		cardServ.saveCard(r);
		return flgCard(seats, model, session);
	}

	@GetMapping("/confirmFlight")
	public String confirmFlight(Model model, HttpSession session) {
		Flight selectedFlight = (Flight) session.getAttribute("selectedFlight");
		String selectedSeats = (String) session.getAttribute("selectedSeats");
		int seatCount = selectedSeats.split(",").length;
		Double totalCost = selectedFlight.getPrice() * seatCount;

		model.addAttribute("selectedSeats", selectedSeats);
		model.addAttribute("flg", selectedFlight);
		model.addAttribute("category", selectedFlight.getCategory());
		model.addAttribute("seatCount", seatCount);
		model.addAttribute("totalCost", totalCost);
		model.addAttribute("price", selectedFlight.getPrice());
		model.addAttribute("departDate", selectedFlight.getDepartDate());
		model.addAttribute("flightName", selectedFlight.getFlightName());
		model.addAttribute("id", selectedFlight.getId());
		return "userPages/confirmFlgPayment";
	}

	// ----Car User Methods----
	@Autowired
	private CarService cServ;

	// Book a Car
	@PostMapping("/carBook/{carId}")
	public String bookCar(@PathVariable Long carId, @RequestParam int rentalDays, @RequestParam double totalAmount,
			HttpSession session) {

		String fullName = (String) session.getAttribute("fullName");
		Register user = (Register) session.getAttribute("loggedInUser");

		if (user == null) {
			user = lgServ.getRegisterByFullName(fullName);
			session.setAttribute("loggedInUser", user);
		}

		Car bookedCar = cServ.getCarId(carId);
		String pickupLocation = (String) session.getAttribute("pickupLocation");
		LocalDate pickupDate = (LocalDate) session.getAttribute("pickupDate");
		String pickupTime = (String) session.getAttribute("pickupTime");
		LocalDate dropoffDate = (LocalDate) session.getAttribute("dropoffDate");
		String dropoffTime = (String) session.getAttribute("dropoffTime");

		// Save rental days in Car entity
		bookedCar.setRentalDays(rentalDays);
		bookedCar.setPickupLocation(pickupLocation);
		bookedCar.setPickupDate(pickupDate);
		bookedCar.setPickupTime(pickupTime);
		bookedCar.setDropoffDate(dropoffDate);
		bookedCar.setDropoffTime(dropoffTime);
		cServ.bookCar(carId);

		// Save payment details
		Payment payment = new Payment();
		payment.setPaymentId(UUID.randomUUID().toString());
		payment.setUser(user);
		payment.setReferenceId(carId);
		payment.setTransportType(Payment.TransportType.CAR);
		payment.setCar(bookedCar);
		payment.setAmount(totalAmount);
		cardServ.save(payment);

		return "redirect:/userDashboard";
	}

	@PostMapping("/cancelCar/{carId}")
	public String cancelCarBooking(@PathVariable Long carId, @RequestParam Long paymentId, @RequestParam int cancelDays,
			Model model, HttpServletRequest request, RedirectAttributes rdAttr) {
		if (cardServ.cancelCar(carId, paymentId, cancelDays)) {
			rdAttr.addFlashAttribute("message", "Partial Cancellation successful. Drop-off date updated.");
		} else {
			rdAttr.addFlashAttribute("message", "Cancellation failed. Please try again.");
		}
		return "redirect:/booking/history";
	}

	@PostMapping("/cancelCarFull/{carId}")
	public String cancelFullCar(@PathVariable Long carId, @RequestParam Long paymentId,
			RedirectAttributes redirectAttributes) {
		if (cardServ.cancelFullCar(carId, paymentId)) {
			redirectAttributes.addFlashAttribute("message", "Car booking fully canceled.");
			return "redirect:/booking/history";
		} else {
			redirectAttributes.addFlashAttribute("message", "Cancellation Not Allowed: Time Has Expired.");
			return "redirect:/booking/history";
		}
	}

	@PostMapping("/searchCars")
	public String searchCar(@RequestParam("pickupLocation") String pickupLocation,
			@RequestParam("pickupDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate pickupDate,
			@RequestParam("pickupTime") String pickupTime,
			@RequestParam("dropoffDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dropoffDate,
			@RequestParam("dropoffTime") String dropoffTime, Model model, HttpSession session) {

		if (pickupDate.isBefore(LocalDate.now())) {
			model.addAttribute("message", "Pickup date must be today or a future date.");
			return "userPages/searchCar";
		}

		LocalDateTime pickupDateTime = LocalDateTime.of(pickupDate, LocalTime.parse(pickupTime));
		LocalDateTime dropoffDateTime = LocalDateTime.of(dropoffDate, LocalTime.parse(dropoffTime));

		if (!dropoffDateTime.isAfter(pickupDateTime)) {
			model.addAttribute("message", "Dropoff time must be after the pickup time.");
			return "userPages/searchCar";
		}

		Duration rentalDuration = Duration.between(pickupDateTime, dropoffDateTime);
		String rentalTime = (rentalDuration.toDays() > 0 ? rentalDuration.toDays() + " days " : "")
				+ rentalDuration.toHoursPart() + " hours " + rentalDuration.toMinutesPart() + " minutes";

		session.setAttribute("pickupLocation", pickupLocation);
		session.setAttribute("pickupDate", pickupDate);
		session.setAttribute("pickupTime", pickupTime);
		session.setAttribute("dropoffDate", dropoffDate);
		session.setAttribute("dropoffTime", dropoffTime);
		session.setAttribute("rentalTime", rentalTime);

		List<Car> cars = cServ.searchCars(pickupDate);
		model.addAttribute("message", cars.isEmpty() ? "No Cars Present on this Date" : null);
		model.addAttribute("cars", cars);

		return "userPages/searchCar";
	}

	// ---Car Payments----
	@GetMapping("/carPayment/{carId}")
	public String carPayment(@PathVariable Long carId, Model model, HttpSession session) {
		Car car = cServ.getCarId(carId);
		if (car != null) {
			session.setAttribute("selectedCar", car);
			model.addAttribute("car", car);
			Register loggedInUser = lgServ.getRegisterByFullName((String) session.getAttribute("fullName"));
			model.addAttribute("register", loggedInUser);
			model.addAttribute("card", new Card());
			model.addAttribute("car", session.getAttribute("selectedCar"));
			model.addAttribute("existingCard", cardServ.findCardByRegister(loggedInUser));
			return "userPages/carCard";
		} else {
			model.addAttribute("error", "Car not found!");
			return "userPages/searchCar";
		}
	}

	@PostMapping("/car/payments")
	public String carCard(@ModelAttribute Card r, @RequestParam("carId") Long id, Model model, HttpSession session) {
		cardServ.saveCard(r);
		return carPayment(id, model, session);
	}

	@GetMapping("/confirmCar/{carId}")
	public String confirmCar(Model model, HttpSession session) {
		Car car = (Car) session.getAttribute("selectedCar");
		LocalDate pickupDate = (LocalDate) session.getAttribute("pickupDate");
		LocalDate dropoffDate = (LocalDate) session.getAttribute("dropoffDate");
		long rentalDays = (int) ChronoUnit.DAYS.between(pickupDate, dropoffDate);
		double totalCost;
		if (rentalDays >= 1) {
			totalCost = car.getFullDayPrice() * rentalDays;
		} else {
			totalCost = car.getHalfDayPrice();
		}

		model.addAllAttributes(Map.of("car", car, "carId", car.getCarId(), "carName", car.getCarName(), "carModel",
				car.getCarModel(), "rentalTime", session.getAttribute("rentalTime"), "fullPrice", car.getFullDayPrice(),
				"pickupDate", pickupDate, "dropoffDate", dropoffDate, "rentalDays", rentalDays, "totalCost",
				totalCost));
		model.addAttribute("halfPrice", car.getHalfDayPrice());

		return "userPages/confirmCarPayment";
	}

	// ---Login & User Methods-----
	@Autowired
	private LoginService lgServ;

	@GetMapping("/userDashboard")
	public String booking(Model model, HttpServletRequest request, HttpSession session) {
		String fullName = (String) request.getSession().getAttribute("fullName");
		String gender = (String) request.getSession().getAttribute("gender");
		model.addAttribute("fullName", fullName);
		model.addAttribute("gender", gender);
		model.addAttribute("message", "Login Successfully as " + fullName);
		return "userPages/userDashboard";
	}

	@GetMapping("/user/profile")
	public String profile(Model model, Principal p, HttpSession session) {
		String fullName = (String) session.getAttribute("fullName");
		Register loggedInUser = lgServ.getRegisterByFullName(fullName);
		model.addAttribute("register", loggedInUser);
		return "userPages/userProfile";
	}

	@PostMapping("/edit/profile")
	public String updateProfile(Register r, RedirectAttributes rdAttr) {
		lgServ.updateProfile(r);
		rdAttr.addFlashAttribute("message", "Profile Of " + r.getFullName() + " Updated Successfully");
		return "redirect:/user/profile";
	}

	@GetMapping("/booking/history")
	public String bookingHistory(HttpSession session, Model model) {
		String fullName = (String) session.getAttribute("fullName");
		Register user = (Register) session.getAttribute("loggedInUser");
		if (user == null) {
			user = lgServ.getRegisterByFullName(fullName);
			session.setAttribute("loggedInUser", user);
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("currentDate", sdf.format(new Date()));

		List<Payment> userPayments = cardServ.getPaymentsByUser(user);
		for (Payment payment : userPayments) {
			Car car = payment.getCar();
			if (car != null && car.getStatus().equals("Booked")) {
				if (car.getDropoffDate().isBefore(LocalDate.now())) {
					car.setStatus("Not_Booked");
					cServ.addCar(car);
				}
			}
		}
		model.addAttribute("userPayments", userPayments);

		return "userPages/bookingHistory";
	}

	@GetMapping("/change/password/form")
	public String changePasswordForm(Model model, HttpSession session) {
		String fullName = (String) session.getAttribute("fullName");
		Register loggedInUser = lgServ.getRegisterByFullName(fullName);
		model.addAttribute("register", loggedInUser);
		return "userPages/changePassword";
	}

	@PostMapping("/change/password")
	public String changePassword(@RequestParam String newPassword, @RequestParam String confirmPassword,
			@RequestParam String currentPassword, @RequestParam String userName, HttpSession session,
			RedirectAttributes rdAttr) {
		String fullName = (String) session.getAttribute("fullName");
		if (!newPassword.equals(confirmPassword)) {
			rdAttr.addFlashAttribute("error", "New password and confirm password do not match");
			return "redirect:/change/password/form";
		}
		boolean isChanged = lgServ.changePassword(userName, currentPassword, newPassword);
		if (!isChanged) {
			rdAttr.addFlashAttribute("error", "Current password is incorrect");
			return "redirect:/change/password/form";
		}
		rdAttr.addFlashAttribute("message", "Password Changed Successfully Of " + fullName);
		return "redirect:/user/profile";
	}

	@GetMapping("/help")
	public String help() {
		return "userPages/helpPage";
	}

}
