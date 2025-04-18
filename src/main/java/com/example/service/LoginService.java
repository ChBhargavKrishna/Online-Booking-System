package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dao.*;
import com.example.entity.*;

@Service
public class LoginService {
	// -------Login Methods Logic ---------
	@Autowired
	ILoginDao lgRepo;
	
	public Login authenticate(String userName, String passCode) {
		Login u = lgRepo.findByUserName(userName);
		if (u != null && u.getPassCode().equals(passCode)) {
			return u;
		}
		return null;
	}

	public boolean usernameExists(String userName) {
		return lgRepo.existsById(userName);
	}

	public void forgotPassword(String userName, String newPassword) {
		Login user = lgRepo.findByUserName(userName);
		if (user != null) {
			user.setPassCode(newPassword);
			lgRepo.save(user);
		}
	}

	public boolean changePassword(String userName, String currentPassword, String newPassword) {
		Login user = lgRepo.findByUserName(userName);
		if (user != null && user.getPassCode().equals(currentPassword)) {
			user.setPassCode(newPassword);
			lgRepo.save(user);
			return true;
		}
		return false;
	}

	// -----Register methods logic & Save ------
	@Autowired
	IRegisterDao rgRepo;
	
	public void saveRegister(Register r) {
		Register r1 = rgRepo.save(r);
		System.out.println(r1);
	}

	public Optional<Register> getRegisterById(String fullName) {
		return rgRepo.findById(fullName);
	}

	// get login
	public Register getRegisterByLogin(Login user) {
		Register r1 = rgRepo.findByLogin(user);
		return r1;
	}

	public Register findByEmail(String email) {
        return rgRepo.findByLoginUserName(email);
    }

    public void updateProfile(Register r) {
        Register edPrf = rgRepo.findById(r.getFullName()).orElse(null);
        if (edPrf != null) {
        	edPrf.setFullName(r.getFullName());
        	edPrf.setGender(r.getGender());
 			edPrf.setAge(r.getAge());
        	edPrf.setContactNo(r.getContactNo());
        	edPrf.setState(r.getState());
        	edPrf.setDOB(r.getDOB());
        	edPrf.setPinCode(r.getPinCode());
            rgRepo.save(edPrf);
        }
    }
    
	public Register getRegisterByFullName(String fullName) {
		Register r2 = rgRepo.getById(fullName);
		return r2;
	}

	// register list
	public List<Register> getAllRegisters() {
		return rgRepo.findAll();
	}
	
	public List<Register> getLatestUsers() {
        return rgRepo.findLatestUsers();
    }

	// get One register Details
	public Register getRegister() {
		return (Register) rgRepo.findAll();
	}

	// register count
	public long getRegisterCount() {
		return rgRepo.count();
	}

}
