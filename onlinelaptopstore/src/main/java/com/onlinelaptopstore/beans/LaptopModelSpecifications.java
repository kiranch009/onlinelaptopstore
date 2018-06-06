package com.onlinelaptopstore.beans;

public class LaptopModelSpecifications {
	private Integer modelSpecificationId;
	private Integer modelId;
	private Integer specificationId;
	private boolean defaultOption;

	public Integer getModelSpecificationId() {
		return modelSpecificationId;
	}

	public void setModelSpecificationId(Integer modelSpecificationId) {
		this.modelSpecificationId = modelSpecificationId;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public Integer getSpecificationId() {
		return specificationId;
	}

	public void setSpecificationId(Integer specificationId) {
		this.specificationId = specificationId;
	}

	public boolean isDefaultOption() {
		return defaultOption;
	}

	public void setDefaultOption(boolean defaultOption) {
		this.defaultOption = defaultOption;
	}
}
