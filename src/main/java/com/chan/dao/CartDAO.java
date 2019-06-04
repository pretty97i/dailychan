package com.chan.dao;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.AdminDTO;
import com.chan.dto.CartDTO;

public class CartDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate (SqlSessionTemplate sessionTemplate)throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//addCart 시작
	
	public int checkOverlap(String join_id, int product_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("join_id", join_id);
		params.put("product_id",product_id);
		
		int check = 0;
		check = sessionTemplate.selectOne("cartMapper.checkOverlap",params);
		
		return check;
		
	}
	
	
	public int findSameCartID(String join_id, int product_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("join_id", join_id);
		params.put("product_id",product_id);
		
		int cart_id = 0;
		cart_id = sessionTemplate.selectOne("cartMapper.findSameCart",params);
		
		return cart_id;
		
	}

	
	
	public CartDTO productInfo(int product_id) {
		
		CartDTO dto = sessionTemplate.selectOne("cartMapper.productInfo",product_id);
		
		return dto;				
		
	}
	
	
	public int getCartMaxNum() {
		
		int cartMaxNum = 0;		
		cartMaxNum = sessionTemplate.selectOne("cartMapper.getCartMaxNum");
		
		return cartMaxNum;		
		
	}
	
	
	public void insertCart(CartDTO dto) {
		
		sessionTemplate.insert("cartMapper.insertCart",dto);
		
	}
	
	//addCart 끝
	
	
	//cartList 시작
	public int getCartCount(String join_id) {
		
		int result = sessionTemplate.selectOne("cartMapper.getCartCount",join_id);		
		return result;	
		
	}
	
	public List<CartDTO> totalCartPrice(String join_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("join_id",join_id);
		
		List<CartDTO> lists = sessionTemplate.selectList("cartMapper.totalCartPrice",params);
		
		return lists;
		
	}
	
	
	public List<CartDTO> getCartList(int start,int end,String join_id){		

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);	
		params.put("join_id", join_id);
		
		List<CartDTO> lists = sessionTemplate.selectList("cartMapper.getCartList",params);
			
		
		return lists;
	}
	
	public CartDTO getCategroy(int product_id) {
		
		CartDTO dto = sessionTemplate.selectOne("cartMapper.getCategroy",product_id);
		
		return dto;
	}
	
	public void deleteCartID(int cart_id){
		
		sessionTemplate.delete("cartMapper.deleteCartID",cart_id);		
		
	}
	
	
	
	public void changeQuantity(int cart_id,int cart_quantity) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("cart_id", cart_id);
		params.put("cart_quantity", cart_quantity);	
		
		sessionTemplate.update("cartMapper.changeQuantity",params);	
		
	}
	
	
	public int getZzimMaxNum() {
		
		int zzimMaxNum = 0;		
		zzimMaxNum = sessionTemplate.selectOne("cartMapper.getZzimMaxNum");
		
		return zzimMaxNum;		
		
	}
	
	
	
	public void insertZzim(CartDTO dto) {
		
		sessionTemplate.insert("cartMapper.insertZzim",dto);	
		
	}
	
	
	public int getOrderMaxNum() {
		
		int result = sessionTemplate.selectOne("cartMapper.getOrderMaxNum");
		
		return result;

	}
	
	public CartDTO cartInfo(int cart_id) {
		
		CartDTO dto = sessionTemplate.selectOne("cartMapper.cartInfo",cart_id);
		
		return dto;
		
	}


	
}
