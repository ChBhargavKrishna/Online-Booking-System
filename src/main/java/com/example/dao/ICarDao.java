package com.example.dao;

import org.springframework.data.jpa.repository.*;
import java.time.LocalDate;
import java.util.*;
import org.springframework.stereotype.Repository;

import com.example.entity.*;

@Repository
public interface ICarDao extends JpaRepository<Car, Long> {

	@Query("SELECT c FROM Car c")
	List<Car> findByPickupDateAndStatus(LocalDate pickupDate, String string);

	@Query("SELECT COUNT(c) FROM Car c WHERE c.status = 'Not_Booked'")
	long countNotBookedCars();

}