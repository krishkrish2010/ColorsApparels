package com.in.colorsapparels.userModel;

import java.util.Date;

public class Customer {
    private Long id;
    private String name;
    private String mobile;
    private String mailId;
	private Long invoiceNumber;
	private Date invoiceDate;
	private int totalDiscountAmount;
	private int invoiceAmount;
    private CustomerBilling customerBilling;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public Long getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(Long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public int getTotalDiscountAmount() {
		return totalDiscountAmount;
	}

	public void setTotalDiscountAmount(int totalDiscountAmount) {
		this.totalDiscountAmount = totalDiscountAmount;
	}

	public int getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(int invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public CustomerBilling getCustomerBilling() {
		return customerBilling;
	}

	public void setCustomerBilling(CustomerBilling customerBilling) {
		this.customerBilling = customerBilling;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", mobile=" + mobile + ", mailId=" + mailId
				+ ", invoiceNumber=" + invoiceNumber + ", invoiceDate=" + invoiceDate + ", totalDiscountAmount="
				+ totalDiscountAmount + ", invoiceAmount=" + invoiceAmount + ", customerBilling=" + customerBilling
				+ "]";
	}


	
}
