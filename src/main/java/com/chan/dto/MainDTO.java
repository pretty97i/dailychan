package com.chan.dto;

public class MainDTO {
	
	private String join_id;
	
	private int product_id;
	private int product_price;
	private int product_discount;
	private int product_resultPrice;
	private int product_saleCount;
	private int product_like;
	private int product_recommand;
	
	private String product_subject;
	private String product_mainSaveFileName;
	private String product_firstSelect;
	private String product_secondSelect;
	private String product_lastSelect;
	
	//===========notice=============================
	private int notice_id;
	private String notice_subject;
	private String notice_content;
	private String notice_saveFileName;
	private String notice_created;
	
	
	public String getNotice_created() {
		return notice_created;
	}
	public void setNotice_created(String notice_created) {
		this.notice_created = notice_created;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}
	public int getProduct_resultPrice() {
		return product_resultPrice;
	}
	public void setProduct_resultPrice(int product_resultPrice) {
		this.product_resultPrice = product_resultPrice;
	}
	public int getProduct_saleCount() {
		return product_saleCount;
	}
	public void setProduct_saleCount(int product_saleCount) {
		this.product_saleCount = product_saleCount;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_mainSaveFileName() {
		return product_mainSaveFileName;
	}
	public void setProduct_mainSaveFileName(String product_mainSaveFileName) {
		this.product_mainSaveFileName = product_mainSaveFileName;
	}
	public String getProduct_firstSelect() {
		return product_firstSelect;
	}
	public void setProduct_firstSelect(String product_firstSelect) {
		this.product_firstSelect = product_firstSelect;
	}
	public String getProduct_secondSelect() {
		return product_secondSelect;
	}
	public void setProduct_secondSelect(String product_secondSelect) {
		this.product_secondSelect = product_secondSelect;
	}
	public String getProduct_lastSelect() {
		return product_lastSelect;
	}
	public void setProduct_lastSelect(String product_lastSelect) {
		this.product_lastSelect = product_lastSelect;
	}
	public int getProduct_like() {
		return product_like;
	}
	public void setProduct_like(int product_like) {
		this.product_like = product_like;
	}
	public int getProduct_recommand() {
		return product_recommand;
	}
	public void setProduct_recommand(int product_recommand) {
		this.product_recommand = product_recommand;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_saveFileName() {
		return notice_saveFileName;
	}
	public void setNotice_saveFileName(String notice_saveFileName) {
		this.notice_saveFileName = notice_saveFileName;
	}
	
}
