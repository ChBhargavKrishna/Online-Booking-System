package com.example.dao;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.*;
import org.springframework.stereotype.Repository;

import com.example.entity.*;

@Repository
public interface IBusDao extends JpaRepository<Bus, Long> {
	@Query("SELECT b FROM Bus b WHERE LOWER(b.departurePlace) = LOWER(:departurePlace)"
			+ "AND LOWER(b.arrivalPlace) = LOWER(:arrivalPlace)" + "AND b.travelDate = :travelDate")
	List<Bus> findByDeparturePlaceAndArrivalPlaceAndTravelDateIgnoreCase(@Param("departurePlace") String departurePlace,
			@Param("arrivalPlace") String arrivalPlace, @Param("travelDate") LocalDate travelDate);
}
