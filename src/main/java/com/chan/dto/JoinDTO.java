package com.chan.dto;

public class JoinDTO {
	
	private String join_id; 
	private String join_password;
	private String join_name;
	private String join_phone;
	private String join_email;
	private String join_recommender;	//추천인 아이디
	private String join_snsAgree;
	private String join_emailAgree;
	private int join_point;	//포인트
	private String join_addrNum;
	private String join_addr1;
	private String join_addr2;
	private String join_created;
	
	//-------coupon
	private int coupon_id;
	private String coupon_name;
	private int coupon_price;
	private String coupon_startDate;
	private String coupon_endDate;
	private int coupon_use;
	private int coupon_insert_start;
	private int coupon_insert_end;
	private int coupon_id_count;
	
	
	
	
	
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public String getCoupon_startDate() {
		return coupon_startDate;
	}
	public void setCoupon_startDate(String coupon_startDate) {
		this.coupon_startDate = coupon_startDate;
	}
	public String getCoupon_endDate() {
		return coupon_endDate;
	}
	public void setCoupon_endDate(String coupon_endDate) {
		this.coupon_endDate = coupon_endDate;
	}
	public int getCoupon_use() {
		return coupon_use;
	}
	public void setCoupon_use(int coupon_use) {
		this.coupon_use = coupon_use;
	}
	public int getCoupon_insert_start() {
		return coupon_insert_start;
	}
	public void setCoupon_insert_start(int coupon_insert_start) {
		this.coupon_insert_start = coupon_insert_start;
	}
	public int getCoupon_insert_end() {
		return coupon_insert_end;
	}
	public void setCoupon_insert_end(int coupon_insert_end) {
		this.coupon_insert_end = coupon_insert_end;
	}
	public int getCoupon_id_count() {
		return coupon_id_count;
	}
	public void setCoupon_id_count(int coupon_id_count) {
		this.coupon_id_count = coupon_id_count;
	}
	public String getJoin_created() {
		return join_created;
	}
	public void setJoin_created(String join_created) {
		this.join_created = join_created;
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
	
	
}
