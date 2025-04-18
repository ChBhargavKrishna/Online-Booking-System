package com.example.adminAccess;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private AdminInterceptor adminInterceptor;

	@Autowired
	private UserInterceptor userInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/adminDashboard", "/add/car/form", "/view/cars", "/car/delete/{carId}",
						"/car/update/{carId}", "/add/bus/form", "/view/buses", "/bus/delete/{bus_id}",
						"/bus/update/{bus_id}", "/add/flight/form", "/view/flights", "/flight/delete/{id}",
						"/flights/edit/{id}", "/payment/history", "/registered/users")
				.excludePathPatterns("/login/form", "/register/form", "/check/username");
		registry.addInterceptor(userInterceptor).addPathPatterns("/userDashboard", "/user/profile", "/booking/history",
				"/change/password/form", "/help", "/book/{bus_id}", "/bus/payment", "/confirmBus", "/flight/book/{id}",
				"/flight/payment", "/confirmFlight", "/carPayment/{carId}", "/confirmCar/{carId}")
				.excludePathPatterns("/login/form", "/register/form", "/check/username");
	}
}
