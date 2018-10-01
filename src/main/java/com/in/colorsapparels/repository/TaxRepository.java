package com.in.colorsapparels.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.in.colorsapparels.model.Tax;

public interface TaxRepository extends JpaRepository<Tax, Long> {
	Tax findByName(String name);
}
