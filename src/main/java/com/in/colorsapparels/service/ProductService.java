package com.in.colorsapparels.service;

import java.util.List;

import com.in.colorsapparels.model.Product;

public interface ProductService {
    void save(Product product);
    
    void delete(Long id);
    
    Product findOne(Long id);

    Product findByName(String username);
    
    List<Product> findAll();
}
