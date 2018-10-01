package com.in.colorsapparels.service;

import java.util.List;

import com.in.colorsapparels.model.Tax;

public interface TaxService {
    void save(Tax tax);
    
    void delete(Long id);
    
    String findTaxNameById(Long id);
    
    Tax findOne(Long id);

    Tax findByName(String username);
    
    List<Tax> findAll();
}
