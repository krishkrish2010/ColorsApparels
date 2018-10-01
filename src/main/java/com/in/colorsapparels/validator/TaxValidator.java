package com.in.colorsapparels.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.in.colorsapparels.model.Tax;
import com.in.colorsapparels.service.TaxService;

@Component
public class TaxValidator implements Validator {
    @Autowired
    private TaxService taxService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Tax.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tax tax = (Tax) o;
        System.out.println(tax);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "value", "NotEmpty");

        if (taxService.findByName(tax.getName()) != null) {
            errors.rejectValue("name", "Duplicate.taxForm.name");
        }
    }
}
