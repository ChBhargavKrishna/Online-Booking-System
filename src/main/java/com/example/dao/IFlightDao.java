package com.example.dao;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.*;
import com.example.entity.*;

@Repository
public interface IFlightDao extends JpaRepository<Flight, Long> {
	@Query("SELECT f FROM Flight f WHERE LOWER(f.startLocation) = LOWER(:startLocation)"
			+ "AND LOWER(f.destination) = LOWER(:destination)" + "AND f.departDate = :departDate")
	List<Flight> findByStartLocationAndDestinationAndDepartDateIgnoreCase(@Param("startLocation") String startLocation,
			@Param("destination") String destination, @Param("departDate") LocalDate departDate);
}
