package com.chan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.ProductDTO;

public class ProductDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}
	
	//추천상품보기
	public List<ProductDTO> mdSelect(String firstSelect,String secondSelect,String lastSelect,int end,int product_id){
		
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("product_id", product_id);
		params.put("firstSelect", firstSelect);
		params.put("secondSelect", secondSelect);
		params.put("lastSelect", lastSelect);
		params.put("end", end);
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.mdSelect",params);
		
		return lists;
	}
	
	public int getMaxId(){
		
		int maxId = sessionTemplate.selectOne("product.maxId");
		
		return maxId;
		
	}
	
	//전체 데이터수 구하기
	public int getDataCount(String searchValue,String firstSelect,String secondSelect,String lastSelect){
		
		int result = 0;
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);
		params.put("secondSelect",secondSelect);
		params.put("lastSelect",lastSelect);

		result = sessionTemplate.selectOne("product.getDataCount",params);
		
		return result;
	
	}
	
	//이벤트 데이터수 구하기
	public int getEventDataCount(String searchValue,String firstSelect,String secondSelect){
		
		int result = 0;
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);
		params.put("secondSelect",secondSelect);

		result = sessionTemplate.selectOne("product.getEventDataCount",params);
		
		return result;
	
	}
	
	//산지,오!감동 데이터수 구하기
	public int getEtcDataCount(String searchValue,String firstSelect){
		
		int result = 0;
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);

		result = sessionTemplate.selectOne("product.getEtcDataCount",params);
		
		return result;
	
	}
	
	//전체데이터
	public List<ProductDTO> getList(int start, int end, String searchValue,
			String firstSelect, String secondSelect, String lastSelect,String sort, String direction){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);
		params.put("secondSelect",secondSelect);
		params.put("lastSelect",lastSelect);
		params.put("sort",sort);
		params.put("direction",direction);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getLists",params);
		
		return lists;
		
	}
	
	public ProductDTO getReadData(int product_id){
		
		ProductDTO dto = sessionTemplate.selectOne("product.getReadData",product_id);
		
		return dto;
		
	}
	
	public List<ProductDTO> getBestList(String secondSelect, String lastSelect){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("secondSelect",secondSelect);
		params.put("lastSelect",lastSelect);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getBestLists",params);
		
		return lists;

	}
	
	public List<ProductDTO> getMenuList(String firstSelect, String secondSelect){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("firstSelect",firstSelect);
		params.put("secondSelect",secondSelect);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getMenuLists",params);
		
		return lists;
		
	}
	
	public int getMaxProductQnaId(){
		
		int maxId = 0;
		
		maxId = sessionTemplate.selectOne("product.maxProductQnaId");
		
		return maxId;
		
	}
	
	public void productQnaInsertData(ProductDTO dto){
		
		sessionTemplate.insert("product.productQnaInsertData",dto);
		
	}
	
	public List<ProductDTO> getQnaList(int start, int end, int product_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("product_id",product_id);
		params.put("start", start);
		params.put("end", end);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.productQnaList",params);
		
		return lists;
		
	}

	public int getQnaDataCount(int product_id){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("product.productQnaDataCount",product_id);
		
		return result;
	
	}
	
	public List<ProductDTO> getQnaMyList(int start,int end, int product_id,String join_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("product_id",product_id);
		params.put("join_id", join_id);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.productQnaMyList",params);
		
		return lists;
		
	}
	
	public int getQnaMyDataCount(String join_id,int product_id){
		
		int result = 0;
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("join_id",join_id);
		params.put("product_id",product_id);
		
		result = sessionTemplate.selectOne("product.productQnaMyDataCount",params);
		
		return result;
	
	}
	
	public ProductDTO  getAnswerList(int productQuestion_id){
		
		ProductDTO dto = sessionTemplate.selectOne("product.productAnswerList",productQuestion_id);
		
		return dto;
		
	}
	
	public List<ProductDTO> getReviewAllList(int start, int end, int product_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("product_id",product_id);
		params.put("start", start);
		params.put("end", end);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.productReviewAllList",params);
		
		return lists;
		
	}
	
	public List<ProductDTO> getReviewPhotoList(int start, int end, int product_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("product_id",product_id);
		params.put("start", start);
		params.put("end", end);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.productReviewPhotoList",params);
		
		return lists;
		
	}
	
	public int getReviewAllCount(int product_id){
		
		int maxId = sessionTemplate.selectOne("product.productReviewAllDataCount",product_id);
		
		return maxId;
		
	}
	
	public int getReviewPhotoCount(int product_id){
		
		int maxId = sessionTemplate.selectOne("product.productReviewPhotoDataCount",product_id);
		
		return maxId;
		
	}
	
	public ProductDTO getReviewData(int product_id,int review_id){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("product_id",product_id);
		params.put("review_id",review_id);
		
		ProductDTO dto = sessionTemplate.selectOne("product.getReviewData",params);
		
		return dto;
		
	}
	
	public void getReviewData(ProductDTO dto){
		
		sessionTemplate.insert("product.bestReviewInsertData", dto);
		
	}
	
	
	
	public List<ProductDTO> bestReviewList(int start,int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start",start);
		params.put("end",end);
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.bestReviewList",params);
		
		return lists;
		
	}
	
	public int bestReviewCount(){
		
		int maxId = sessionTemplate.selectOne("product.bestReviewDataCount");
		
		return maxId;
		
	}
	
	public ProductDTO bestReviewProductData(int product_id){
		
		ProductDTO dto = sessionTemplate.selectOne("product.bestReviewProductData",product_id);
		
		return dto;
		
	}
	
	//검색페이지
	public List<ProductDTO> searchProduct(int start, int end, String keyword,String sort, String direction){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("keyword", keyword);
		params.put("sort", sort);
		params.put("direction", direction);
		
		List<ProductDTO> searchLists = sessionTemplate.selectList("product.searchProduct",params);
		
		return searchLists;
			
	}
	
	public int searchProductDatacount(String keyword){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("product.searchProductDatacount",keyword);
		
		return result;
	
	}
	
	public void zzimListInsert(ProductDTO dto){
		
		sessionTemplate.insert("product.zzimListInsert",dto);
			
	}
	
	//ddd********************************************************************
	
	public List<ProductDTO> getOriginLists(int start, int end, String searchValue,
			String firstSelect){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);
	
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getOriginLists",params);
		
		return lists;
		
	}
	public List<ProductDTO> getEventLists(int start, int end, String searchValue,
			String firstSelect, String secondSelect,String sort, String direction){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		params.put("firstSelect",firstSelect);
		params.put("secondSelect",secondSelect);
		params.put("sort",sort);
		params.put("direction",direction);
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getEventLists",params);
		
		return lists;
		
	}
	public List<ProductDTO> getOtherMenuLists(String firstSelect){
		
		
		List<ProductDTO> lists = 
				sessionTemplate.selectList("product.getOtherMenuLists",firstSelect);
		
		return lists;
		
	}
	

	public ProductDTO getReadList(int product_id){
		
		ProductDTO dto = sessionTemplate.selectOne("product.getReadData",product_id);
		
		return dto;
		
	}
	
	//======================best List=========================
	public List<ProductDTO> getBestProductList() {
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.bestProductList");
		
		return lists;
		
	}
	
	public List<ProductDTO> getBest5ProductList() {
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.best5ProductList");
		
		return lists;
		
	}
	
	//======================상품 추천=========================
	public List<ProductDTO> userRecommandList(String join_id) {
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.productRecommandList",join_id);
		
		return lists;
		
	}
	
	public int recommandCount(String join_id) {
		
		int count = sessionTemplate.selectOne("product.productRecommandCount",join_id);
		
		return count;
		
	}
	
	public void insertProductRecommand(String join_id,int product_id,
			String product_subject,String productRecommand_reason) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("join_id", join_id);
		params.put("product_id", product_id);
		params.put("product_subject", product_subject);
		params.put("productRecommand_reason",productRecommand_reason);

		sessionTemplate.insert("product.insertProductRecommand",params);
		
	}
	
	public void updateProductRecommand(int product_id) {
		
		sessionTemplate.update("product.updateProductRecommand",product_id);
		
	}
	
	public List<ProductDTO> bestProductRecommandLists() {
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.bestRecommandLists");
		
		return lists;
		
	}
	
	public List<ProductDTO> productRecommandLists() {
		
		List<ProductDTO> lists = sessionTemplate.selectList("product.recommandLists");
		
		return lists;
		
	}
	
	
	//==================쿠키리스트======================
	public ProductDTO cookieList (int product_id) {
		
		ProductDTO dto=sessionTemplate.selectOne("product.cookieList",product_id);

		return dto;
		
	}
}
