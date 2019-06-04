package com.chan.dto;

public class OrderDTO {
	
	private String saveAddress;
	
	private int product_id;
	private int product_price;
	private int product_discount;
	private int product_resultPrice;
	private int product_count;
	private int product_totalPrice;
	private String product_subject;
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
	
	private int cart_id;
	private int cart_quantity;
	private int nowBuyCart_id;
	
	private int productOrder_id;

	private String join_id;
	private String join_name;
	private String join_phone;
	private String join_addrNum;
	private String join_addr1;
	private String join_addr2;
	private int join_point;
	
	private int point_id;
	private int usePoint;
	
	private String coupon_id;
	private int coupon_price;

	private int orderList_id;
	private String orderList_created;
	private String orderList_naturePackage;
	private String orderList_recyclePackage;
	private int orderList_step;
	private int orderList_productCount;
	private int orderList_resultPrice;
	private String orderList_message;
	private String orderList_sendName;
	private String orderList_sendPhone;
	private String orderList_reciveName;
	private String orderList_recivePhone;
	private String orderList_reciveAddrNum;
	private String orderList_reciveAddr1;
	private String orderList_reciveAddr2;
	private String orderList_retrieve;
	private String orderList_payment;
	private String orderList_store;
	private String orderList_delivery;
	private String directWrite;

	private int rnum;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public int getProduct_totalPrice() {
		return product_totalPrice;
	}

	public void setProduct_totalPrice(int product_totalPrice) {
		this.product_totalPrice = product_totalPrice;
	}
	
	public String getProduct_subject() {
		return product_subject;
	}

	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
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

	public int getProduct_saleLimit() {
		return product_saleLimit;
	}

	public void setProduct_saleLimit(int product_saleLimit) {
		this.product_saleLimit = product_saleLimit;
	}

	public int getOrderList_id() {
		return orderList_id;
	}

	public void setOrderList_id(int orderList_id) {
		this.orderList_id = orderList_id;
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	public int getPoint_id() {
		return point_id;
	}

	public void setPoint_id(int point_id) {
		this.point_id = point_id;
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

	public int getOrderList_productCount() {
		return orderList_productCount;
	}

	public void setOrderList_productCount(int orderList_productCount) {
		this.orderList_productCount = orderList_productCount;
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

	public String getOrderList_sendName() {
		return orderList_sendName;
	}

	public void setOrderList_sendName(String orderList_sendName) {
		this.orderList_sendName = orderList_sendName;
	}

	public String getOrderList_sendPhone() {
		return orderList_sendPhone;
	}

	public void setOrderList_sendPhone(String orderList_sendPhone) {
		this.orderList_sendPhone = orderList_sendPhone;
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

	public String getOrderList_retrieve() {
		return orderList_retrieve;
	}

	public void setOrderList_retrieve(String orderList_retrieve) {
		this.orderList_retrieve = orderList_retrieve;
	}

	public String getOrderList_payment() {
		return orderList_payment;
	}

	public void setOrderList_payment(String orderList_payment) {
		this.orderList_payment = orderList_payment;
	}

	public String getOrderList_store() {
		return orderList_store;
	}

	public void setOrderList_store(String orderList_store) {
		this.orderList_store = orderList_store;
	}

	public String getOrderList_delivery() {
		return orderList_delivery;
	}

	public void setOrderList_delivery(String orderList_delivery) {
		this.orderList_delivery = orderList_delivery;
	}

	public String getDirectWrite() {
		return directWrite;
	}

	public void setDirectWrite(String directWrite) {
		this.directWrite = directWrite;
	}
	
	public int getJoin_point() {
		return join_point;
	}

	public void setJoin_point(int join_point) {
		this.join_point = join_point;
	}

	public int getCoupon_price() {
		return coupon_price;
	}

	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getNowBuyCart_id() {
		return nowBuyCart_id;
	}

	public void setNowBuyCart_id(int nowBuyCart_id) {
		this.nowBuyCart_id = nowBuyCart_id;
	}

	public int getProductOrder_id() {
		return productOrder_id;
	}

	public void setProductOrder_id(int productOrder_id) {
		this.productOrder_id = productOrder_id;
	}

	public String getSaveAddress() {
		return saveAddress;
	}

	public void setSaveAddress(String saveAddress) {
		this.saveAddress = saveAddress;
	}
	
}
