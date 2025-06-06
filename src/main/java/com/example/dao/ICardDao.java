package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.*;

import java.util.Optional;

@Repository
public interface ICardDao extends JpaRepository<Card, Long> {
    Card findByRegister(Register reg);
}
