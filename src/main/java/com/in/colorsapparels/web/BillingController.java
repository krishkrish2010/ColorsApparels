package com.in.colorsapparels.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.in.colorsapparels.service.ProductService;
import com.in.colorsapparels.service.TaxService;
import com.in.colorsapparels.userModel.Customer;

@Controller
public class BillingController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private TaxService taxService;
    
    @RequestMapping(value = {"/billing"}, method = RequestMethod.GET)
    public String getBilling(Model model) {

        	model.addAttribute("customerBillingForm", new Customer());
        	return "billing";        
    }
    
    @RequestMapping(value = {"/billing"}, method = RequestMethod.POST)
    public String addBilling(@ModelAttribute("customerBillingForm") Customer customerBillingForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
    	System.out.println(customerBillingForm);
    	redirectAttributes.addFlashAttribute("css", "success");
    	redirectAttributes.addFlashAttribute("msg", "Bill added successfully");
    	return "redirect:/billing";
/*        else {        	
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This Product not available to update");
        	return "redirect:/getProduct";
        }*/
        
    }
    
}
