package com.in.colorsapparels.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.colorsapparels.model.Tax;
import com.in.colorsapparels.repository.TaxRepository;
@Service
public class TaxServiceImpl implements TaxService{

	    @Autowired
	    private TaxRepository taxRepository;

	    @Override
	    public void save(Tax tax) {
	        tax.setName(tax.getName());
	        tax.setValue(tax.getValue());
	        taxRepository.save(tax);
	    }

	    @Override
	    public Tax findByName(String name) {
	        return taxRepository.findByName(name);
	    }

		@Override
		public List<Tax> findAll() {
			return taxRepository.findAll();
		}

		@Override
		public void delete(Long id) {
			taxRepository.delete(id);
		}

		@Override
		public Tax findOne(Long id) {
			return taxRepository.findOne(id);
		}

		@Override
		public String findTaxNameById(Long id) {
			Tax tax = taxRepository.findOne(id);
			return tax.getName();

		}
	}
