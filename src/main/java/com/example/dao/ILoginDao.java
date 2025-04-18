package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.*;

@Repository
public interface ILoginDao extends JpaRepository<Login, String> {
	Login findByUserName(String userName);
}
