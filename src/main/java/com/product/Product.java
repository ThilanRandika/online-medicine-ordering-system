package com.product;

public class Product {
	
	private int productId;
	private String productName;
	private String produCategory; 
	private String productDescription;
	private String productPrice;
	private String productQuantity;
	private String productImage;
	
	public Product() {
		super();
	}

	public Product(int productId, String productName, String produCategory, String productDescription,
			String productPrice, String productQuantity, String productImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.produCategory = produCategory;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productImage = productImage;
	}

	public int getProductId() {
		return productId;
	}

	public String getProductName() {
		return productName;
	}

	public String getProduCategory() {
		return produCategory;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setProduCategory(String produCategory) {
		this.produCategory = produCategory;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

}
