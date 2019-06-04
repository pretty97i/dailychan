package com.chan.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chan.dao.CartDAO;
import com.chan.dao.OrderDAO;
import com.chan.dto.CartDTO;
import com.chan.dto.OrderDTO;
import com.chan.util.MyUtil;

@Controller
public class OrderController {

	@Autowired
	@Qualifier("orderDAO")
	OrderDAO orderDAO;
	
	@Autowired
	@Qualifier("cartDAO")
	CartDAO cartDAO;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/order/buy.action")
	public String buy(HttpServletRequest request, OrderDTO dto, HttpSession session) {

		String selectedCartIds = request.getParameter("selectedCartIds");
		String join_id = (String)session.getAttribute("join_id");
		String totalPrice = request.getParameter("totalPrice");
		
		OrderDTO vo = orderDAO.userData(join_id);

		vo.setProduct_totalPrice(Integer.parseInt(totalPrice));

		request.setAttribute("dto", vo);
		request.setAttribute("selectedCartIds",selectedCartIds);
				
		return "order/delivery";
		
	}
	
	@RequestMapping(value = "/order/nowBuy.action")
	public String nowBuy(HttpServletRequest request, HttpSession session, OrderDTO dto) {

		String join_id = (String)session.getAttribute("join_id");
		int check = cartDAO.checkOverlap(join_id,dto.getProduct_id());
		
		if(check!=0) {
			
			int cart_id = cartDAO.findSameCartID(join_id,dto.getProduct_id());
		
			cartDAO.changeQuantity(cart_id,dto.getProduct_count());
		
		}else {
		
			CartDTO cartDTO = cartDAO.productInfo(dto.getProduct_id());
			
			int cartMaxNum = cartDAO.getCartMaxNum();
	
			cartDTO.setCart_id(cartMaxNum + 1);
			cartDTO.setJoin_id(join_id);
			cartDTO.setProduct_id(dto.getProduct_id());
			cartDTO.setCart_quantity(dto.getProduct_count());	
			
			cartDAO.insertCart(cartDTO);
			
			int cartCount = cartDAO.getCartCount(join_id);
			
			session.setAttribute("cartCount", cartCount);
		
		}

		OrderDTO vo = orderDAO.userData(join_id);
		vo.setProduct_count(dto.getProduct_count());
		vo.setProduct_price(dto.getProduct_price());
		vo.setProduct_totalPrice(dto.getProduct_count() * dto.getProduct_price());
		vo.setProduct_id(dto.getProduct_id());
		
		request.setAttribute("dto", vo);
		request.setAttribute("product_id", dto.getProduct_id());
		
		return "order/delivery";
		
	}
	
	@RequestMapping(value = "/order/payment.action")
	public String payment(HttpServletRequest request, HttpSession session, OrderDTO dto) {
		
		String join_id = (String)session.getAttribute("join_id");
		String selectedCartIds = request.getParameter("selectedCartIds");
		String[] selectProduct_id = selectedCartIds.split(",");
		
		int deliveryPay = 0;
		int totalPrice = 0;
		int totalResultPrice = 0;
		int join_point = dto.getJoin_point();
		
		int division = 1;

		int dataCount = 1;
		
		if(dto.getSaveAddress().equals("save")) {
			
			dto.setJoin_id(join_id);
			dto.setJoin_addrNum(dto.getOrderList_reciveAddrNum());
			dto.setJoin_addr1(dto.getOrderList_reciveAddr1());
			dto.setJoin_addr2(dto.getOrderList_reciveAddr2());
			
			orderDAO.updateAddress(dto);
			
		}
		
		if(dto.getOrderList_message().equals("direct")) {
			
			dto.setOrderList_message(dto.getDirectWrite());
			
		}
		
		if(dto.getOrderList_retrieve()==null) {
			
			dto.setOrderList_retrieve("");
			
		}
		
		List<OrderDTO> coupon = orderDAO.payCouponList(join_id);
		
		if(!selectedCartIds.equals("")) {
			
			System.out.println("들어왔냐?");
			
			int su = 1;
			String pageNum = request.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum != null) 
				currentPage = Integer.parseInt(pageNum);
			
			dataCount = selectProduct_id.length;
			
			int numPerPage = 5; 
			int totalPage = myUtil.getPageCount(numPerPage,	dataCount);

			if(currentPage > totalPage) currentPage = totalPage;
		 
			int start = (currentPage - 1) * numPerPage+1;
			int end  = currentPage * numPerPage;

			List<OrderDTO> lists = orderDAO.paymentCartList(start, end, join_id, selectProduct_id);
			
			Iterator<OrderDTO> it = lists.iterator();
			
			while(it.hasNext()) {
				
				OrderDTO vo = it.next();
				
				totalPrice += vo.getProduct_price() * vo.getCart_quantity();
				totalResultPrice += vo.getProduct_resultPrice() * vo.getCart_quantity();
				vo.setProduct_totalPrice(vo.getProduct_resultPrice() * vo.getCart_quantity());
				
			}
			
			int discountPrice = totalPrice - totalResultPrice;
			division = 2;
			
			request.setAttribute("resultPrice", totalResultPrice);
			
			if(totalResultPrice<50000) {
				
				deliveryPay = 3000;
				
			}
			
			totalResultPrice = totalResultPrice + deliveryPay;

			request.setAttribute("dto", dto);
			request.setAttribute("su", su);
			request.setAttribute("lists", lists);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("totalResultPrice", totalResultPrice);
			request.setAttribute("discountPrice", discountPrice);
			request.setAttribute("dataCount", dataCount);
			request.setAttribute("division", division);
			request.setAttribute("deliveryPay", deliveryPay);
			request.setAttribute("join_point", join_point);
			request.setAttribute("coupon", coupon);
			request.setAttribute("selectedCartIds", selectedCartIds);
			
			return "order/payment";

		}

		OrderDTO vo = orderDAO.paymentCartData(join_id, dto.getProduct_id());
		
		totalPrice = vo.getProduct_price() * vo.getCart_quantity();
		totalResultPrice = vo.getProduct_resultPrice() * vo.getCart_quantity();
		int discountPrice = totalPrice - totalResultPrice;
		
		request.setAttribute("resultPrice", totalResultPrice);
		
		if(totalResultPrice<50000) {
			
			deliveryPay = 3000;
			
		}
		
		totalResultPrice = totalResultPrice + deliveryPay;

		request.setAttribute("dto", dto);
		request.setAttribute("vo", vo);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("division", division);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("totalResultPrice", totalResultPrice);
		request.setAttribute("discountPrice", discountPrice);
		request.setAttribute("deliveryPay", deliveryPay);
		request.setAttribute("join_point", join_point);
		request.setAttribute("coupon", coupon);
		request.setAttribute("selectedCartIds", selectedCartIds);
		
		return "order/payment";
		
	}
	
	@RequestMapping(value = "/order/checkjuso.action")
	public @ResponseBody String deliveryarea(OrderDTO dto,HttpServletRequest request) {

		String juso = request.getParameter("juso");
		String juso1 = orderDAO.dayBreak(juso);
		String juso2 = orderDAO.storeDelivery(juso);
		String result = null;
		
		if(juso1==null && juso2==null) {
			
			result = "0";
			
		}else if(juso1!=null && juso2==null) {
			
			result = "1";
			
		}else if(juso1==null && juso2!=null) {
			
			result = "2";
			
		}else {
			
			result = "3";
			
		}

		return result;
	
	}
	
	@RequestMapping(value = "/order/complete.action")
	public String paymentComplete(OrderDTO dto,HttpServletRequest request,HttpSession session) {

		String join_id = (String) session.getAttribute("join_id");	
		String selectedCartIds = request.getParameter("selectedCartIds");
		String[] selectCart_id = selectedCartIds.split(",");
		int point_id = 0;
		
		dto.setJoin_id(join_id);
		
		if(dto.getOrderList_payment().equals("wire")) {
			
			dto.setOrderList_step(1);
			
		}else {
			
			dto.setOrderList_step(2);
			
		}

		if(dto.getCoupon_id().equals("0")) {
			
			dto.setCoupon_id("");
			
		}

		int orderMaxNum =  cartDAO.getOrderMaxNum() + 1;

		//productOrder 삽입
		if(!selectedCartIds.equals("")) {
			
			for (int i = 0; i < selectCart_id.length; i++) {
				
				int cart_id =  Integer.parseInt(selectCart_id[i]);
							
				CartDTO info = cartDAO.cartInfo(cart_id);
				
				dto.setOrderList_id(orderMaxNum);
				dto.setJoin_id(join_id);

				dto.setProduct_id(info.getProduct_id());
				dto.setProduct_subject(info.getProduct_subject());
				dto.setProduct_resultPrice(info.getProduct_resultPrice());
				dto.setProduct_mainSaveFileName(info.getProduct_mainSaveFileName());
				dto.setCart_quantity(info.getCart_quantity());
				dto.setProductOrder_id(i+1);
	
				orderDAO.insertProductOrder(dto);
				orderDAO.insertReviewCheck(dto);
	
			}
			
		}else {
			
			CartDTO info = cartDAO.cartInfo(dto.getNowBuyCart_id());
			
			selectCart_id[0] = Integer.toString(dto.getNowBuyCart_id());
			
			dto.setOrderList_id(orderMaxNum);
			dto.setJoin_id(join_id);
			
			dto.setProduct_id(info.getProduct_id());
			dto.setProduct_subject(info.getProduct_subject());
			dto.setProduct_resultPrice(info.getProduct_resultPrice());
			dto.setProduct_mainSaveFileName(info.getProduct_mainSaveFileName());
			dto.setCart_quantity(info.getCart_quantity());
			dto.setProductOrder_id(1);
			
			orderDAO.insertProductOrder(dto);
			orderDAO.insertReviewCheck(dto);
			
		}

		//포인트 사용시 추가
		if(dto.getUsePoint()!=0) {
			
			int point_score = dto.getUsePoint();
			int orderList_id = 0;
			String point_content = "포인트 사용";
			
			point_id = orderDAO.insertPoint(point_score, 0, join_id, point_content,orderList_id);
			orderDAO.userUpdatePointMinus(join_id, point_score);
			dto.setPoint_id(point_id);
			
		}

		//OrderList 삽입
		int orderList_id = orderDAO.insertOrderList(dto);
		
		int point_score = (int)(dto.getOrderList_resultPrice() * 0.015);
		String point_content = "물품 구매에 따른 포인트 적립";
		
		orderDAO.insertPoint(point_score, 1, join_id, point_content,orderList_id);
		orderDAO.userUpdatePointPlus(join_id, point_score);
		orderDAO.updatePoint(point_id, orderList_id);
		
		//사용된 쿠폰 변경
		if(!dto.getCoupon_id().equals("")) {
			
			orderDAO.updateUseCoupon(dto.getCoupon_id(), join_id);
			
		}
		
		//물품 판매 횟수 및 재고 변경
		List<OrderDTO> lists = orderDAO.getProductId(selectCart_id);
		orderDAO.updateProductSaleCount(lists);
		
		//CartList에서 구매한 물품 삭제
		if(!selectedCartIds.equals("")) {
			
			for (int i = 0; i < selectCart_id.length; i++) {
				
				int cart_id =  Integer.parseInt(selectCart_id[i]);

				orderDAO.deleteCartList(cart_id);

			}
			
		}else {
			
			orderDAO.deleteCartList(dto.getNowBuyCart_id());
			
		}
		
		int cartCount = cartDAO.getCartCount(join_id);
		
		session.setAttribute("cartCount", cartCount);

		return "order/complete";
		
	}
	
}
