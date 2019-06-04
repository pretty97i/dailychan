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
		
		//��ü��������
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
			
			//��ü��������
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
			
			//��ü��������
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
			
			//��ü��������
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
		
		//��ü��������
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
		
		String message = "���� �Ϸ�!!";
		
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
		
		//��ü��������
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, qnaCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MyPageDTO> lists = dao.getQnaList(join_id,start,end);
		
		String listUrl = cp + "/myPage/qnaList.action";
		
		String pageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ۺ��� �ּ� ����
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
		
		String qna_state="�̴亯";
	
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
			//next()�� ���ָ� Ŀ���� �������� iterator�ȿ� ����ִ� ���. �� ���⼭�� name�� �����´�.

			MultipartFile mFile = request.getFile(uploadFileName);
			//file����
			
			String saveFileName = mFile.getOriginalFilename();
			//�����̸�
			
			if (saveFileName != null && !saveFileName.equals("")) {

				//������ ������ �̸��� ��ġ�� �ʰ� ���ֱ�����
				//��¥�ð����� �̸��� ������ش�.
				//Calendar��ü���� ���糯¥�ð��� �޾Ƽ�
				//SimpleDateFormat�� �̿��� ���ϴ� ������� �ٲ�
				//yyyy:�� MM:�� dd:�� HH:�� mm:�� ss:��
				//extension�� Ȯ���ڸ��̴�. ex)png, jpg....
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmss-" + i);
				Calendar now = Calendar.getInstance();
				
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "." + extension;
				//saveFileName�� ��¥+.+Ȯ���ڸ����� �����Ŵ.
				
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
			dto.setQna_type("���忡 ��������");			
			
		}else {
			if(qna_store==null) {
				dto.setQna_type("�Ϲݹ���");
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
		
		String message = "���� �Ϸ�!!";
		
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
		
		//��ü��������
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
			
			//��ü��������
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
			
			//��ü��������
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
			
			//��ü��������
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

		//iterator.hasNext�� ���ָ� iterator�ȿ� ���� ��Ұ� ������ ������ ����.
		//iterator�� Ŀ���� ���������� ���� ��Ұ� ���ٸ� while����. 
		while (iterator.hasNext()) {
			
			//next()�� ���ָ� Ŀ���� �������� iterator�ȿ� ����ִ� ���. �� ���⼭�� name�� �����´�.
			String uploadFileName = iterator.next(); 
			
			//file����
			MultipartFile mFile = request.getFile(uploadFileName);
			
			//�����̸�
			String saveFileName = mFile.getOriginalFilename();
			
			//saveFileName�� �����Ҷ��� ���� ���Ϸ� ����������.
			if (saveFileName != null && !saveFileName.equals("")) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
				Calendar now = Calendar.getInstance();
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "-" + join_id + "-" + orderList_id + "." + extension;
				//saveFileName�� ��¥+.+Ȯ���ڸ����� �����Ŵ.
					
				dto.setRefund_saveFileName(saveFileName);			
				
				try {
					
					//transferTo: ���� ������ �����Ѵ�.
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
		
		//��ü��������
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
		
		//��ü��������
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
		
		//��ü ���� �ۼ� �����Ͱ���
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
		
		//��ü ���� �ۼ� �����Ͱ���
		int dataCount = dao.getCommentDataCount(join_id);
		
		//��ü��������
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
		
		//��ü ���� �ۼ� �����Ͱ���
		int dataCount = dao.getCommentNoDataCount(join_id);
		
		//��ü��������
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
		
		//review �̹��� ���ε�
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator+ "review" + File.separator;
		
		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}
		
		Iterator<String> iterator = request.getFileNames();

		//iterator.hasNext�� ���ָ� iterator�ȿ� ���� ��Ұ� ������ ������ ����.
		//iterator�� Ŀ���� ���������� ���� ��Ұ� ���ٸ� while����. 
		while (iterator.hasNext()) {
			
			//next()�� ���ָ� Ŀ���� �������� iterator�ȿ� ����ִ� ���. �� ���⼭�� name�� �����´�.
			String uploadFileName = iterator.next(); 
			
			//file����
			MultipartFile mFile = request.getFile(uploadFileName);
			
			//�����̸�
			String saveFileName = mFile.getOriginalFilename();
			
			//saveFileName�� �����Ҷ��� ���� ���Ϸ� ����������.
			if (saveFileName != null && !saveFileName.equals("")) {

				//������ ������ �̸��� ��ġ�� �ʰ� ���ֱ�����
				//��¥�ð����� �̸��� ������ش�.
				//Calendar��ü���� ���糯¥�ð��� �޾Ƽ�
				//SimpleDateFormat�� �̿��� ���ϴ� ������� �ٲ�
				//yyyy:�� MM:�� dd:�� HH:�� mm:�� ss:��
				//extension�� Ȯ���ڸ��̴�. ex)png, jpg....

				String extension = saveFileName.split("\\.")[1];
				saveFileName = join_id + dto.getOrderList_id() + dto.getProductOrder_id() + dto.getReview_id() + "." + extension;

				dto.setReview_saveFileName(saveFileName);
				
				try {
					
					//transferTo: ���� ������ �����Ѵ�.
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
					//���н� fail�̶�� �޼����� model�� �Ѱ��ش�.
					model.addAttribute("msg", "fail");
					
				}
				
			}
			
		}

		if(dto.getReview_saveFileName()=="" || dto.getReview_saveFileName().equals("")) {
			dto.setPoint_score(100);			
			dto.setPoint_content("���� ���� ����Ʈ ����(���� ��÷��)");
		}else {
			dto.setPoint_score(200);
			dto.setReview_saveFileName(dto.getReview_saveFileName());
			dto.setPoint_content("���� ���� ����Ʈ ����(���� ÷��)");
		}
		
		dto.setJoin_point(join_point + dto.getPoint_score());

		//���� ����
		dao.commentInsert(dto);
		
		//����Ʈ ����
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
		
		//��ü��������
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
		String message = "�н����尡 Ȯ�εǾ����ϴ�!!";
		
		String join_password = request.getParameter("password");
		
		MyPageDTO dto = dao.getInfoSearchData(join_id);
		
		if(!join_password.equals(dto.getJoin_password())) {
			
			check = 0;
			message = "�н����带 �ٽ� Ȯ�����ּ���!!";
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
		String message = "ȸ�� ������ �����Ǿ����ϴ�!!";		
		
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
		
		//��ü��������
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
