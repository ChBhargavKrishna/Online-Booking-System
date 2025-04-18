package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.service.*;

import jakarta.servlet.http.HttpServletRequest;

import com.example.entity.*;

@Controller
public class LoginController {

	@Autowired
	LoginService lgServ;

	@GetMapping("/")
	public String display() {
		return "adminPages/home";
	}

	//login form
	@GetMapping("/login/form")
	public String display(Model model) {
		model.addAttribute("reg", new Login());
		return "adminPages/login";
	}

	//register form
	@GetMapping("/register/form")
	public String get(Model model) {
		model.addAttribute("reg", new Register());
		return "adminPages/register";
	}

	//username check
	@GetMapping("/check/username")
	public String check(Model model) {
		return "adminPages/checkUsername";
	}
	
	//save register
	@PostMapping("/register")
	public String Registerdetails(@ModelAttribute Register r, RedirectAttributes rdAttr) {
		lgServ.saveRegister(r);
		System.out.println(r);
		rdAttr.addFlashAttribute("message",r.getFullName()+ " Registered Successfully");
		return "redirect:/login/form";
	}

	//save login
	@PostMapping("/login")
	public String authenticate(@RequestParam("userName") String email, @RequestParam("passCode") String password,
			Model model, HttpServletRequest request) {
		Login user = lgServ.authenticate(email, password);
		Register register = lgServ.getRegisterByLogin(user);
		if (email.equals("admin12@login.com") && password.equals(user.getPassCode())) {
			request.getSession().setAttribute("userName", email);
			return "redirect:/adminDashboard";
		}
		
		if (user != null) {
			if (register != null) {
				request.getSession().setAttribute("userName", email);
				request.getSession().setAttribute("fullName", register.getFullName());
				request.getSession().setAttribute("gender", register.getGender());
				return "redirect:/userDashboard";
			}
		} else {
			model.addAttribute("Error", "Invalid Username & Password");
		}
		return "error";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, RedirectAttributes rdAttr) {
		request.getSession().invalidate();
		rdAttr.addFlashAttribute("message","Logout Successfully");
		return "redirect:/login/form";
	}

	@PostMapping("/forgot/password/form")
	public String checkUsername(@RequestParam String userName, Model model) {
		if ("admin12@login.com".equals(userName)) {
			model.addAttribute("error", "Password reset is not allowed for this username");
			return "redirect:/check/username";
		}

		if (lgServ.usernameExists(userName)) {
			model.addAttribute("userName", userName);
			model.addAttribute("message", "Username found");
			return "adminPages/forgotPassword";
		} else {
			model.addAttribute("error", "Username not found");
			return "redirect:/check/username";
		}
	}

	@PostMapping("/forgot/password")
	public String resetPassword(@RequestParam String newPassword, @RequestParam String confirmPassword,
			@RequestParam String userName, Model model) {
		if (newPassword.equals(confirmPassword)) {
			lgServ.forgotPassword(userName, newPassword);
			return "redirect:/login/form";
		} else {
			model.addAttribute("error", "Passwords do not match");
			return "adminPages/forgotPassword";
		}
	}
}
