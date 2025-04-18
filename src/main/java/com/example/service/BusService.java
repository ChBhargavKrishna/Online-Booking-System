package com.example.service;

import java.time.LocalDate;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dao.*;
import com.example.entity.*;

@Service
public class BusService {
	@Autowired
	private IBusDao bRepo;

	// -----Admin Methods-----
	public Bus saveBus(Bus bus) {
		Bus b = bRepo.save(bus);
		System.out.println(b);
		return b;
	}

	public List<Bus> getAllBuses() {
		return bRepo.findAll();
	}

	public Optional<Bus> getBusById(Long bus_id) {
		return bRepo.findById(bus_id);
	}

	public Bus getBusId(Long bus_id) {
		return bRepo.findById(bus_id).orElse(null);
	}

	public Bus updateBus(Bus b) {
		Optional<Bus> exBus = bRepo.findById(b.getBus_id());
		if (exBus.isPresent()) {
			Bus updatedBus = exBus.get();
			updatedBus.setBusName(b.getBusName());
			updatedBus.setCategory(b.getCategory());
			updatedBus.setTravelDate(b.getTravelDate());
			updatedBus.setTravelTime(b.getTravelTime());
			updatedBus.setDeparturePlace(b.getDeparturePlace());
			updatedBus.setArrivalPlace(b.getArrivalPlace());
			updatedBus.setPrice(b.getPrice());

			return bRepo.save(updatedBus);
		}
		return null;
	}

	public void deleteBus(Long bus_id) {
		bRepo.deleteById(bus_id);
	}

	public boolean busExists(Long bus_id) {
		return bRepo.existsById(bus_id);
	}

	public long getBusCount() {
		return bRepo.count();
	}

	public int getBusAvailableSeats() {
		return bRepo.findAll().stream().mapToInt(Bus::getAvailableSeatsCount).sum();
	}

	public int getBusBookedSeats() {
		return bRepo.findAll().stream().mapToInt(Bus::getBookSeatCount).sum();
	}

	// -----User Methods-----
	public List<Bus> searchBuses(String departurePlace, String arrivalPlace, LocalDate travelDate) {
		if (travelDate.isBefore(LocalDate.now())) {
			return Collections.emptyList(); 
		}

		return bRepo.findByDeparturePlaceAndArrivalPlaceAndTravelDateIgnoreCase(departurePlace, arrivalPlace,
				travelDate);
	}

	public double getBusPrice(Long busId) {
		Bus bus = bRepo.findById(busId).orElse(null);
		return (bus != null) ? bus.getPrice() : 0.0; // Returns seat price or 0 if bus not found
	}

	public boolean bookSeats(Long busId, List<String> seats) {
		Bus bus = bRepo.findById(busId).orElse(null);
		if (bus != null) {
			Set<String> bookedSeats = bus.getBooked_Seats();
			bookedSeats.addAll(seats);
			bus.setBooked_Seats(bookedSeats);
			bRepo.save(bus);
			return true;
		}
		return false;
	}
	
	//---Cancel Seats & Update Payment----
	@Autowired
	private IPaymentDao payRepo;
	
	public boolean cancelBus(Long bus_id, String seat, Long paymentId) {
	    Bus bus = getBusId(bus_id);
	    Payment payment = payRepo.findById(paymentId).orElse(null);
	    
	    if (bus != null && payment != null && bus.getBooked_Seats().contains(seat)) {
	    	LocalDate travelDate = bus.getTravelDate();
	        LocalDate currentDate = LocalDate.now();

	        if (currentDate.isAfter(travelDate)) {
	            return false; 
	        }

	        if (!currentDate.isBefore(travelDate.minusDays(1))) {
	            return false; 
	        }
	    	
	    	// Remove seat from bus
	        bus.getBooked_Seats().remove(seat);
	        bRepo.save(bus);
	        
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
