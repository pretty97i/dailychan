package com.chan.dto;

public class ProductDTO {
	
	private String mode;
	
	private String bestNum;
	private String price;
	private String result_price;
	private String reviewDataCount;
	private String bestParams;
	
	private int product_id;
	private int product_price;
	private int product_discount;
	private int product_resultPrice;
	private int product_stock;
	private int product_saleLimit;
	private String product_saleLimit1;
	
	private String product_subject;
	private String product_keep;
	private String product_buypoint;
	private String product_mainSaveFileName;
	private String product_contentSaveFileName;
	private String product_firstSelect;
	private String product_secondSelect;
	private String product_lastSelect;
	private String product_delivery1;
	private String product_delivery2;
	private String product_delivery3;
	private String product_like;
	
	private String productTag_firstSelect;
	private String productTag_secondSelect;
	private String productTag_lastSelect;
	
	private String productDetail_name;
	private String productDetail_volume;
	private String productDetail_made;
	private String productDetail_origin;
	private String productDetail_created;
	private String productDetail_counseling;
	private String productDetail_configuration;
	private String productDetail_configuration1;
	private String productDetail_configuration2;

	//상품문의
	private int productQuestion_id;
	private String productQuestion_type;
	private String productQuestion_state;
	private String productQuestion_content;
	private String productQuestion_created;
	private String productQuestion_secret;

	//상품문의 답변
	private String join_id;
	private int productAnswer_id;
	private String productAnswer_created;
	private String productAnswer_content;
	
	//리뷰
	private int review_id;
	private int reviewCheck_id;
	private String review_subject;
	private String review_content;
	private String review_created;
	private int review_grade;
	private String review_saveFileName;
	
	//베스트리뷰
	private int bestReview_id;
	private int bestReview_grade;
	private String bestReview_subject;
	private String bestReview_content;
	private String bestReview_created;
	private String bestReview_saveFileName;
	
	//찜리스트
	private int zzimList_id;
	
	//상품 추천
	private int productRecommand_id;
	private String productRecommand_reason;
	private int productRecommand_num;
	
	//쿠키
	private int product_count;
	private int page_count;
	
	public String getProductTag_firstSelect() {
		return productTag_firstSelect;
	}
	public void setProductTag_firstSelect(String productTag_firstSelect) {
		this.productTag_firstSelect = productTag_firstSelect;
	}
	public String getProductTag_secondSelect() {
		return productTag_secondSelect;
	}
	public void setProductTag_secondSelect(String productTag_secondSelect) {
		this.productTag_secondSelect = productTag_secondSelect;
	}
	public String getProductTag_lastSelect() {
		return productTag_lastSelect;
	}
	public void setProductTag_lastSelect(String productTag_lastSelect) {
		this.productTag_lastSelect = productTag_lastSelect;
	}
	public String getBestNum() {
		return bestNum;
	}
	public void setBestNum(String bestNum) {
		this.bestNum = bestNum;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getResult_price() {
		return result_price;
	}
	public void setResult_price(String result_price) {
		this.result_price = result_price;
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
	public int getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_keep() {
		return product_keep;
	}
	public void setProduct_keep(String product_keep) {
		this.product_keep = product_keep;
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
	public String getProductDetail_name() {
		return productDetail_name;
	}
	public void setProductDetail_name(String productDetail_name) {
		this.productDetail_name = productDetail_name;
	}
	public String getProductDetail_volume() {
		return productDetail_volume;
	}
	public void setProductDetail_volume(String productDetail_volume) {
		this.productDetail_volume = productDetail_volume;
	}
	public String getProductDetail_made() {
		return productDetail_made;
	}
	public void setProductDetail_made(String productDetail_made) {
		this.productDetail_made = productDetail_made;
	}
	public String getProductDetail_origin() {
		return productDetail_origin;
	}
	public void setProductDetail_origin(String productDetail_origin) {
		this.productDetail_origin = productDetail_origin;
	}
	public String getProductDetail_created() {
		return productDetail_created;
	}
	public void setProductDetail_created(String productDetail_created) {
		this.productDetail_created = productDetail_created;
	}
	public String getProductDetail_counseling() {
		return productDetail_counseling;
	}
	public void setProductDetail_counseling(String productDetail_counseling) {
		this.productDetail_counseling = productDetail_counseling;
	}
	public String getProductDetail_configuration() {
		return productDetail_configuration;
	}
	public void setProductDetail_configuration(String productDetail_configuration) {
		this.productDetail_configuration = productDetail_configuration;
	}
	public int getProduct_resultPrice() {
		return product_resultPrice;
	}
	public void setProduct_resultPrice(int product_resultPrice) {
		this.product_resultPrice = product_resultPrice;
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
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
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
	public String getProductQuestion_secret() {
		return productQuestion_secret;
	}
	public void setProductQuestion_secret(String productQuestion_secret) {
		this.productQuestion_secret = productQuestion_secret;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getReviewCheck_id() {
		return reviewCheck_id;
	}
	public void setReviewCheck_id(int reviewCheck_id) {
		this.reviewCheck_id = reviewCheck_id;
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
	public int getBestReview_grade() {
		return bestReview_grade;
	}
	public void setBestReview_grade(int bestReview_grade) {
		this.bestReview_grade = bestReview_grade;
	}
	public String getBestReview_subject() {
		return bestReview_subject;
	}
	public void setBestReview_subject(String bestReview_subject) {
		this.bestReview_subject = bestReview_subject;
	}
	public String getBestReview_content() {
		return bestReview_content;
	}
	public void setBestReview_content(String bestReview_content) {
		this.bestReview_content = bestReview_content;
	}
	public String getBestReview_created() {
		return bestReview_created;
	}
	public void setBestReview_created(String bestReview_created) {
		this.bestReview_created = bestReview_created;
	}
	public String getBestReview_saveFileName() {
		return bestReview_saveFileName;
	}
	public void setBestReview_saveFileName(String bestReview_saveFileName) {
		this.bestReview_saveFileName = bestReview_saveFileName;
	}
	public int getBestReview_id() {
		return bestReview_id;
	}
	public void setBestReview_id(int bestReview_id) {
		this.bestReview_id = bestReview_id;
	}
	public String getProduct_like() {
		return product_like;
	}
	public void setProduct_like(String product_like) {
		this.product_like = product_like;
	}
	public int getZzimList_id() {
		return zzimList_id;
	}
	public void setZzimList_id(int zzimList_id) {
		this.zzimList_id = zzimList_id;
	}
	public int getProduct_saleLimit() {
		return product_saleLimit;
	}
	public void setProduct_saleLimit(int product_saleLimit) {
		this.product_saleLimit = product_saleLimit;
	}
	public String getReviewDataCount() {
		return reviewDataCount;
	}
	public void setReviewDataCount(String reviewDataCount) {
		this.reviewDataCount = reviewDataCount;
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
	public int getProductRecommand_num() {
		return productRecommand_num;
	}
	public void setProductRecommand_num(int productRecommand_num) {
		this.productRecommand_num = productRecommand_num;
	}
	public String getProductDetail_configuration1() {
		return productDetail_configuration1;
	}
	public void setProductDetail_configuration1(String productDetail_configuration1) {
		this.productDetail_configuration1 = productDetail_configuration1;
	}
	public String getProductDetail_configuration2() {
		return productDetail_configuration2;
	}
	public void setProductDetail_configuration2(String productDetail_configuration2) {
		this.productDetail_configuration2 = productDetail_configuration2;
	}
	public String getProduct_saleLimit1() {
		return product_saleLimit1;
	}
	public void setProduct_saleLimit1(String product_saleLimit1) {
		this.product_saleLimit1 = product_saleLimit1;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getPage_count() {
		return page_count;
	}
	public void setPage_count(int page_count) {
		this.page_count = page_count;
	}
	public String getBestParams() {
		return bestParams;
	}
	public void setBestParams(String bestParams) {
		this.bestParams = bestParams;
	}

}
