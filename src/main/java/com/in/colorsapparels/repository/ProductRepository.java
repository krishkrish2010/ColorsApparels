package com.in.colorsapparels.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.in.colorsapparels.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	Product findByName(String name);
}
