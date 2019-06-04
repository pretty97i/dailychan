package com.chan.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.CartDTO;
import com.chan.dto.OrderDTO;

public class OrderDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertReviewCheck(OrderDTO dto) {
		
		sessionTemplate.insert("order.insertReviewCheck",dto);
		
	}
	
	public OrderDTO userData(String join_id){
		
		OrderDTO dto = sessionTemplate.selectOne("order.userData",join_id);
		
		return dto;
		
	}
	
	public String dayBreak(String juso){
		
		String juso1 = sessionTemplate.selectOne("order.dayBreak",juso);
		
		return juso1;
		
	}
	
	public String storeDelivery(String juso){
		
		String juso2 = sessionTemplate.selectOne("order.storeDelivery",juso);
		
		return juso2;
		
	}

	public ArrayList<OrderDTO> paymentCartList(int start,int end,String join_id,String[] selectProduct_id){		

		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();

		for(int i=0;i<selectProduct_id.length;i++) {
			
			System.out.println(selectProduct_id[i]);

			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("start", start);
			params.put("end", end);	
			params.put("join_id", join_id);
			params.put("cart_id",selectProduct_id[i]);

			OrderDTO dto = sessionTemplate.selectOne("order.paymentCartList",params);

			lists.add(dto);

		}

		return lists;
		
	}
	
	public OrderDTO paymentCartData(String join_id,int product_id){		
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("join_id", join_id);
		params.put("product_id",product_id);
		
		OrderDTO dto = sessionTemplate.selectOne("order.paymentCartData",params);
		
		return dto;
		
	}
	
	public List<OrderDTO> payCouponList(String join_id){		

		List<OrderDTO> lists = sessionTemplate.selectList("order.payCouponList",join_id);

		return lists;
		
	}
	
	public void insertProductOrder(OrderDTO dto) {
		
		sessionTemplate.insert("order.insertProductOrder",dto);
		
	}
	
	public void updateAddress(OrderDTO dto) {
		
		sessionTemplate.update("order.updateAddress",dto);
		
	}

	public int insertPoint(int point_score,int point_use, String join_id, String point_content,int orderList_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("point_score",point_score);
		params.put("point_use",point_use);
		params.put("join_id", join_id);
		params.put("point_content",point_content);
		params.put("orderList_id",orderList_id);
		
		sessionTemplate.insert("order.insertPoint",params);
		int point_id = sessionTemplate.selectOne("order.getPointId");
		
		return point_id;
		
	}
	
	public void updatePoint(int point_id,int orderList_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("point_id",point_id);
		params.put("orderList_id",orderList_id);
		
		sessionTemplate.update("order.updatePoint",params);
		
	}
	
	
	public int insertOrderList(OrderDTO dto) {
		
		sessionTemplate.insert("order.insertOrderList",dto);
		int orderList_id = sessionTemplate.selectOne("order.getOrderListId");
		
		return orderList_id;

	}
	
	public void userUpdatePointMinus(String join_id,int point_score) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("point_score",point_score);
		params.put("join_id",join_id);
		
		sessionTemplate.update("order.joinUpdatePointMinus",params);
		
	}
	
	public void userUpdatePointPlus(String join_id,int point_score) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("point_score",point_score);
		params.put("join_id",join_id);
		
		sessionTemplate.update("order.joinUpdatePointPlus",params);
		
	}
	
	public void deleteCartList(int cart_id) {
		
		sessionTemplate.delete("order.deleteCartList",cart_id);
		
	}
	
	public void updateUseCoupon(String coupon_id,String join_id) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("coupon_id",coupon_id);
		params.put("join_id",join_id);
		
		sessionTemplate.delete("order.updateUseCoupon",params);
		
	}
	
	public List<OrderDTO> getProductId(String selectCart_id[]) {
		
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		
		for(int i=0;i<selectCart_id.length;i++) {
			
			int cart_id = Integer.parseInt(selectCart_id[i]);

			OrderDTO dto = sessionTemplate.selectOne("order.getProductId",cart_id);
			
			lists.add(dto);
			
		}
		
		return lists;
		
	}
	
	public void updateProductSaleCount(List<OrderDTO> lists) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		Iterator<OrderDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			OrderDTO dto = it.next();
			
			params.put("product_id",dto.getProduct_id());
			params.put("cart_quantity",dto.getCart_quantity());
			
			String firstSelect = sessionTemplate.selectOne("order.productReadData",dto.getProduct_id());
			
			if(firstSelect.equals("¿À!°¨µ¿")) {
				
				sessionTemplate.update("order.ogamdongUpdateProductSaleCount",params);
				
			}else {
				
				sessionTemplate.update("order.updateProductSaleCount",params);
				
			}

		}

	}

}
