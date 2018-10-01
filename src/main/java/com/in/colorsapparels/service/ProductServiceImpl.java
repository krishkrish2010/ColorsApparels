package com.in.colorsapparels.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.colorsapparels.model.Product;
import com.in.colorsapparels.repository.ProductRepository;
@Service
public class ProductServiceImpl implements ProductService{

	    @Autowired
	    private ProductRepository productRepository;

	    @Override
	    public void save(Product product) {
	    	product.setName(product.getName());
	    	product.setCode(product.getCode());
	    	product.setPrice(product.getPrice());
	    	product.setTotalCount(product.getTotalCount());

	        productRepository.save(product);
	    }

	    @Override
	    public Product findByName(String name) {
	        return productRepository.findByName(name);
	    }

		@Override
		public List<Product> findAll() {
			return productRepository.findAll();
		}

		@Override
		public void delete(Long id) {
			productRepository.delete(id);
		}

		@Override
		public Product findOne(Long id) {
			return productRepository.findOne(id);
		}
	}
