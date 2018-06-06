package com.onlinelaptopstore.beans;

public class LaptopSpecifications {
	private Integer specificationId;
	private Integer specificationCategoryId;
	private String specificationName;
	private String specificationDesc;
	private Double price;
	public Integer getSpecificationId() {
		return specificationId;
	}
	public void setSpecificationId(Integer specificationId) {
		this.specificationId = specificationId;
	}
	public Integer getSpecificationCategoryId() {
		return specificationCategoryId;
	}
	public void setSpecificationCategoryId(Integer specificationCategoryId) {
		this.specificationCategoryId = specificationCategoryId;
	}
	public String getSpecificationName() {
		return specificationName;
	}
	public void setSpecificationName(String specificationName) {
		this.specificationName = specificationName;
	}
	public String getSpecificationDesc() {
		return specificationDesc;
	}
	public void setSpecificationDesc(String specificationDesc) {
		this.specificationDesc = specificationDesc;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
}
