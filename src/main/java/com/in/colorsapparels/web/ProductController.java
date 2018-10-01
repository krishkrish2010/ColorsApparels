package com.in.colorsapparels.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.in.colorsapparels.model.Product;
import com.in.colorsapparels.service.ProductService;
import com.in.colorsapparels.service.TaxService;
import com.in.colorsapparels.userModel.UserProduct;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private TaxService taxService;
    
/*    @Autowired
    private TaxValidator taxValidator;

    @RequestMapping(value = "/addTax", method = RequestMethod.GET)
    public String tax(Model model) {
        model.addAttribute("taxForm", new Tax());
        return "addTax";
    }*/
    
    @RequestMapping(value = {"/getProduct"}, method = RequestMethod.GET)
    public String getTax(@ModelAttribute("getProductForm") Product productForm, BindingResult bindingResult, Model model) {
    	List<Product> getProductList = productService.findAll();
    	List<UserProduct> userProductList = new ArrayList<>();
    	UserProduct userProduct = null;
    	if(getProductList!=null && !getProductList.isEmpty()) {
    	for(Product product:getProductList) {
    		userProduct=new UserProduct();
    		userProduct.setId(product.getId());
    		userProduct.setCode(product.getCode());
    		userProduct.setName(product.getName());
    		userProduct.setPrice(product.getPrice());
    		userProduct.setTotalCount(product.getTotalCount());
    		userProduct.setTaxName(taxService.findTaxNameById(product.getTaxId()));
    		userProductList.add(userProduct);
    	}
    	}
        model.addAttribute("productForm", new Product());
    	model.addAttribute("productList", userProductList);
    	model.addAttribute("taxList",taxService.findAll());
        return "getProduct";
    }
    
    @RequestMapping(value = {"/getProduct"}, method = RequestMethod.POST)
    public String addTax(@ModelAttribute("productForm") Product productForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
    	//taxValidator.validate(taxForm, bindingResult);
        if (productService.findByName(productForm.getName()) != null) {
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This product name already exists");
        }
        else {
        	productService.save(productForm);
    	redirectAttributes.addFlashAttribute("css", "success");
    	redirectAttributes.addFlashAttribute("msg", "Product added successfully");
        }
        return "redirect:/getProduct";
    }
    
    @RequestMapping(value = {"/product/{id}/delete"}, method = RequestMethod.GET)
    public String deleteTax(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes) {
        if (productService.findOne(id) == null) {
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This product not available to delete");
        }
        else {
        	productService.delete(id);
    	redirectAttributes.addFlashAttribute("css", "success");
    	redirectAttributes.addFlashAttribute("msg", "Product deleted successfully");
        }
        return "redirect:/getProduct";
    }
    
    @RequestMapping(value = {"/product/{id}/update"}, method = RequestMethod.GET)
    public String getupdateTax(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes, Model model) {
    	Product product = productService.findOne(id);
        if ( product!= null) {
        	model.addAttribute("productForm", product);
        	model.addAttribute("taxList",taxService.findAll());
        	return "updateProduct";
        }
        else {        	
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This Product not available to update");
        	return "redirect:/getProduct";
        }
        
    }
    
    @RequestMapping(value = {"/updateProduct"}, method = RequestMethod.POST)
    public String updateTax(@ModelAttribute("productForm") Product productForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
        if (productService.findOne(productForm.getId()) != null) {
        	productService.save(productForm);
        	redirectAttributes.addFlashAttribute("css", "success");
        	redirectAttributes.addFlashAttribute("msg", "Product updated successfully");
        	return "redirect:/getProduct";
        }
        else {        	
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This Product not available to update");
        	return "redirect:/getProduct";
        }
        
    }
    
    
    
}
