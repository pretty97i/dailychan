package com.chan.dto;

import org.springframework.web.multipart.MultipartFile;

public class CompanyDTO {
	
	private String company;
	private String setfrom;
	private String tel;
	private String description;
	private MultipartFile attachFile;
	
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getSetfrom() {
		return setfrom;
	}
	public void setSetfrom(String setfrom) {
		this.setfrom = setfrom;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public MultipartFile getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(MultipartFile attachFile) {
		this.attachFile = attachFile;
	}

	
	
	
	
	

}
