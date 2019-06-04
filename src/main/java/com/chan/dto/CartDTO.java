package com.chan.dto;

public class CartDTO {
	
	//===================join=================
	private String join_id;
	private String join_password;
	private String join_name;
	private String join_phone;
	private String join_email;
	private String join_recommender;
	private String join_snsAgree;
	private String join_emailAgree;
	private int join_point;
	private String join_addrNum;
	private String join_addr1;
	private String join_addr2;
	
	
	//===================product===============
	private int product_id;
	private String product_subject;
	private int product_price;
	private int product_discount;
	private int product_resultPrice;
	private int product_stock;
	private int product_keep;
	private String product_delivery1;
	private String product_delivery2;
	private String product_delivery3;
	private String product_buypoint;
	private String product_mainSaveFileName;
	private String product_contentSaveFileName;
	private String product_firstSelect;
	private String product_secondSelect;
	private String product_lastSelect;
	private int product_saleCount;
	private int product_saleLimit;
	
	//==================cart===================
	private int cart_id;
	private int cart_quantity;
	
	
	//==================zzimList==================
	private int zzimList_id;
	
	//=============productOrder================
	private int orderList_id;
	
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
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
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getProduct_keep() {
		return product_keep;
	}
	public void setProduct_keep(int product_keep) {
		this.product_keep = product_keep;
	}
	public String getProduct_delivery1() {
		return product_delivery1;
	}
	public void setProduct_delivery1(String product_delivery1) {
		this.product_delivery1 = product_delivery1;
	}
	public String getProduct_delivery2() {
		return product_delivery2;
	}
	public void setProduct_delivery2(String product_delivery2) {
		this.product_delivery2 = product_delivery2;
	}
	public String getProduct_delivery3() {
		return product_delivery3;
	}
	public void setProduct_delivery3(String product_delivery3) {
		this.product_delivery3 = product_delivery3;
	}
	public String getProduct_buypoint() {
		return product_buypoint;
	}
	public void setProduct_buypoint(String product_buypoint) {
		this.product_buypoint = product_buypoint;
	}
	public String getProduct_mainSaveFileName() {
		return product_mainSaveFileName;
	}
	public void setProduct_mainSaveFileName(String product_mainSaveFileName) {
		this.product_mainSaveFileName = product_mainSaveFileName;
	}
	public String getProduct_contentSaveFileName() {
		return product_contentSaveFileName;
	}
	public void setProduct_contentSaveFileName(String product_contentSaveFileName) {
		this.product_contentSaveFileName = product_contentSaveFileName;
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
	public int getProduct_saleCount() {
		return product_saleCount;
	}
	public void setProduct_saleCount(int product_saleCount) {
		this.product_saleCount = product_saleCount;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getJoin_password() {
		return join_password;
	}
	public void setJoin_password(String join_password) {
		this.join_password = join_password;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}
	public String getJoin_phone() {
		return join_phone;
	}
	public void setJoin_phone(String join_phone) {
		this.join_phone = join_phone;
	}
	public String getJoin_email() {
		return join_email;
	}
	public void setJoin_email(String join_email) {
		this.join_email = join_email;
	}
	public String getJoin_recommender() {
		return join_recommender;
	}
	public void setJoin_recommender(String join_recommender) {
		this.join_recommender = join_recommender;
	}
	public String getJoin_snsAgree() {
		return join_snsAgree;
	}
	public void setJoin_snsAgree(String join_snsAgree) {
		this.join_snsAgree = join_snsAgree;
	}
	public String getJoin_emailAgree() {
		return join_emailAgree;
	}
	public void setJoin_emailAgree(String join_emailAgree) {
		this.join_emailAgree = join_emailAgree;
	}
	public int getJoin_point() {
		return join_point;
	}
	public void setJoin_point(int join_point) {
		this.join_point = join_point;
	}
	public String getJoin_addrNum() {
		return join_addrNum;
	}
	public void setJoin_addrNum(String join_addrNum) {
		this.join_addrNum = join_addrNum;
	}
	public String getJoin_addr1() {
		return join_addr1;
	}
	public void setJoin_addr1(String join_addr1) {
		this.join_addr1 = join_addr1;
	}
	public String getJoin_addr2() {
		return join_addr2;
	}
	public void setJoin_addr2(String join_addr2) {
		this.join_addr2 = join_addr2;
	}
	public int getProduct_saleLimit() {
		return product_saleLimit;
	}
	public void setProduct_saleLimit(int product_saleLimit) {
		this.product_saleLimit = product_saleLimit;
	}
	public int getZzimList_id() {
		return zzimList_id;
	}
	public void setZzimList_id(int zzimList_id) {
		this.zzimList_id = zzimList_id;
	}
	public int getOrderList_id() {
		return orderList_id;
	}
	public void setOrderList_id(int orderList_id) {
		this.orderList_id = orderList_id;
	}
	
	
	
	
	

}
