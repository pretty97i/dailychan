package com.chan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chan.dao.MainDAO;
import com.chan.dao.ProductDAO;
import com.chan.dto.MainDTO;
import com.chan.dto.ProductDTO;
import com.chan.dto.RecipeDTO;
import com.chan.util.MyUtil;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("mainDAO")
	MainDAO mainDAO;
	
	@Autowired
	@Qualifier("productDAO")
	ProductDAO productDAO;
	
	@Autowired
	@Qualifier("kakaoLogin")
	KakaoController kakaoLogin;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/main.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(HttpSession session,HttpServletRequest request) {	
		
		//카카오
		String url = kakaoLogin.getAuthorizationUrl(session);
		
		session.setAttribute("url", url);
		
		
		RecipeDTO mainFirstRecipe =	mainDAO.getMainRecipeFirst();
		RecipeDTO mainSecondRecipe = mainDAO.getMainRecipeSecond();
		
		String join_id = (String)session.getAttribute("join_id");
		
		int recommandCount = productDAO.recommandCount(join_id);
			
		List<MainDTO> noticeLists = mainDAO.noticeList();
		List<MainDTO> recommendLists = mainDAO.mainRecommandLists();
		//list로 올리게 해야암-- 오!감동---
		List<MainDTO> ohLists = mainDAO.Oimpression();
		
		if(join_id != null) {
			List<ProductDTO> userRecommandLists = productDAO.userRecommandList(join_id);
			request.setAttribute("userRecommandLists", userRecommandLists);
		}

		request.setAttribute("ohLists", ohLists);

		request.setAttribute("recommandCount", recommandCount);
		request.setAttribute("noticeLists", noticeLists);
		request.setAttribute("recommendLists", recommendLists);
		
		request.setAttribute("mainFirstRecipe", mainFirstRecipe);
		request.setAttribute("mainSecondRecipe", mainSecondRecipe);
		
		return "main";
		
	}
	
	@RequestMapping(value = "/main/bestList.action", method =  {RequestMethod.GET,RequestMethod.POST})
	public String faqbox(MainDTO dto,HttpServletRequest request) throws Exception{
		
		int tabIdx = Integer.parseInt(request.getParameter("tabIdx"));
		String secondSelect = null;
		
		if(tabIdx==1) {
			secondSelect = "농산물";
		}else if(tabIdx==2) {
			secondSelect = "축산물";
		}else if(tabIdx==3) {
			secondSelect = "수산물";
		}else {
			secondSelect = "양념류";
		}

		List<MainDTO> lists=mainDAO.getBestList(secondSelect);
		
		request.setAttribute("tabIdx", tabIdx);
		request.setAttribute("bestLists", lists);
	
		return "main/mainBest";
	}

	@RequestMapping(value = "/searchPage.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPage(ProductDTO dto,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/product");
		String cp = request.getContextPath();
		String sort = request.getParameter("sort");
		String direction = request.getParameter("direction");
		
		String categoryId = request.getParameter("categoryId");	
		String pageNum = request.getParameter("pageNum");
		

		
		if(sort==null) {
			
			sort = "product_id";
			
		}
		
		if(direction==null) {
			
			direction = "desc";
			
		}
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		
		String keyword = request.getParameter("keyword");

		if(keyword != null){
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		

		//전체데이터갯수
		int dataCount = productDAO.searchProductDatacount(keyword);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ProductDTO> searchLists = productDAO.searchProduct(start, end, keyword, sort, direction);
		
		
		Iterator<ProductDTO> it = searchLists.iterator();
		
		if(searchLists!=null) {

			while(it.hasNext()) {

				dto = it.next();

				dto.setProduct_id(dto.getProduct_id());
				dto.setPrice(myUtil.toNumFormat(dto.getProduct_price()));
				dto.setResult_price(myUtil.toNumFormat(dto.getProduct_resultPrice()));
				dto.setProduct_discount(dto.getProduct_discount());
				dto.setProduct_subject(dto.getProduct_subject());
				dto.setProduct_mainSaveFileName(dto.getProduct_mainSaveFileName());
				dto.setProductDetail_name(dto.getProductDetail_name());
				dto.setProductDetail_configuration(dto.getProductDetail_configuration());
				dto.setProduct_firstSelect(dto.getProduct_firstSelect());
				dto.setProduct_secondSelect(dto.getProduct_secondSelect());
				dto.setProduct_lastSelect(dto.getProduct_lastSelect());
				
			}

		}
		
		//페이징 처리
		String param = "";
		
		if(keyword!=null){
			param += "keyword=" + URLEncoder.encode(keyword,"UTF-8");
		}
		
		String listUrl = cp + "/searchPage.action";
		if(!param.equals("")){
			listUrl +=  "?" + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("searchLists", searchLists);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("listUrl", listUrl);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("sort", sort);
		request.setAttribute("direction", direction);
		
		
		return "product/search/searchPage";
	} 
	
	@RequestMapping(value = "/right.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String right(ProductDTO dto,HttpServletRequest request,HttpSession session,HttpServletResponse response) {

			Cookie[] cookies = request.getCookies();
			int product_count = 1;
			int page_count = 1;
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			List<ProductDTO> cookieLists1 = new ArrayList<ProductDTO>();

			for (Cookie cookie:cookies) {
				
				 if(cookie.getName().indexOf("idx")!=-1){
					 
						int product_id = Integer.parseInt(cookie.getValue());			
						
						dto = productDAO.cookieList(product_id);
						dto.setProduct_count(product_count);
						dto.setPage_count(page_count);
						
						cookieLists1.add(dto);
						
						product_count = product_count + 1;

						if(cookieLists1.size()==0) {
							session.removeAttribute("cookieLists");
							session.invalidate();
											
						}
						
				 }
				 
				 if(product_count==4) {
					 
					 product_count = 1;
					 page_count++;
					 
				 }

			}
			
			List<ProductDTO> cookieLists = new ArrayList<ProductDTO>();
			Iterator<ProductDTO> it = cookieLists1.iterator();
			
			while(it.hasNext()) {

				ProductDTO vo = it.next();
				
				if(currentPage==vo.getPage_count()) {
					vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
					cookieLists.add(vo);
				}
				
			}
			
			//전체페이지수
			int totalPage = dto.getPage_count();
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			String listUrl = "/dailychan/right.action";
			
			String pageIndexList =	myUtil.quickPageIndexList(currentPage, totalPage, listUrl, "quickPage");
			
			request.setAttribute("cookieLists", cookieLists);
			request.setAttribute("pageNum", currentPage);
			request.setAttribute("cookiePageList", pageIndexList);
		
		return "rightSub";
		
	}
	
	//===========배너===========
	@RequestMapping(value = "/ecoService.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String test(Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		return "main/ecoService";
		
	}

}
