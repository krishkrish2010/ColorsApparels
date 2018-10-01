package com.in.colorsapparels.userModel;

public class CustomerBilling {
	
	private Long id;
	private Long itemId;
	private int itemQuantity;
	private int itemPrice;
	private int itemDiscountAmount;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemDiscountAmount() {
		return itemDiscountAmount;
	}
	public void setItemDiscountAmount(int itemDiscountAmount) {
		this.itemDiscountAmount = itemDiscountAmount;
	}
	@Override
	public String toString() {
		return "CustomerBilling [id=" + id + ", itemId=" + itemId + ", itemQuantity=" + itemQuantity + ", itemPrice="
				+ itemPrice + ", itemDiscountAmount=" + itemDiscountAmount + "]";
	}
	


	
}
