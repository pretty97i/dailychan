package com.chan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.chan.dao.ProductDAO;
import com.chan.dto.ProductDTO;
import com.chan.util.MyUtil;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("productDAO")
	ProductDAO productDAO;

	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/product/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productList(Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/product");
		String cp = request.getContextPath();
		
		String sort = request.getParameter("sort");
		String direction = request.getParameter("direction");
		
		String categoryId = request.getParameter("categoryId");
		
		String firstSelect = request.getParameter("firstSelect");
		String secondSelect = request.getParameter("secondSelect");
		String lastSelect = request.getParameter("lastSelect");
		
		String page = request.getParameter("page");
		
		int numPerPage = 8;
		
		if(sort==null) {
			
			sort = "product_id";
			
		}
		
		if(direction==null) {
			
			direction = "desc";
			
		}
		
		
		if(firstSelect!=null) {
			
			firstSelect = URLDecoder.decode(firstSelect, "UTF-8");
			
		}
		
		
		if(secondSelect!=null) {
			
			secondSelect = URLDecoder.decode(secondSelect, "UTF-8");
			
		}else {
			
			secondSelect = "";
			
		}
		
		if(lastSelect!=null) {
			
			lastSelect = URLDecoder.decode(lastSelect, "UTF-8");
			
		}else {
			
			lastSelect = "";
			
		}
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue != null){
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = productDAO.getDataCount(searchValue, firstSelect, secondSelect, lastSelect);
		
		//전체페이지수
		if(page!=null ) {
		
			numPerPage = Integer.parseInt(page);
			
		}
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ProductDTO> lists = productDAO.getList(start, end, searchValue, firstSelect, secondSelect, lastSelect, sort, direction);
		List<ProductDTO> lists2 = productDAO.getBestList(secondSelect, lastSelect);
		List<ProductDTO> lists3 = productDAO.getMenuList(firstSelect, secondSelect);

		Iterator<ProductDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			ProductDTO vo = it.next();
			
			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			vo.setProduct_firstSelect(URLEncoder.encode(vo.getProduct_firstSelect(),"UTF-8"));
			vo.setProduct_secondSelect(URLEncoder.encode(vo.getProduct_secondSelect(),"UTF-8"));
			vo.setProduct_lastSelect(URLEncoder.encode(vo.getProduct_lastSelect(),"UTF-8"));
			
		}
		
		Iterator<ProductDTO> it2 = lists2.iterator();
		
		int i = 1;
		
		while(it2.hasNext()) {

			ProductDTO vo2 = it2.next();
			
			vo2.setBestNum("0" + Integer.toString(i));
			vo2.setPrice(myUtil.toNumFormat(vo2.getProduct_price()));
			vo2.setResult_price(myUtil.toNumFormat(vo2.getProduct_resultPrice()));
			
			i++;
			
		}
		
		//페이징 처리
		String param = "";
		
		if(searchValue!=null){
			param = "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
		}
		
		String url = cp + "/product/list.action?firstSelect=" + firstSelect + "&secondSelect=" + secondSelect;
		url += "&lastSelect=" + lastSelect + "&categoryId=" + categoryId;
		
		String listUrl = cp + "/product/list.action?firstSelect=" + firstSelect + "&secondSelect=" + secondSelect;
		listUrl += "&lastSelect=" + lastSelect + "&categoryId=" + categoryId;
		
		if(sort!=null) {
			listUrl += "&sort=" + sort + "&direction=" + direction;
		}
		
		if(page!=null) {
			listUrl += "&page=" + page;
		}
		
		if(!param.equals("")){
			listUrl = listUrl + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("sort", sort);
		request.setAttribute("direction", direction);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("lists", lists);
		request.setAttribute("lists2", lists2);
		request.setAttribute("lists3", lists3);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("listUrl", url);
		request.setAttribute("firstSelect", firstSelect);
		request.setAttribute("secondSelect", secondSelect);
		request.setAttribute("lastSelect", lastSelect);
		request.setAttribute("numPerPage", numPerPage);
		
		return "product/list/mainList";
		
	}
	
	@RequestMapping(value = "/product/article.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String article(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		ProductDTO dto = null;
		
		String join_id = request.getParameter("join_id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		dto = productDAO.getReadData(product_id);
		int product_resultPrice = dto.getProduct_resultPrice();

		int saleLimit = dto.getProduct_saleLimit();
		
		dto.setPrice(myUtil.toNumFormat(dto.getProduct_price()));
		dto.setResult_price(myUtil.toNumFormat(dto.getProduct_resultPrice()));
		
		String firstSelect = request.getParameter("firstSelect");
		String secondSelect = request.getParameter("secondSelect");
		String lastSelect = request.getParameter("lastSelect");
		
		String mdParam ="";
		
		if(firstSelect!=null) {
			
			firstSelect = URLDecoder.decode(firstSelect, "UTF-8");
			mdParam = "&firstSelect=" + firstSelect;
			
		}
		
		
		if(secondSelect!=null) {
			
			secondSelect = URLDecoder.decode(secondSelect, "UTF-8");
			mdParam += "&secondSelect=" + secondSelect;
			
		}else {
			
			secondSelect = "";
			
		}
		
		
		if(lastSelect!=null) {
			
			lastSelect = URLDecoder.decode(lastSelect, "UTF-8");
			mdParam += "&lastSelect=" + lastSelect;
			
		}else {
			
			lastSelect = "";
			
		}
		
		String idx=Integer.toString(product_id);
		
		Cookie setCookie = new Cookie("idx"+idx, idx);
		
		setCookie.setMaxAge(60*60);
		setCookie.setPath("/");
		response.addCookie(setCookie);
		
		int dataCount = productDAO.getQnaDataCount(product_id);
		
		//md추천******************************************
		int end=6;
		
		List<ProductDTO> mdSelect=productDAO.mdSelect(firstSelect, secondSelect, lastSelect, end,product_id);

		request.setAttribute("mdSelect", mdSelect);
		request.setAttribute("mdParam", mdParam);
		
		//md추천******************************************

		request.setAttribute("saleLimit", saleLimit);
		request.setAttribute("firstSelect", firstSelect);
		request.setAttribute("secondSelect", secondSelect);
		request.setAttribute("lastSelect", lastSelect);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("dto", dto);
		request.setAttribute("product_id", product_id);
		request.setAttribute("join_id", join_id);
		request.setAttribute("product_resultPrice", product_resultPrice);
		
		return "product/list/article";
		
	}
	
	@RequestMapping(value = "/p_qna/insert.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productQuestionInsert(ProductDTO dto, Model model,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		dto.setJoin_id((String)session.getAttribute("join_id"));
		dto.setProductQuestion_id(productDAO.getMaxProductQnaId() + 1);

		if(dto.getProductQuestion_secret()==null || dto.getProductQuestion_secret().equals(null)) {
			dto.setProductQuestion_secret("0");
		}else if(dto.getProductQuestion_secret().equals("secret")) {
			dto.setProductQuestion_secret("1");
		}
		
		productDAO.productQnaInsertData(dto);

		return "redirect:/p_qna/list.action?product_id=" + dto.getProduct_id() + "&mode=all";
		
	}
	
	@RequestMapping(value = "/p_qna/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productQuestionList(ProductDTO dto, Model model,HttpServletRequest request,
			HttpSession session) throws UnsupportedEncodingException {
		
		String function = null;
		String pageIndexList = null;
		String mode = request.getParameter("mode");
		String join_id = request.getParameter("join_id");
		String qnaPageNum = request.getParameter("qnaPageNum");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int dataCount = 0;
		
		List<ProductDTO> lists = null;
		
		int currentPage = 1;
		
		if(qnaPageNum != null)
			currentPage = Integer.parseInt(qnaPageNum);

		if(mode.equals("all")) {
			
			dataCount = productDAO.getQnaDataCount(product_id);
			
		}else {
			
			dataCount = productDAO.getQnaMyDataCount(join_id,product_id);
			
		}
		
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		String listUrl = "/dailychan/p_qna/listAll.action";
		
		if(mode.equals("all")) {
			
			function = "productQnaAllList";
			lists = productDAO.getQnaList(start, end, product_id);
			pageIndexList =
					myUtil.qnaPageIndexList(currentPage, totalPage, listUrl, function, product_id);
			
		}else {
			
			function = "productQnaMyList";
			lists = productDAO.getQnaMyList(start, end, product_id, join_id);
			pageIndexList =
					myUtil.qnaPageIndexMyList(currentPage, totalPage, listUrl, function, product_id, join_id);
			
		}
		
		Iterator<ProductDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			ProductDTO vo = it.next();
			ProductDTO vo2 = productDAO.getAnswerList(vo.getProductQuestion_id());
			vo.setProductQuestion_content(vo.getProductQuestion_content().replaceAll("\n", "<br/>"));
			
			if(vo2!=null) {
				vo.setProductAnswer_created(vo2.getProductAnswer_created());
				vo.setProductAnswer_content(vo2.getProductAnswer_content().replaceAll("\n", "<br/>"));
				vo.setMode("1");
			}
			
		}
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("id", join_id);
		
		return "product/list/qnaList";
		
	}
	
	@RequestMapping(value = "/review/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productReviewList(ProductDTO dto, Model model,HttpServletRequest request,
			HttpSession session) throws UnsupportedEncodingException {
		
		String function = "productReviewList";
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int dataCount = 0;
		List<ProductDTO> lists = null;
		
		if(dto.getMode().equals("all")) {
			
			dataCount = productDAO.getReviewAllCount(product_id);

		}else {
			
			dataCount = productDAO.getReviewPhotoCount(product_id);
			
		}

		int currentPage = 1;
		
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		if(dto.getMode().equals("all")) {
			
			lists = productDAO.getReviewAllList(start, end, product_id);
		
		}else {
			
			lists = productDAO.getReviewPhotoList(start, end, product_id);
			
		}
		
		
		String listUrl = "";
		
		String pageIndexList = myUtil.qnaPageIndexList(currentPage, totalPage, listUrl, function, product_id);
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		
		return "product/review/reviewList";
		
	}
	
	@RequestMapping(value = "/review/bestReviewList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String bestReviewList(ProductDTO dto, Model model,HttpServletRequest request,
			HttpSession session) throws UnsupportedEncodingException {
		
		String pageNum = request.getParameter("pageNum");
		
		int dataCount = productDAO.bestReviewCount();
		
		int currentPage = 1;
		
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<ProductDTO> lists = productDAO.bestReviewList(start, end);
		
		Iterator<ProductDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			ProductDTO vo = it.next();
			ProductDTO vo2 = productDAO.bestReviewProductData(vo.getProduct_id());
			
			vo.setBestReview_content(vo.getBestReview_content().replaceAll("\n", "<br/>"));
			vo.setProduct_mainSaveFileName(vo2.getProduct_mainSaveFileName());
			vo.setProduct_subject(vo2.getProduct_subject());
			vo.setProduct_firstSelect(vo2.getProduct_firstSelect());
			vo.setProduct_secondSelect(vo2.getProduct_secondSelect());
			vo.setProduct_lastSelect(vo2.getProduct_lastSelect());
			
			String mdParam ="";
			
			if(vo.getProduct_firstSelect()!=null) {
				
				mdParam = "&firstSelect=" +vo.getProduct_firstSelect();
				
			}
			
			
			if(vo.getProduct_secondSelect()!=null) {
				
				mdParam += "&secondSelect=" + vo.getProduct_secondSelect();
				
			}			
			
			if(vo.getProduct_lastSelect()!=null) {
				
				mdParam += "&lastSelect=" + vo.getProduct_lastSelect();
				
			}
			
			vo.setBestParams(mdParam);

		}
		
		String listUrl = "";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		
		return "product/review/bestReviewList";
		
	}
	
	@RequestMapping(value = "/product/zzim.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String zzimList(ProductDTO dto,HttpServletRequest request) throws UnsupportedEncodingException {

		ProductDTO vo = productDAO.getReadData(dto.getProduct_id());
		vo.setJoin_id(dto.getJoin_id());
		
		productDAO.zzimListInsert(vo);
		
		return "";
		
	}
	
	@RequestMapping(value = "/product/qnaDataCount.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody public String qnaDataCount(ProductDTO dto,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String qnaDataCount = null;
		
		if(dto.getMode().equals("all")) {
			
			qnaDataCount = Integer.toString(productDAO.getQnaDataCount(dto.getProduct_id()));
			
		}else {
			
			qnaDataCount = Integer.toString(productDAO.getQnaMyDataCount(dto.getJoin_id(),dto.getProduct_id()));
			
		}
		
		qnaDataCount = myUtil.toNumFormat(Integer.parseInt(qnaDataCount));
		
		return qnaDataCount;
		
	}
	
	@RequestMapping(value = "/product/reviewDataCount.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody public String reviewDataCount(ProductDTO dto,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String reviewDataCount = null;
		
		if(dto.getMode().equals("all")) {
			reviewDataCount = Integer.toString(productDAO.getReviewAllCount(dto.getProduct_id()));
		}else {
			reviewDataCount = Integer.toString(productDAO.getReviewPhotoCount(dto.getProduct_id()));
		}

		reviewDataCount = myUtil.toNumFormat(Integer.parseInt(reviewDataCount));
		
		return reviewDataCount;
		
	}
	
	//=================event================

	@RequestMapping(value = "/product/event/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String eventList(HttpServletRequest request,HttpServletResponse response,
			HttpSession session) throws UnsupportedEncodingException {
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/product");
		String cp = request.getContextPath();
		String join_id = null;

		String sort = request.getParameter("sort");
		String direction = request.getParameter("direction");
		
		String categoryId = request.getParameter("categoryId");
		
		String firstSelect = request.getParameter("firstSelect");
		String secondSelect = request.getParameter("secondSelect");
		
		String page = request.getParameter("page");
		
		int numPerPage = 8;
		
		if(sort==null) {
			
			sort = "product_id";
			
		}
		
		if(direction==null) {
			
			direction = "desc";
			
		}
		
		
		if(firstSelect!=null) {
			
			firstSelect = URLDecoder.decode(firstSelect, "UTF-8");
			
		}
		
		
		if(secondSelect!=null) {
			
			secondSelect = URLDecoder.decode(secondSelect, "UTF-8");
			
		}else {
			
			secondSelect = "";
			
		}
		
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue != null){
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = productDAO.getEventDataCount(searchValue, firstSelect, secondSelect);
		
		//전체페이지수
		if(page!=null ) {
		
			numPerPage = Integer.parseInt(page);
			
		}
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ProductDTO> lists = productDAO.getEventLists(start, end, searchValue, firstSelect, secondSelect, sort, direction);
		//List<ProductDTO> lists2 = productDAO.getBestList(secondSelect);
		List<ProductDTO> lists3 = productDAO.getOtherMenuLists(firstSelect);

		Iterator<ProductDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			ProductDTO vo = it.next();
			
			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			vo.setProduct_firstSelect(URLEncoder.encode(vo.getProduct_firstSelect(),"UTF-8"));
			vo.setProduct_secondSelect(URLEncoder.encode(vo.getProduct_secondSelect(),"UTF-8"));
			
		}
		/*
		Cookie setCookie = new Cookie("idx"+idx, product_subject);
		
		setCookie.setMaxAge(60*60*24);
		setCookie.setPath("/");
		response.addCookie(setCookie);
		
		Cookie[] cookies = request.getCookies();
		
		for (Cookie cookie:cookies) {
			System.out.println("쿠키명 : " + cookie.getName());
			System.out.println("쿠키값 : " + cookie.getValue());	
		}
	   */
		//페이징 처리
		String param = "";
		
		if(searchValue!=null){
			param = "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
		}
		
		String listUrl = cp + "/product/event/list.action?firstSelect=" + firstSelect + "&secondSelect=" + secondSelect;
		listUrl += "&categoryId=" + categoryId;
		
		if(!param.equals("")){
			listUrl = listUrl + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("sort", sort);
		request.setAttribute("direction", direction);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("lists", lists);
		request.setAttribute("lists3", lists3);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("listUrl", listUrl);
		request.setAttribute("firstSelect", firstSelect);
		request.setAttribute("secondSelect", secondSelect);
		request.setAttribute("numPerPage", numPerPage);
		
		if(secondSelect.equals("고객추천")) {
			
			join_id = (String)session.getAttribute("join_id");

			int recommandCount = productDAO.recommandCount(join_id);
			List<ProductDTO> userRecommandLists = productDAO.userRecommandList(join_id);
			List<ProductDTO> bestRecommandLists = productDAO.bestProductRecommandLists();
			List<ProductDTO> recommandLists = productDAO.productRecommandLists();
			List<ProductDTO> menulists = productDAO.getOtherMenuLists(firstSelect);
			
			request.setAttribute("recommandLists", recommandLists);
			request.setAttribute("bestRecommandLists", bestRecommandLists);
			request.setAttribute("userRecommandLists", userRecommandLists);
			request.setAttribute("menulists", menulists);
			request.setAttribute("recommandCount", recommandCount);
			
			return "event/list/productRecommand";
			
		}
		
		return "event/list/mainList";

	}

	@RequestMapping(value = "/product/origin/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String originList(Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/product");
		String cp = request.getContextPath();
		
		String firstSelect = request.getParameter("firstSelect");
		
		String page = request.getParameter("page");
		
		String reviewDataCount = null;
		
		int numPerPage = 9;

		if(firstSelect!=null) {
			
			firstSelect = URLDecoder.decode(firstSelect, "UTF-8");
			
		}
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue != null){
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = productDAO.getEtcDataCount(searchValue, firstSelect);
		
		//전체페이지수
		if(page!=null ) {
		
			numPerPage = Integer.parseInt(page);
			
		}
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<ProductDTO> lists = productDAO.getOriginLists(start, end, searchValue, firstSelect);
		Iterator<ProductDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			ProductDTO vo = it.next();
			
			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			vo.setProduct_discount(vo.getProduct_discount());
			vo.setProduct_subject(vo.getProduct_subject());
			vo.setProduct_mainSaveFileName(vo.getProduct_mainSaveFileName());
			vo.setProduct_firstSelect(URLEncoder.encode(vo.getProduct_firstSelect(),"UTF-8"));
			
			reviewDataCount = Integer.toString(productDAO.getReviewAllCount(vo.getProduct_id()));			
			reviewDataCount = myUtil.toNumFormat(Integer.parseInt(reviewDataCount));
			
			vo.setReviewDataCount(reviewDataCount);	
			
		}
	
		//페이징 처리
		String param = "";
		
		if(searchValue!=null){
			param = "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
		}
		
		String listUrl = cp + "/product/origin/list.action?firstSelect=" + firstSelect;
		
		if(!param.equals("")){
			listUrl = listUrl + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다

		//request.setAttribute("categoryId", categoryId);
		request.setAttribute("lists", lists);
		//request.setAttribute("lists2", lists2);
		//request.setAttribute("lists3", lists3);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("listUrl", listUrl);
		request.setAttribute("firstSelect", firstSelect);

		request.setAttribute("numPerPage", numPerPage);
		
		return "origin/mainList";

	}
	
	@RequestMapping(value = "/event/eventMain.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String event(Locale locale, Model model) {
		
		return "event/eventMain";
		
	}
	
	@RequestMapping(value = "/product/best.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String best(Locale locale, Model model,HttpServletRequest request) {

		List<ProductDTO> best5Lists = productDAO.getBest5ProductList();
		List<ProductDTO> bestLists = productDAO.getBestProductList();
		
		Iterator<ProductDTO> it = best5Lists.iterator();
		
		String reviewDataCount = null;

		int i = 1;
		
		while(it.hasNext()) {

			ProductDTO vo = it.next();
			
			vo.setBestNum("0" + Integer.toString(i));	
			
			reviewDataCount = Integer.toString(productDAO.getReviewAllCount(vo.getProduct_id()));			
			reviewDataCount = myUtil.toNumFormat(Integer.parseInt(reviewDataCount));
			
			vo.setReviewDataCount(reviewDataCount);
			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			
			i++;
			
		}
		
		Iterator<ProductDTO> it2 = bestLists.iterator();
		
		int i2 = 6;
		
		while(it2.hasNext()) {

			ProductDTO vo2 = it2.next();
			
			vo2.setBestNum("0" + Integer.toString(i2));	
			
			reviewDataCount = Integer.toString(productDAO.getReviewAllCount(vo2.getProduct_id()));			
			reviewDataCount = myUtil.toNumFormat(Integer.parseInt(reviewDataCount));
			
			vo2.setReviewDataCount(reviewDataCount);			
			vo2.setPrice(myUtil.toNumFormat(vo2.getProduct_price()));
			vo2.setResult_price(myUtil.toNumFormat(vo2.getProduct_resultPrice()));
			
			i2++;
			
		}
		
		request.setAttribute("best5Lists", best5Lists);
		request.setAttribute("bestLists", bestLists);
		
		return "product/best/mainList";
		
	}
	
	@RequestMapping(value = "/product/event/insertProductRecommand.action")
	public String insertProductRecommand(HttpServletRequest request,HttpSession session,ProductDTO dto) {
	
		String join_id = (String) session.getAttribute("join_id");
		
		productDAO.insertProductRecommand(join_id, dto.getProduct_id(),
				dto.getProduct_subject(), dto.getProductRecommand_reason());
		productDAO.updateProductRecommand(dto.getProduct_id());
		
		return "";
		
	}
	
}
