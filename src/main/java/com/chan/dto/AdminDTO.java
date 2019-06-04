package com.chan.dto;

public class AdminDTO {
	
	//===================refund=============
	private int refund_state;
	private String refund_reason;
	private String refund_saveFileName;
	private String refund_created;
	private String refund_subject;

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
	private String join_created;
	
	private int join_num;

	//===================product===============
	private int product_id;
	private String product_subject;
	private int product_price;
	private int product_resultPrice;
	
	//===================review================
	private int review_id;
	private String review_subject;
	private String review_content;
	private String review_created;
	private int review_grade;
	private String review_saveFileName;
	
	//==================cart===================
	private int cart_id;
	private int cart_quantity;
	
	//==================zzimList===============
	private int zzimList_id;
	
	//===================faq===================
	private int faq_id;
	private String faq_subject;
	private String faq_content;
	private String faq_division;
	
	//===================coupon================
	private int coupon_id;
	private String coupon_name;
	private int coupon_price;
	private String coupon_startDate;
	private String coupon_endDate;
	private int coupon_use;
	private int coupon_insert_start;
	private int coupon_insert_end;
	private int coupon_id_count;

	//===================buy===================
	private int buy_id;
	private String buy_created;
	private String buy_naturePackage;
	private String buy_recyclePackage;
	private int buy_step;
	private int buy_couponPrice;
	private int buy_pointPrice;
	
	//===================point==================
	private int point_id;
	private int point_score;
	private int point_use;
	private String point_created;
	private String point_content;
	
	//===========qnalist(1:1»ó´ã)=============================	
	private int qna_id;
	private String qna_select;
	private String qna_type;
	private String qna_subject;
	private String qna_content;
	private String qna_created;
	private String qna_saveFileName;
	private String qna_state;
	private String qna_store;
	private String qna_reply;
	
	//===================productAnswer==========
	private int productAnswer_id;
	private int productQuestion_id;
	private String productAnswer_created;
	private String productAnswer_content;
	private String productQuestion_type;
	private String productQuestion_state;
	private String productQuestion_content;
	private String productQuestion_created;
	private String productQuestion_secret;
	
	//===================productOrder================
	private int productOrder_id;
	
	//===================orderList===================
	private int orderList_id;
	private String orderList_created;
	private String orderList_naturePackage;
	private String orderList_recyclePackage;
	private int orderList_step;
	private int orderList_resultPrice;
	private String orderList_message;
	private String orderList_reciveName;
	private String orderList_recivePhone;
	private String orderList_reciveAddrNum;
	private String orderList_reciveAddr1;
	private String orderList_reciveAddr2;
	private int orderList_productCount;
	
	//================productRecommand===============
	private int productRecommand_id;
	private String productRecommand_reason;
	
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
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_created() {
		return review_created;
	}
	public void setReview_created(String review_created) {
		this.review_created = review_created;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public String getReview_saveFileName() {
		return review_saveFileName;
	}
	public void setReview_saveFileName(String review_saveFileName) {
		this.review_saveFileName = review_saveFileName;
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
	public int getZzimList_id() {
		return zzimList_id;
	}
	public void setZzimList_id(int zzimList_id) {
		this.zzimList_id = zzimList_id;
	}
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_division() {
		return faq_division;
	}
	public void setFaq_division(String faq_division) {
		this.faq_division = faq_division;
	}
	public String getCoupon_endDate() {
		return coupon_endDate;
	}
	public void setCoupon_endDate(String coupon_endDate) {
		this.coupon_endDate = coupon_endDate;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuy_created() {
		return buy_created;
	}
	public void setBuy_created(String buy_created) {
		this.buy_created = buy_created;
	}
	public String getBuy_naturePackage() {
		return buy_naturePackage;
	}
	public void setBuy_naturePackage(String buy_naturePackage) {
		this.buy_naturePackage = buy_naturePackage;
	}
	public String getBuy_recyclePackage() {
		return buy_recyclePackage;
	}
	public void setBuy_recyclePackage(String buy_recyclePackage) {
		this.buy_recyclePackage = buy_recyclePackage;
	}
	public int getBuy_step() {
		return buy_step;
	}
	public void setBuy_step(int buy_step) {
		this.buy_step = buy_step;
	}
	public int getBuy_couponPrice() {
		return buy_couponPrice;
	}
	public void setBuy_couponPrice(int buy_couponPrice) {
		this.buy_couponPrice = buy_couponPrice;
	}
	public int getBuy_pointPrice() {
		return buy_pointPrice;
	}
	public void setBuy_pointPrice(int buy_pointPrice) {
		this.buy_pointPrice = buy_pointPrice;
	}
	public int getPoint_id() {
		return point_id;
	}
	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	public String getPoint_created() {
		return point_created;
	}
	public void setPoint_created(String point_created) {
		this.point_created = point_created;
	}
	public int getPoint_use() {
		return point_use;
	}
	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_select() {
		return qna_select;
	}
	public void setQna_select(String qna_select) {
		this.qna_select = qna_select;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_created() {
		return qna_created;
	}
	public void setQna_created(String qna_created) {
		this.qna_created = qna_created;
	}
	public String getQna_saveFileName() {
		return qna_saveFileName;
	}
	public void setQna_saveFileName(String qna_saveFileName) {
		this.qna_saveFileName = qna_saveFileName;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public String getQna_store() {
		return qna_store;
	}
	public void setQna_store(String qna_store) {
		this.qna_store = qna_store;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public int getProductAnswer_id() {
		return productAnswer_id;
	}
	public void setProductAnswer_id(int productAnswer_id) {
		this.productAnswer_id = productAnswer_id;
	}
	public int getProductQuestion_id() {
		return productQuestion_id;
	}
	public void setProductQuestion_id(int productQuestion_id) {
		this.productQuestion_id = productQuestion_id;
	}
	public String getProductAnswer_created() {
		return productAnswer_created;
	}
	public void setProductAnswer_created(String productAnswer_created) {
		this.productAnswer_created = productAnswer_created;
	}
	public String getProductAnswer_content() {
		return productAnswer_content;
	}
	public void setProductAnswer_content(String productAnswer_content) {
		this.productAnswer_content = productAnswer_content;
	}
	public String getProductQuestion_type() {
		return productQuestion_type;
	}
	public void setProductQuestion_type(String productQuestion_type) {
		this.productQuestion_type = productQuestion_type;
	}
	public String getProductQuestion_state() {
		return productQuestion_state;
	}
	public void setProductQuestion_state(String productQuestion_state) {
		this.productQuestion_state = productQuestion_state;
	}
	public String getProductQuestion_content() {
		return productQuestion_content;
	}
	public void setProductQuestion_content(String productQuestion_content) {
		this.productQuestion_content = productQuestion_content;
	}
	public String getProductQuestion_created() {
		return productQuestion_created;
	}
	public void setProductQuestion_created(String productQuestion_created) {
		this.productQuestion_created = productQuestion_created;
	}
	public String getProductQuestion_secret() {
		return productQuestion_secret;
	}
	public void setProductQuestion_secret(String productQuestion_secret) {
		this.productQuestion_secret = productQuestion_secret;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public int getOrderList_id() {
		return orderList_id;
	}
	public void setOrderList_id(int orderList_id) {
		this.orderList_id = orderList_id;
	}
	public String getOrderList_created() {
		return orderList_created;
	}
	public void setOrderList_created(String orderList_created) {
		this.orderList_created = orderList_created;
	}
	public String getOrderList_naturePackage() {
		return orderList_naturePackage;
	}
	public void setOrderList_naturePackage(String orderList_naturePackage) {
		this.orderList_naturePackage = orderList_naturePackage;
	}
	public String getOrderList_recyclePackage() {
		return orderList_recyclePackage;
	}
	public void setOrderList_recyclePackage(String orderList_recyclePackage) {
		this.orderList_recyclePackage = orderList_recyclePackage;
	}
	public int getOrderList_step() {
		return orderList_step;
	}
	public void setOrderList_step(int orderList_step) {
		this.orderList_step = orderList_step;
	}
	public int getOrderList_resultPrice() {
		return orderList_resultPrice;
	}
	public void setOrderList_resultPrice(int orderList_resultPrice) {
		this.orderList_resultPrice = orderList_resultPrice;
	}
	public String getOrderList_message() {
		return orderList_message;
	}
	public void setOrderList_message(String orderList_message) {
		this.orderList_message = orderList_message;
	}
	public String getOrderList_reciveName() {
		return orderList_reciveName;
	}
	public void setOrderList_reciveName(String orderList_reciveName) {
		this.orderList_reciveName = orderList_reciveName;
	}
	public String getOrderList_recivePhone() {
		return orderList_recivePhone;
	}
	public void setOrderList_recivePhone(String orderList_recivePhone) {
		this.orderList_recivePhone = orderList_recivePhone;
	}
	public String getOrderList_reciveAddrNum() {
		return orderList_reciveAddrNum;
	}
	public void setOrderList_reciveAddrNum(String orderList_reciveAddrNum) {
		this.orderList_reciveAddrNum = orderList_reciveAddrNum;
	}
	public String getOrderList_reciveAddr1() {
		return orderList_reciveAddr1;
	}
	public void setOrderList_reciveAddr1(String orderList_reciveAddr1) {
		this.orderList_reciveAddr1 = orderList_reciveAddr1;
	}
	public String getOrderList_reciveAddr2() {
		return orderList_reciveAddr2;
	}
	public void setOrderList_reciveAddr2(String orderList_reciveAddr2) {
		this.orderList_reciveAddr2 = orderList_reciveAddr2;
	}
	public int getOrderList_productCount() {
		return orderList_productCount;
	}
	public void setOrderList_productCount(int orderList_productCount) {
		this.orderList_productCount = orderList_productCount;
	}
	public String getJoin_created() {
		return join_created;
	}
	public void setJoin_created(String join_created) {
		this.join_created = join_created;
	}
	public int getJoin_num() {
		return join_num;
	}
	public void setJoin_num(int join_num) {
		this.join_num = join_num;
	}
	public int getRefund_state() {
		return refund_state;
	}
	public void setRefund_state(int refund_state) {
		this.refund_state = refund_state;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	public String getRefund_saveFileName() {
		return refund_saveFileName;
	}
	public void setRefund_saveFileName(String refund_saveFileName) {
		this.refund_saveFileName = refund_saveFileName;
	}
	public String getRefund_created() {
		return refund_created;
	}
	public void setRefund_created(String refund_created) {
		this.refund_created = refund_created;
	}
	public String getRefund_subject() {
		return refund_subject;
	}
	public void setRefund_subject(String refund_subject) {
		this.refund_subject = refund_subject;
	}
	public int getProductOrder_id() {
		return productOrder_id;
	}
	public void setProductOrder_id(int productOrder_id) {
		this.productOrder_id = productOrder_id;
	}
	public int getProduct_resultPrice() {
		return product_resultPrice;
	}
	public void setProduct_resultPrice(int product_resultPrice) {
		this.product_resultPrice = product_resultPrice;
	}
	public int getProductRecommand_id() {
		return productRecommand_id;
	}
	public void setProductRecommand_id(int productRecommand_id) {
		this.productRecommand_id = productRecommand_id;
	}
	public String getProductRecommand_reason() {
		return productRecommand_reason;
	}
	public void setProductRecommand_reason(String productRecommand_reason) {
		this.productRecommand_reason = productRecommand_reason;
	}
	
	
}
