package com.in.colorsapparels.web;

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

import com.in.colorsapparels.model.Tax;
import com.in.colorsapparels.service.TaxService;

@Controller
public class TaxController {
    @Autowired
    private TaxService taxService;
    
/*    @Autowired
    private TaxValidator taxValidator;

    @RequestMapping(value = "/addTax", method = RequestMethod.GET)
    public String tax(Model model) {
        model.addAttribute("taxForm", new Tax());
        return "addTax";
    }*/
    
    @RequestMapping(value = {"/getTax"}, method = RequestMethod.GET)
    public String getTax(@ModelAttribute("getTaxForm") Tax taxForm, BindingResult bindingResult, Model model) {
    	List<Tax> getTaxList = taxService.findAll();
        model.addAttribute("taxForm", new Tax());
    	model.addAttribute("taxList", getTaxList);
        return "getTax";
    }
    
    @RequestMapping(value = {"/getTax"}, method = RequestMethod.POST)
    public String addTax(@ModelAttribute("taxForm") Tax taxForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
    	//taxValidator.validate(taxForm, bindingResult);
        if (taxService.findByName(taxForm.getName()) != null) {
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This tax name already exists");
        }
        else {
    	taxService.save(taxForm);
    	redirectAttributes.addFlashAttribute("css", "success");
    	redirectAttributes.addFlashAttribute("msg", "Tax added successfully");
        }
        return "redirect:/getTax";
    }
    
    @RequestMapping(value = {"/tax/{id}/delete"}, method = RequestMethod.GET)
    public String deleteTax(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes) {
        if (taxService.findOne(id) == null) {
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This tax not available to delete");
        }
        else {
    	taxService.delete(id);
    	redirectAttributes.addFlashAttribute("css", "success");
    	redirectAttributes.addFlashAttribute("msg", "Tax deleted successfully");
        }
        return "redirect:/getTax";
    }
    
    @RequestMapping(value = {"/tax/{id}/update"}, method = RequestMethod.GET)
    public String getupdateTax(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes, Model model) {
    	Tax tax = taxService.findOne(id);
        if ( tax!= null) {
        	model.addAttribute("taxForm", tax);
        	return "updateTax";
        }
        else {        	
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This tax not available to update");
        	return "redirect:/getTax";
        }
        
    }
    
    @RequestMapping(value = {"/updateTax"}, method = RequestMethod.POST)
    public String updateTax(@ModelAttribute("taxForm") Tax taxForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
        if (taxService.findOne(taxForm.getId()) != null) {
        	taxService.save(taxForm);
        	redirectAttributes.addFlashAttribute("css", "success");
        	redirectAttributes.addFlashAttribute("msg", "Tax updated successfully");
        	return "redirect:/getTax";
        }
        else {        	
          	redirectAttributes.addFlashAttribute("css", "danger");
        	redirectAttributes.addFlashAttribute("msg", "This tax not available to update");
        	return "redirect:/getTax";
        }
        
    }
    
    
    
}
