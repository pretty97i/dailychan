package com.chan.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chan.dao.CartDAO;
import com.chan.dao.MyPageDAO;
import com.chan.dao.OrderDAO;
import com.chan.dto.CartDTO;
import com.chan.dto.MyPageDTO;
import com.chan.dto.OrderDTO;
import com.chan.util.MyUtil;

@Controller
public class MyPageController {

	@Autowired
	@Qualifier("MyPageDAO")
	MyPageDAO dao;
	
	@Autowired
	@Qualifier("cartDAO")
	CartDAO cartDAO;
	
	@Autowired
	@Qualifier("orderDAO")
	OrderDAO orderDAO;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/myPage/main.action")
	public String mypageMain(HttpServletRequest request,HttpSession session) throws Exception{
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int orderDataCount = dao.getOrderCount(join_id);
		int qnaDataCount = dao.getQnaCount(join_id);
		int couponDataCount = dao.getCouponData(join_id);
		int frequencyDataCount = dao.getProductCount(join_id);
		int zzimDataCount = dao.getZzimCount(join_id);
		
		List<MyPageDTO> orderList = dao.getRecentOrderList(join_id);
		List<MyPageDTO> frequencyList = dao.getMainFrequencyList(join_id);
		List<MyPageDTO> zzimList = dao.getMainZzimList(join_id);
		
		Iterator<MyPageDTO> it = orderList.iterator();
		
		while(it.hasNext()) {

			MyPageDTO vo = it.next();

			vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
			
		}
		
		Iterator<MyPageDTO> it2 = frequencyList.iterator();
		
		while(it2.hasNext()) {

			MyPageDTO vo = it2.next();

			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setDiscount_price(myUtil.toNumFormat(vo.getProduct_price()-vo.getProduct_resultPrice()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			
		}
		
		Iterator<MyPageDTO> it3 = zzimList.iterator();
		
		while(it3.hasNext()) {

			MyPageDTO vo = it3.next();

			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setDiscount_price(myUtil.toNumFormat(vo.getProduct_price()-vo.getProduct_resultPrice()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			
		}
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("zzimList", zzimList);
		request.setAttribute("frequencyList", frequencyList);
		
		request.setAttribute("zzimDataCount", zzimDataCount);
		request.setAttribute("frequencyDataCount", frequencyDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("couponDataCount", couponDataCount);
		request.setAttribute("dto", dto);
		
		return "mypage/main";
	}
	
	@RequestMapping(value = "/myPage/orderList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageOrderList(HttpSession session,HttpServletRequest request,HttpServletResponse response) {

		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String cp = request.getContextPath();
		
		MyPageDTO dto = dao.getJoinData(join_id);
		
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getOrderCount(join_id);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage,dataCount );
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getOrderList(join_id, start, end);
		
		Iterator<MyPageDTO> it = lists.iterator();
		
		while(it.hasNext()) {

			MyPageDTO vo = it.next();

			vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
			
		}
		
		String listUrl = cp + "/myPage/orderList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/order/orderList";
	}
	
	@RequestMapping(value = "/myPage/cancelOrder.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCancelOrder(HttpSession session,HttpServletRequest request) {
		
		String join_id = (String) session.getAttribute("join_id");
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		
		dao.getOrderApply(join_id, orderList_id, 0);
		
		return "mypage/order/orderList";
	}
	
	@RequestMapping(value = "/myPage/refundOrder.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageRefundOrder(HttpSession session,HttpServletRequest request) {
		
		String join_id = (String) session.getAttribute("join_id");
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		
		dao.getOrderApply(join_id, orderList_id, 7);
		
		return "mypage/order/orderList";
		
	}
	
	@RequestMapping(value = "/myPage/pointList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypagePointList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		String accGubun = request.getParameter("accGubun");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		int dataCount = 0;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		if(accGubun=="M" || accGubun.equals("M")) {
			
			dataCount = dao.getPointDataCount(join_id);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getPointList(join_id, start, end);
			request.setAttribute("MLists", lists);
			
			String listUrl = cp + "/myPage/pointList.action?accGubun=" + accGubun;		
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList",pageIndexList);
			
		}else if(accGubun=="A" || accGubun.equals("A")) {
			
			dataCount = dao.getPointUseDataCount(join_id, 1);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getPointUseList(join_id,1, start, end);
			request.setAttribute("ALists", lists);
			
			String listUrl = cp + "/myPage/pointList.action?accGubun=" + accGubun;		
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList",pageIndexList);
			
		}else if(accGubun=="U" || accGubun.equals("U")) {
			
			dataCount = dao.getPointUseDataCount(join_id, 0);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getPointUseList(join_id,0, start, end);
			request.setAttribute("ULists", lists);
			
			String listUrl = cp + "/myPage/pointList.action?accGubun=" + accGubun;		
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList",pageIndexList);
			
		}
			
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		request.setAttribute("accGubun", accGubun);
		request.setAttribute("dataCount", dataCount);
		
		return "mypage/point/pointList";
	}
	
	@RequestMapping(value = "/myPage/productQnaList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageProductQnaList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);
		
		int questionCount = dao.getProductQuestionCount(join_id);

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, questionCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getProductQuestionList(join_id,start,end);
		
		String listUrl = cp + "/myPage/productQuestion";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		Iterator<MyPageDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			MyPageDTO vo = it.next();
			MyPageDTO vo2 = dao.getAnswerList(vo.getProductQuestion_id());
			vo.setProductQuestion_content(vo.getProductQuestion_content().replaceAll("\n", "<br/>"));
			
			if(vo2!=null) {
				vo.setProductAnswer_created(vo2.getProductAnswer_created());
				vo.setProductAnswer_content(vo2.getProductAnswer_content().replaceAll("\n", "<br/>"));
			}
			
		}
		
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("questionCount", questionCount);
		request.setAttribute("lists", lists);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/productQna/productQnaList";
	}
	
	@RequestMapping(value = "/myPage/removeProductQna.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String mypageProductQnaDelete(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		int productQuestion_id = Integer.parseInt(request.getParameter("productQuestion_id"));
		
		dao.getProductQuestionDelete(join_id, productQuestion_id);
		
		String message = "삭제 완료!!";
		
		return message;
	}
	
	@RequestMapping(value = "/myPage/qnaList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageQnaList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(join_id);
		int consultingSu = dao.getConsultingData(join_id);
		int coupon = dao.getCouponData(join_id);
		
		int qnaCount = dao.getQnaCount(join_id);

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, qnaCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getQnaList(join_id,start,end);
		
		String listUrl = cp + "/myPage/qnaList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/myPage/qnaArticle.action?pageNum=" + currentPage;
		
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("pageIndexList",pageIndexList);		
		request.setAttribute("qnaCount", qnaCount);
		request.setAttribute("lists", lists);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/qna/qnaList";
	}
	
	@RequestMapping(value = "/myPage/qnaRegister.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageQnaRegister(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(join_id);
		int consultingSu = dao.getConsultingData(join_id);
		int coupon = dao.getCouponData(join_id);
		
		List<MyPageDTO> orderList = dao.getRecentOrderList(join_id);
		List<MyPageDTO> frequencyList = dao.getMainFrequencyList(join_id);
		List<MyPageDTO> zzimList = dao.getMainZzimList(join_id);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("zzimList", zzimList);
		request.setAttribute("frequencyList", frequencyList);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/qna/qnaRegister";
		
	}
	
	@RequestMapping(value = "/myPage/qnaRegister_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaregister_ok(HttpSession session,MyPageDTO dto,MultipartHttpServletRequest request,Locale locale, Model model) {
		
		String qna_select=request.getParameter("qna_select");
		String qna_type=request.getParameter("qna_type");
		
		String qna_state="미답변";
	
		int maxNum = dao.qnaMaxNum();

		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "qna" + File.separator;

		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}

		Iterator<String> iterator = request.getFileNames();
		
		int i = 0;
		
			i++;
			String uploadFileName = iterator.next(); 
			//next()를 해주면 커서가 움직여서 iterator안에 들어있는 요소. 즉 여기서는 name을 가져온다.

			MultipartFile mFile = request.getFile(uploadFileName);
			//file생성
			
			String saveFileName = mFile.getOriginalFilename();
			//파일이름
			
			if (saveFileName != null && !saveFileName.equals("")) {

				//저장할 파일의 이름을 겹치지 않게 해주기위해
				//날짜시간으로 이름을 만들어준다.
				//Calendar객체에서 현재날짜시간을 받아서
				//SimpleDateFormat를 이용해 원하는 모양으로 바꿈
				//yyyy:년 MM:월 dd:일 HH:시 mm:분 ss:초
				//extension은 확장자명이다. ex)png, jpg....
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmss-" + i);
				Calendar now = Calendar.getInstance();
				
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "." + extension;
				//saveFileName에 날짜+.+확장자명으로 저장시킴.
				
				try {
								
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
				}
			}

		String qna_store=request.getParameter("qna_store");
		String qna_content=request.getParameter("qna_content");
		qna_content=qna_content.replace("\r\n", "<br>");

		if(qna_type.equals("2")) {			
			
			dto.setQna_store(qna_store);
			dto.setQna_type("매장에 직접문의");			
			
		}else {
			if(qna_store==null) {
				dto.setQna_type("일반문의");
				dto.setQna_store("");
			}
		}

		dto.setQna_saveFileName(saveFileName);
		dto.setQna_id(maxNum+1);
		dto.setQna_select(qna_select);
		dto.setQna_content(qna_content);
		dto.setQna_state(qna_state);
		dto.setJoin_id((String)session.getAttribute("join_id"));

		dao.insertqna(dto);	
		
		request.setAttribute("path", path);
		request.setAttribute("saveFileName",  saveFileName);		
		
		return "redirect:/myPage/qnaList.action"; 
	}
	
	@RequestMapping(value = "/myPage/qnaArticle.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaArticle(HttpSession session,MyPageDTO dto,HttpServletRequest request,Locale locale, Model model) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "recipe" + File.separator;
		
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String pageNum = request.getParameter("pageNum");		
		
		dto = dao.qnaGetReadData(qna_id);	

		String param = "?pageNum=" + pageNum;
	
		request.setAttribute("dto",dto);
		request.setAttribute("param",param);
		request.setAttribute("path",path);
		request.setAttribute("saveFileName",dto.getQna_saveFileName());

		request.setAttribute("qna_id", qna_id);		
		
		return "mypage/qna/qnaArticle";
		
	}
	
	@RequestMapping(value = "/myPage/removeQna.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String mypageQnaDelete(HttpServletRequest request,HttpSession session) {

		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		
		dao.getQnaDelete(join_id, qna_id);
		
		String message = "삭제 완료!!";
		
		return message;
	}
	
	@RequestMapping(value = "/myPage/refundList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageRefundList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String cp = request.getContextPath();
		
		MyPageDTO dto = dao.getJoinData(join_id);
		
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getRefundCount(join_id);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage,dataCount );
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getRefundList(join_id, start, end);
		
		Iterator<MyPageDTO> it = lists.iterator();
		
		while(it.hasNext()) {

			MyPageDTO vo = it.next();

			vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
			
		}
		
		String listUrl = cp + "/myPage/refundList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/order/refundList";
	}
	
	@RequestMapping(value = "/myPage/refundProductList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageRefundproductList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String refundGbn = request.getParameter("refundGbn");
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);
		
		int currentPage = 1;
		int dataCount = 0;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);	
		
		if(refundGbn=="R0" || refundGbn.equals("R0")) {
			
			dataCount = dao.getRefundPossibleCount(join_id, 5);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getRefundPossibleList(join_id, start, end, 5);
			
			Iterator<MyPageDTO> it = lists.iterator();
			
			while(it.hasNext()) {

				MyPageDTO vo = it.next();

				vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
				
			}
			
			String listUrl = cp + "/myPage/refundProductList.action?refundGbn=" + refundGbn;
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList", pageIndexList);
			
		}else if(refundGbn=="R1" || refundGbn.equals("R1")) {
			
			dataCount = dao.getRefundPossibleCount(join_id, 7);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getRefundPossibleList(join_id, start, end, 7);
			
			Iterator<MyPageDTO> it = lists.iterator();
			
			while(it.hasNext()) {

				MyPageDTO vo = it.next();

				vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
				
			}
			
			String listUrl = cp + "/myPage/refundProductList.action?refundGbn=" + refundGbn;
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList", pageIndexList);
			
		}else if(refundGbn=="R2" || refundGbn.equals("R2")) {
			
			dataCount = dao.getRefundProductCount(join_id);
			
			//전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage,dataCount );
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getRefundProductList(join_id, start, end);
			
			Iterator<MyPageDTO> it = lists.iterator();
			
			while(it.hasNext()) {

				MyPageDTO vo = it.next();

				vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
				
			}
			
			String listUrl = cp + "/myPage/refundProductList.action?refundGbn=" + refundGbn;
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("lists", lists);
			request.setAttribute("pageIndexList", pageIndexList);
			
		}
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("refundGbn", refundGbn);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/refund/refundProductList";
	}
	
	@RequestMapping(value = "/myPage/refundProductData.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productQuestionData(HttpSession session,HttpServletRequest request) throws Exception{

		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		
		MyPageDTO dto = dao.getRefundOrderData(join_id, orderList_id);

		dto.setResult_price(myUtil.toNumFormat(dto.getOrderList_resultPrice()));
		
		request.setAttribute("dto", dto);
		
		return "mypage/refund/refundProductData";
		
	}	
	
	@RequestMapping(value = "/myPage/refundProductAnswer.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productAnswer(HttpSession session,MyPageDTO dto,MultipartHttpServletRequest request,Model model) throws Exception{
		
		String join_id = (String)session.getAttribute("join_id");
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		
		if(dto==null) {		
			return "mypage/main";
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "refund" + File.separator;
		
		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}
		
		Iterator<String> iterator = request.getFileNames();

		//iterator.hasNext를 써주면 iterator안에 다음 요소가 있을때 까지만 실행.
		//iterator의 커서를 움직였을때 다음 요소가 없다면 while종료. 
		while (iterator.hasNext()) {
			
			//next()를 해주면 커서가 움직여서 iterator안에 들어있는 요소. 즉 여기서는 name을 가져온다.
			String uploadFileName = iterator.next(); 
			
			//file생성
			MultipartFile mFile = request.getFile(uploadFileName);
			
			//파일이름
			String saveFileName = mFile.getOriginalFilename();
			
			//saveFileName이 존재할때만 실제 파일로 만들어줘야함.
			if (saveFileName != null && !saveFileName.equals("")) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				Calendar now = Calendar.getInstance();
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "-" + join_id + "-" + orderList_id + "." + extension;
				//saveFileName에 날짜+.+확장자명으로 저장시킴.
					
				dto.setRefund_saveFileName(saveFileName);			
				
				try {
					
					//transferTo: 실제 파일을 생성한다.
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
				}
						
			}	
		
		}
		
		dao.getOrderApply(join_id, orderList_id, dto.getRefund_state());
		dao.getRefundInsert(dto);
			
		return "mypage/refund/refundProductList";
		
	}
	
	@RequestMapping(value = "/myPage/wishList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageWishList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(join_id);
		int consultingSu = dao.getConsultingData(join_id);
		int coupon = dao.getCouponData(join_id);

		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getZzimCount(join_id);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage,dataCount );
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> zzimList = dao.getZzimList(join_id, start, end);
		
		Iterator<MyPageDTO> it3 = zzimList.iterator();
		
		while(it3.hasNext()) {

			MyPageDTO vo = it3.next();

			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setDiscount_price(myUtil.toNumFormat(vo.getProduct_price()-vo.getProduct_resultPrice()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			
		}
		
		String listUrl = cp + "/myPage/wishList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("zzimList", zzimList);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/wish/wishList";
	}
	
	@RequestMapping(value = "/myPage/addCart.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageAddCart(HttpServletRequest request, HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
		String selectedProductKeies[] = request.getParameterValues("selectedProductKeies[]");
		
		for (int i = 0; i < selectedProductKeies.length; i++) {
			
			int zzimProductId =  Integer.parseInt(selectedProductKeies[i]);
			
			MyPageDTO productDTO = dao.getSearchProduct(zzimProductId);
			productDTO.setJoin_id(join_id);
			
			dao.getInsertCart(productDTO);
			dao.getZzimDelete(join_id, zzimProductId);
			
		}
		
		int cartCount = cartDAO.getCartCount(join_id);
			
		session.setAttribute("cartCount", cartCount);
		
		return "mypage/wish/wishList";
		
	}
	
	@RequestMapping(value = "/myPage/deleteZzim.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypagedeleteZzim(HttpServletRequest request, HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
		String selectedProductKeies[] = request.getParameterValues("selectedProductKeies[]");
				
		for (int i = 0; i < selectedProductKeies.length; i++) {
			
			int zzimProductId =  Integer.parseInt(selectedProductKeies[i]);
			
			dao.getZzimDelete(join_id, zzimProductId);
			
		}
		
		return "mypage/wish/wishList";
		
	}
	
	@RequestMapping(value = "/myPage/cancelList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCancelList(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String cp = request.getContextPath();
		
		MyPageDTO dto = dao.getJoinData(join_id);
		
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getCancelCount(join_id);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage,dataCount );
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getCancelList(join_id, start, end);
		
		Iterator<MyPageDTO> it = lists.iterator();
		
		while(it.hasNext()) {

			MyPageDTO vo = it.next();

			vo.setResult_price(myUtil.toNumFormat(vo.getOrderList_resultPrice()));
			
		}
		
		String listUrl = cp + "/myPage/cancelList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/order/cancelList";
	}
	
	@RequestMapping(value = "/myPage/changePassword.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageChangePassword(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);

		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/info/changePassword";
	}
	
	@RequestMapping(value = "/myPage/changePassword_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageChangePassword_ok(HttpSession session,HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");		
		String join_password = request.getParameter("join_password");

		dao.getUpdatePassword(join_id, join_password);
		
		return "mypage/info/changePassword_ok";
	}
	
	@RequestMapping(value = "/myPage/commentList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCommentList(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		int buySu = dao.getBuyData(join_id);
		int consultingSu = dao.getConsultingData(join_id);
		int coupon = dao.getCouponData(join_id);
		
		MyPageDTO dto = dao.getJoinData(join_id);
		
		//전체 리뷰 작성 데이터갯수
		int dataCount = dao.getCommentDataCount(join_id);
		int noDataCount = dao.getCommentNoDataCount(join_id);

		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);	
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("noDataCount",noDataCount);
		request.setAttribute("coupon", coupon);
		
		return "mypage/review/commentList";
	}
	
	@RequestMapping(value = "/myPage/commentDataList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCommentDataList(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체 리뷰 작성 데이터갯수
		int dataCount = dao.getCommentDataCount(join_id);
		
		//전체페이지수
		int numPerPage = 2;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getCommentDataList(join_id, start, end);
		
		String listUrl = cp + "/myPage/commentDataList.action";
		
		String functionName = "DatalistPage";
		
		String pageIndexList =	myUtil.DataPageIndexList(currentPage, totalPage, listUrl, functionName);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		
		return "mypage/review/commentDataList";
		
	}
	
	@RequestMapping(value = "/myPage/commentNoDataList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCommentNoDataList(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체 리뷰 작성 데이터갯수
		int dataCount = dao.getCommentNoDataCount(join_id);
		
		//전체페이지수
		int numPerPage = 2;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getCommentNoDataList(join_id, start, end);
		
		Iterator<MyPageDTO> it = lists.iterator();
		
		while(it.hasNext()) {

			MyPageDTO vo = it.next();

			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice() * vo.getCart_quantity()));
			
		}
		
		String listUrl = cp + "/myPage/commentNoDataList.action";

		String functionName = "NoDatalistPage";
		
		String pageIndexList =	myUtil.DataPageIndexList(currentPage, totalPage, listUrl, functionName);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		
		return "mypage/review/commentNoDataList";
		
	}
	
	@RequestMapping(value = "/myPage/reviewProductData.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String reviewProductData(HttpSession session,HttpServletRequest request) throws Exception{

		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		int productOrder_id = Integer.parseInt(request.getParameter("productOrder_id"));
		int reviewCheck_id = Integer.parseInt(request.getParameter("reviewCheck_id"));
		
		MyPageDTO dto = dao.getCommentNoData(join_id,orderList_id,productOrder_id);
		
		dto.setReviewCheck_id(reviewCheck_id);
		
		request.setAttribute("dto", dto);
		
		return "mypage/review/commentInput";
		
	}
	
	@RequestMapping(value = "/myPage/inputReview.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageInputReview(HttpSession session,MyPageDTO dto,MultipartHttpServletRequest request,Model model) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		int join_point = dao.getJoinPoint(join_id);
		
		dto.setJoin_id(join_id);
		dto.setReview_id(dao.commentMaxId()+1);
		dto.setPoint_id(dao.getPointMaxId()+1);
		
		//review 이미지 업로드
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator+ "review" + File.separator;
		
		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}
		
		Iterator<String> iterator = request.getFileNames();

		//iterator.hasNext를 써주면 iterator안에 다음 요소가 있을때 까지만 실행.
		//iterator의 커서를 움직였을때 다음 요소가 없다면 while종료. 
		while (iterator.hasNext()) {
			
			//next()를 해주면 커서가 움직여서 iterator안에 들어있는 요소. 즉 여기서는 name을 가져온다.
			String uploadFileName = iterator.next(); 
			
			//file생성
			MultipartFile mFile = request.getFile(uploadFileName);
			
			//파일이름
			String saveFileName = mFile.getOriginalFilename();
			
			//saveFileName이 존재할때만 실제 파일로 만들어줘야함.
			if (saveFileName != null && !saveFileName.equals("")) {

				//저장할 파일의 이름을 겹치지 않게 해주기위해
				//날짜시간으로 이름을 만들어준다.
				//Calendar객체에서 현재날짜시간을 받아서
				//SimpleDateFormat를 이용해 원하는 모양으로 바꿈
				//yyyy:년 MM:월 dd:일 HH:시 mm:분 ss:초
				//extension은 확장자명이다. ex)png, jpg....

				String extension = saveFileName.split("\\.")[1];
				saveFileName = join_id + dto.getOrderList_id() + dto.getProductOrder_id() + dto.getReview_id() + "." + extension;

				dto.setReview_saveFileName(saveFileName);
				
				try {
					
					//transferTo: 실제 파일을 생성한다.
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
					//실패시 fail이라는 메세지를 model에 넘겨준다.
					model.addAttribute("msg", "fail");
					
				}
				
			}
			
		}

		if(dto.getReview_saveFileName()=="" || dto.getReview_saveFileName().equals("")) {
			dto.setPoint_score(100);			
			dto.setPoint_content("리뷰 감사 포인트 지급(사진 미첨부)");
		}else {
			dto.setPoint_score(200);
			dto.setReview_saveFileName(dto.getReview_saveFileName());
			dto.setPoint_content("리뷰 감사 포인트 지급(사진 첨부)");
		}
		
		dto.setJoin_point(join_point + dto.getPoint_score());

		//리뷰 삽입
		dao.commentInsert(dto);
		
		//포인트 삽입
		dao.getCommentPointInsert(dto);
		
		int grade = 0;
		int reviewCount = dao.reviewCount(dto.getProduct_id());
		List<MyPageDTO> reviewGrade = dao.reviewGrade(dto.getProduct_id());
		
		Iterator<MyPageDTO> it = reviewGrade.iterator();
		
		System.out.println(reviewCount);
		
		while(it.hasNext()) {
			
			MyPageDTO vo = it.next();
			
			grade += vo.getReview_grade();
			
		}
		
		System.out.println(grade);
		
		grade = (grade * 20) / reviewCount;
		
		System.out.println(grade);
		
		dao.productGradeUpdate(dto.getProduct_id(), grade);

		request.setAttribute("dto", dto);
		
		return "mypage/review/commentList";
	}
	
	@RequestMapping(value = "/myPage/frequencyList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageFrequencyList(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);
		int buyCount = dao.getProductCount(join_id);
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getProductCount(join_id);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage,dataCount );
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getFrequencyList(join_id,start,end);	
		
		Iterator<MyPageDTO> it2 = lists.iterator();
		
		while(it2.hasNext()) {

			MyPageDTO vo = it2.next();

			vo.setPrice(myUtil.toNumFormat(vo.getProduct_price()));
			vo.setDiscount_price(myUtil.toNumFormat(vo.getProduct_price()-vo.getProduct_resultPrice()));
			vo.setResult_price(myUtil.toNumFormat(vo.getProduct_resultPrice()));
			
		}
		
		String listUrl = cp + "/myPage/frequencyList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("buyCount", buyCount);
		request.setAttribute("lists", lists);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/frequency/frequencyList";
	}
	
	@RequestMapping(value = "/myPage/nowBuy.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageNowBuy(HttpServletRequest request, HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
	
		String selectedProductIds = request.getParameter("selectedProductKeies");
		String[] selectProduct_id = selectedProductIds.split(",");
		String selectedProductPrices = request.getParameter("selectedProductPriceKeies");
		String[] selectProduct_resultPrice = selectedProductPrices.split(",");	
		
		int selectedProductCount = Integer.parseInt(request.getParameter("selectedProductCount"));
		int cart_id = 0;
		
		int[] selectedCartId = new int[selectedProductCount];
		
		if(selectedProductCount==1) {
			selectProduct_id[0] = request.getParameter("selectedProductKeies");
			selectProduct_resultPrice[0] = request.getParameter("selectedProductPriceKeies");
		}
		
		OrderDTO vo = orderDAO.userData(join_id);
		vo.setOrderList_productCount(selectedProductCount);
		
		for (int i = 0; i < selectedProductCount; i++) {
			
			int frequencyProductId =  Integer.parseInt(selectProduct_id[i]);
			int frequencyProductresultPrice =  Integer.parseInt(selectProduct_resultPrice[i]);
			
			int check = cartDAO.checkOverlap(join_id,frequencyProductId);
			
			if(check!=0) {
				
				cart_id = cartDAO.findSameCartID(join_id,frequencyProductId);
			
				cartDAO.changeQuantity(cart_id,frequencyProductId);
				
				vo.setProduct_totalPrice(vo.getProduct_totalPrice()+frequencyProductresultPrice);
				
				selectedCartId[i] = cart_id;
			
			}else {
			
				CartDTO cartDTO = cartDAO.productInfo(frequencyProductId);
				
				int cartMaxNum = cartDAO.getCartMaxNum();
		
				cartDTO.setCart_id(cartMaxNum + 1);
				cartDTO.setJoin_id(join_id);
				cartDTO.setProduct_id(frequencyProductId);
				cartDTO.setCart_quantity(1);	
				
				cartDAO.insertCart(cartDTO);
				
				vo.setProduct_totalPrice(vo.getProduct_totalPrice()+cartDTO.getProduct_resultPrice());
				
				selectedCartId[i] = cartDTO.getCart_id();
			}

		}
		
		String selectedCartIds = Arrays.toString(selectedCartId);
		selectedCartIds = selectedCartIds.toString().replace("[", "");
		selectedCartIds = selectedCartIds.toString().replace("]", "");
		selectedCartIds = selectedCartIds.toString().replace(" ", "");
		
		request.setAttribute("dto", vo);
		request.setAttribute("selectedCartIds", selectedCartIds);	
		
		return "order/delivery";
		
	}
	
	@RequestMapping(value = "/myPage/info.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageInfo(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}
		
		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getInfoSearchData(join_id);
		
		int check = Integer.parseInt(request.getParameter("check"));
		int buySu = dao.getBuyData(join_id);
		int consultingSu = dao.getConsultingData(join_id);
		int coupon = dao.getCouponData(join_id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		request.setAttribute("check", check);
		
		return "mypage/info/info";
	}
	
	@RequestMapping(value = "/myPage/checkPassword.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> mypagecheckPassword(HttpServletRequest request,HttpSession session) {
		
		String join_id = (String)session.getAttribute("join_id");
		
		int check = 1;
		String message = "패스워드가 확인되었습니다!!";
		
		String join_password = request.getParameter("password");
		
		MyPageDTO dto = dao.getInfoSearchData(join_id);
		
		if(!join_password.equals(dto.getJoin_password())) {
			
			check = 0;
			message = "패스워드를 다시 확인해주세요!!";
		}
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("message", message);
		hmap.put("check", check);
		
		return hmap;
		
	}
	
	@RequestMapping(value = "/myPage/infoUpdate.action", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> mypageInfoUpdate(MyPageDTO dto) {
		
		int check = 0;
		String message = "회원 정보가 수정되었습니다!!";		
		
		dao.getInfoUpdateData(dto);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("message", message);
		hmap.put("check", check);
		
		return hmap;
		
	}
	
	@RequestMapping(value = "/myPage/invite.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageInvite(HttpSession session, HttpServletRequest request) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		
		return "mypage/invite/invite";
	}
	
	@RequestMapping(value = "/myPage/couponList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypageCouponList(HttpServletRequest request,HttpSession session) {
		
		if(session == null || session.getAttribute("join_id") == null) {
			return "redirect:/join/login.action";
		}

		String join_id = (String)session.getAttribute("join_id");
		String couponGubun = request.getParameter("couponGubun");
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		
		MyPageDTO dto = dao.getJoinData(join_id);
		int buySu = dao.getBuyData(dto.getJoin_id());
		int consultingSu = dao.getConsultingData(dto.getJoin_id());
		int coupon = dao.getCouponData(join_id);
		int couponCom = dao.getCouponDataCount(join_id, 0);
		int couponExp = dao.getCouponDataCount(join_id, 2);
		
		int dataCount = 0;
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체페이지수
		int numPerPage = 5;
			
		if(couponGubun=="USE" || couponGubun.equals("USE")) {
			int totalPage = myUtil.getPageCount(numPerPage, coupon);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getCouponList(join_id,1, start, end);
			request.setAttribute("couponLists", lists);
			
			String listUrl = cp + "/myPage/couponList.action?couponGubun=" + couponGubun;	
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			dataCount = coupon;
			
			request.setAttribute("pageIndexList",pageIndexList);
			
		}else if(couponGubun=="COM" || couponGubun.equals("COM")) {
			int totalPage = myUtil.getPageCount(numPerPage, couponCom);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getCouponList(join_id,0, start, end);
			
			request.setAttribute("couponCOMLists", lists);
			
			String listUrl = cp + "/myPage/couponList.action?couponGubun=" + couponGubun;	
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			dataCount = couponCom;
			
			request.setAttribute("pageIndexList",pageIndexList);
			
		}else if(couponGubun=="EXP" || couponGubun.equals("EXP")) {
			int totalPage = myUtil.getPageCount(numPerPage, couponExp);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MyPageDTO> lists = dao.getCouponList(join_id,2, start, end);
			request.setAttribute("couponEXPLists", lists);
			
			String listUrl = cp + "/myPage/couponList.action?couponGubun=" + couponGubun;	
			String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			dataCount = couponExp;
			
			request.setAttribute("pageIndexList",pageIndexList);
		}
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("dto", dto);
		request.setAttribute("buySu", buySu);
		request.setAttribute("consultingSu", consultingSu);
		request.setAttribute("coupon", coupon);
		request.setAttribute("couponGubun", couponGubun);
		request.setAttribute("couponCom", couponCom);
		request.setAttribute("couponExp", couponExp);
		
		return "mypage/coupon/couponList";
	}
	
}
