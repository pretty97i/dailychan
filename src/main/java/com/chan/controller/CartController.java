package com.chan.controller;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chan.dao.CartDAO;
import com.chan.dto.CartDTO;
import com.chan.util.MyUtil;

@Controller
public class CartController {

	@Autowired
	@Qualifier("cartDAO")
	CartDAO cartDAO;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value = "/cart/addCart.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String addCart(CartDTO dto, HttpServletRequest request, HttpServletResponse response,HttpSession session) {

		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));		
		String join_id = (String) session.getAttribute("join_id");				

		int check = cartDAO.checkOverlap(join_id,product_id);

		if(check!=0) {
			
			int cart_id = cartDAO.findSameCartID(join_id,product_id);
		
			cartDAO.changeQuantity(cart_id,cart_quantity);
			
			return "redirect:/product/article.action?product_id="+product_id;
		
		}
		
		CartDTO info = cartDAO.productInfo(product_id);	

		int cartMaxNum = cartDAO.getCartMaxNum();			
		
		dto.setCart_id(cartMaxNum+1);
		dto.setJoin_id(join_id);
		dto.setProduct_id(product_id);
		dto.setCart_quantity(cart_quantity);	
		
		dto.setProduct_subject(info.getProduct_subject());
		dto.setProduct_mainSaveFileName(info.getProduct_mainSaveFileName());
		dto.setProduct_price(info.getProduct_price());
		dto.setProduct_discount(info.getProduct_discount());
		dto.setProduct_resultPrice(info.getProduct_resultPrice());
		dto.setProduct_saleLimit(info.getProduct_saleLimit());
		
		cartDAO.insertCart(dto);
		
		int cartCount = cartDAO.getCartCount(join_id);
		
		session.setAttribute("cartCount", cartCount);

		return "redirect:/product/article.action?product_id="+product_id;
		
	}
	
	@RequestMapping(value = "/cart/list.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String cart_List(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		String old_url = request.getHeader("referer");
		String join_id = (String)session.getAttribute("join_id");

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		
		int currentPage = 1;
		 
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);

		//전체 검색된 아이디 수 
		int dataCount = cartDAO.getCartCount(join_id);	

		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	dataCount);

		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;

		List<CartDTO> lists = cartDAO.getCartList(start,end,join_id);

		Iterator<CartDTO> it = lists.iterator();	
		
		while(it.hasNext()) {
		
			CartDTO vo = it.next();
			int product_id = vo.getProduct_id();
			
			
			CartDTO cate =  cartDAO.getCategroy(product_id);
			
			vo.setProduct_firstSelect(cate.getProduct_firstSelect());
			vo.setProduct_secondSelect(cate.getProduct_secondSelect());
			vo.setProduct_lastSelect(cate.getProduct_lastSelect());
		
		}
		
		String listUrl = cp + "/cart/list.action";		 
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		//포워딩 될 페이지에 데이터를 넘긴다		 	
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("old_url", old_url);

		return "cart/list";
		
	}

	@RequestMapping(value = "/cart/cartDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartDelete(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		
		cartDAO.deleteCartID(cart_id);
		
		return "redirect:/cart/list.action";
		
	}

	@RequestMapping(value = "/cart/selectedZzim.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String selectedZzim(CartDTO dto,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String join_id = (String) session.getAttribute("join_id");
		int wishLength = Integer.parseInt(request.getParameter("wishLength"));
				
		String selectedProductKeies[] = request.getParameterValues("selectedProductKeies[]") ;	

		for (int i = 0; i < wishLength; i++) {
					
			int zzimProductId =  Integer.parseInt(selectedProductKeies[i]);
			
			CartDTO info = cartDAO.productInfo(zzimProductId);			
			int zzimMaxNum = cartDAO.getZzimMaxNum();	

			dto.setZzimList_id(zzimMaxNum+1);
			dto.setJoin_id(join_id);
			
			dto.setProduct_id(zzimProductId);			
			dto.setProduct_subject(info.getProduct_subject());
			dto.setProduct_mainSaveFileName(info.getProduct_mainSaveFileName());
			dto.setProduct_price(info.getProduct_price());
			dto.setProduct_discount(info.getProduct_discount());
			dto.setProduct_resultPrice(info.getProduct_resultPrice());
			
			cartDAO.insertZzim(dto);

		}

		return "";
		
	}
		
	@RequestMapping(value = "/cart/changeOrderCount.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String changeOrderCount(HttpSession session,HttpServletRequest request, HttpServletResponse response) {

		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		
		cartDAO.changeQuantity(cart_id,cart_quantity);

		return "redirect:/cart/list.action";
	}	
	
	@RequestMapping(value = "/cart/allCartDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String allCartDelete(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		int deleteLength = Integer.parseInt(request.getParameter("deleteLength"));
	
		String selectedCartIds[] = request.getParameterValues("selectedCartIds[]") ;	

		
		for (int i = 0; i < deleteLength; i++) {
			
			int cart_id =  Integer.parseInt(selectedCartIds[i]);				
			
			cartDAO.deleteCartID(cart_id);			
			
		}

		String reload = "reload";
		
		request.setAttribute("reload", reload);
		
		return "/cart/list.action";
		
	}

}
