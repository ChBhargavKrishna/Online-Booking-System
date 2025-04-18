package com.example.controller;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.entity.*;
import com.example.service.*;

@Controller
public class AdminController {

	// -----Bus Details & Crud Operations---------
	@Autowired
	private BusService bServ;

	@GetMapping("/add/bus/form")
	public String busAddForm(Model model) {
		model.addAttribute("bus", new Bus());
		return "adminPages/addBus";
	}

	@PostMapping("/add/bus")
	public String addBus(Bus b, RedirectAttributes rdAttr) {
		Bus b1 = bServ.saveBus(b);
		System.out.println(b1);
		rdAttr.addFlashAttribute("message", "Bus with " + b.getBus_id() + " Id Added Successfully");
		return "redirect:/view/buses";
	}

	@GetMapping("/view/buses")
	public String listBuses(Bus b, Model model) {
		List<Bus> buses = bServ.getAllBuses();
		model.addAttribute("buses", buses);
		return "adminPages/viewBus";
	}

	@GetMapping("/bus/delete/{bus_id}")
	public String deleteBus(@PathVariable Long bus_id, RedirectAttributes rdAttr) {
		if (bServ.busExists(bus_id)) {
			bServ.deleteBus(bus_id);
			rdAttr.addFlashAttribute("message", "Bus with " + bus_id + " Id Deleted Successfully");
		}
		return "redirect:/view/buses";
	}

	@RequestMapping("/bus/update/{bus_id}")
	public String busEditForm(@PathVariable Long bus_id, Model model) {
		Optional<Bus> bus = bServ.getBusById(bus_id);
		if (bus.isPresent()) {
			model.addAttribute("bus", bus.get());
			return "adminPages/updateBus";
		}
		return "redirect:/view/buses";
	}

	@PostMapping("/bus/update")
	public String updateBus(Bus b, RedirectAttributes rdAttr) {
		if (b.getBus_id() == null) {
			return "adminPages/updateBus";
		}
		Bus b1 = bServ.updateBus(b);
		System.out.println(b1);
		rdAttr.addFlashAttribute("message", "Bus with " + b.getBus_id() + " Id Updated Successfully");
		return "redirect:/view/buses";
	}

	// -----Flight Details & Crud Operations---------
	@Autowired
	private FlightService fServ;

	@GetMapping("/add/flight/form")
	public String flightAddForm(Model model) {
		model.addAttribute("flight", new Flight());
		return "adminPages/addFlight";
	}

	@PostMapping("/add/flight")
	public String addFlight(Flight f, RedirectAttributes re) {
		Flight f1 = fServ.saveFlight(f);
		System.out.println(f1);
		re.addFlashAttribute("message", "Flight with " + f1.getId() + " Id Added Successfully");
		return "redirect:/view/flights";
	}

	@GetMapping("/view/flights")
	public String listFlights(Flight f, Model model) {
		List<Flight> flights = fServ.getAllFlights();
		model.addAttribute("flights", flights);
		return "adminPages/viewFlight";
	}

	// Delete a flight
	@GetMapping("/flights/delete/{id}")
	public String deleteFlight(@PathVariable Long id, RedirectAttributes rdAttr) {
		if (fServ.flightExists(id)) {
			fServ.deleteFlight(id);
			rdAttr.addFlashAttribute("message", "Flight with " + id + " Id Deleted Successfully");
		}
		return "redirect:/view/flights";
	}

	@RequestMapping("/flights/edit/{id}")
	public String flightEditForm(@PathVariable Long id, Model model) {
		Optional<Flight> flight = fServ.getFlightById(id);
		if (flight.isPresent()) {
			model.addAttribute("flight", flight.get());
			return "adminPages/editFlight";
		}
		return "redirect:/view/flights";
	}

	@PostMapping("/flights/edit")
	public String updateFlight(Flight f, RedirectAttributes rdAttr) {
		if (f.getId() == null) {
			return "adminPages/editFlight";
		}
		Flight f1 = fServ.editFlight(f);
		System.out.println(f1);
		rdAttr.addFlashAttribute("message", "Flight with " + f.getId() + " Id Updated Successfully");
		return "redirect:/view/flights";
	}

	// ---Car Details & Crud Operations-----
	@Autowired
	private CarService cServ;

	@GetMapping("/add/car/form")
	public String carForm(Model model) {
		model.addAttribute("car", new Car());
		return "adminPages/addCar";
	}

	@PostMapping("/add/car")
	public String addCar(Car c, RedirectAttributes rdAttr) {
		Car c1 = cServ.addCar(c);
		System.out.println(c1);
		rdAttr.addFlashAttribute("message", "Car with " + c.getCarId() + " Id Added Successfully");
		return "redirect:/view/cars";
	}

	@GetMapping("/view/cars")
	public String listCars(Model model) {
		List<Car> cars = cServ.getAllCars();
		model.addAttribute("cars", cars);
		return "adminPages/viewCar";
	}

	@GetMapping("/car/delete/{carId}")
	public String deleteCar(@PathVariable Long carId, RedirectAttributes rdAttr) {
		if (cServ.carExists(carId)) {
			cServ.deleteCar(carId);
			rdAttr.addFlashAttribute("message", "Car with " + carId + " Id Deleted Successfully");
		}
		return "redirect:/view/cars";
	}

	@RequestMapping("/car/update/{carId}")
	public String carEditForm(@PathVariable Long carId, Model model) {
		Optional<Car> car = cServ.getCarById(carId);
		if (car.isPresent()) {
			model.addAttribute("car", car.get());
			return "adminPages/editCar";
		}
		return "redirect:/view/cars";
	}

	@PostMapping("/car/edit")
	public String editCar(Car c, RedirectAttributes rdAttr) {
		if (c.getCarId() == null) {
			return "adminPages/editCar";
		}
		Car c1 = cServ.updateCar(c);
		System.out.println(c1);
		rdAttr.addFlashAttribute("message", "Car with " + c.getCarId() + " Id Updated Successfully");
		return "redirect:/view/cars";
	}

	// ---Login & Admin Methods-----
	@Autowired
	private LoginService lgServ;

	@Autowired
	private CardService caServ;

	@GetMapping("/adminDashboard")
	public String dashboard(Model model) {
		model.addAttribute("message", "Login Successfully as Admin");
		// users List & count
		model.addAttribute("registers", lgServ.getLatestUsers());
		model.addAttribute("registerCount", lgServ.getRegisterCount());

		// Payments
		model.addAttribute("payments", caServ.getLatestPayments());

		// count of buses, Seats
		model.addAttribute("busCount", bServ.getBusCount());
		model.addAttribute("busAvailableSeats", bServ.getBusAvailableSeats());
		model.addAttribute("busBookedSeats", bServ.getBusBookedSeats());

		// Car count & booked Count
		model.addAttribute("carCount", cServ.getCarCount());
		model.addAttribute("bookedCars", cServ.getBookedCarsCount());
		model.addAttribute("availableCars", cServ.getAvailableCars());
		model.addAttribute("activeCars", cServ.getActiveCars());

		// seats count flight , Seats
		model.addAttribute("flightCount", fServ.getFlightCount());
		model.addAttribute("flightAvailableSeats", fServ.getFlightAvailableSeats());
		model.addAttribute("flightBookedSeats", fServ.getFlightBookedSeats());
		return "adminPages/adminDashboard";
	}

	@GetMapping("/registered/users")
	public String users(Model model) {
		model.addAttribute("users", lgServ.getAllRegisters());
		return "adminPages/usersList";
	}

	@GetMapping("/payment/history")
	public String getAllPaymentsSummary(Model model) {
		List<Map<String, Object>> paymentHistory = caServ.getPaymentHistory();
		model.addAttribute("userPayments", paymentHistory);
		return "adminPages/paymentHistory";
	}
}
