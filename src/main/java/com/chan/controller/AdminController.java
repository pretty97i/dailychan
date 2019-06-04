package com.chan.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chan.dao.AdminDAO;
import com.chan.dao.HelpDAO;
import com.chan.dao.ProductDAO;
import com.chan.dao.RecipeDAO;
import com.chan.dto.AdminDTO;
import com.chan.dto.ProductDTO;
import com.chan.dto.RecipeDTO;
import com.chan.util.MyUtil;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("productDAO")
	ProductDAO productDAO;
	
	@Autowired
	@Qualifier("recipeDAO")
	RecipeDAO recipeDAO;
	
	@Autowired
	@Qualifier("helpDAO")
	HelpDAO helpDAO;
	
	@Autowired
	@Qualifier("adminDAO")
	AdminDAO adminDAO;

	@Autowired
	MyUtil myUtil;	

	@RequestMapping(value = "/admin/main.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin(Locale locale, Model model, HttpServletRequest request) {
		
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		List<AdminDTO> productQnaLists = adminDAO.adminProductQnaList(1, 3);	
		List<AdminDTO> orderLists = adminDAO.getOrderListCheck(1, 3);
		List<AdminDTO> qnaLists = adminDAO.getQnaList(1, 3);
		List<AdminDTO> refundLists = adminDAO.getRefundList(1, 3);
		
		request.setAttribute("productQnaLists", productQnaLists);
		request.setAttribute("orderLists", orderLists);
		request.setAttribute("qnaLists", qnaLists);
		request.setAttribute("refundLists", refundLists);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);

		return "admin/main";
		
	}
	
	@RequestMapping(value = "admin/refund/permitRefund.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String permitRefund(HttpServletRequest request) {
		
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		
		return "admin/refund/permitRefund";
	}
	
	@RequestMapping(value = "admin/refund/refundList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String refundList(HttpServletRequest request, HttpServletResponse response) {		
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		String function = "refundList";
		
		int currentPage = 1;
		int dataCount = adminDAO.getRefundCount();
		
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);			
		
		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;
	
		List<AdminDTO> lists =  adminDAO.getRefundList(start,end);			

		String listUrl = cp + "/refund/refundList.action";		 
		String pageIndexList = myUtil.lastCouponIndexList(currentPage, totalPage, listUrl, function);
		 
		//포워딩 될 페이지에 데이터를 넘긴다	
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("pageNum", pageNum);
		
		return "admin/refund/refundList";
	}
	
	@RequestMapping(value = "admin/refund/detailRefund.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String detailInfo(HttpServletRequest request, HttpServletResponse response) {
		
		int orderList_id =  Integer.parseInt(request.getParameter("orderList_id"));
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		String function = "sendData";
		
		int currentPage = 1;
		int dataCount = adminDAO.getRefundDetailCount(orderList_id);
		
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);

		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;
	
		List<AdminDTO> detailLists =  adminDAO.getDetailList(start,end,orderList_id);			
		
		AdminDTO refundList = adminDAO.getRefundInfo(orderList_id);
	
		int orderList_id2 = refundList.getOrderList_id();
		int orderList_resultPrice = refundList.getOrderList_resultPrice();
		
		String join_id = refundList.getJoin_id();
		String refund_created = refundList.getRefund_created();
		String refund_saveFileName = refundList.getRefund_saveFileName();
		String refund_reason = refundList.getRefund_reason();

		String listUrl = cp + "/refund/detailRefund.action";		 
		String pageIndexList = myUtil.lastCouponIndexList(currentPage, totalPage, listUrl, function);
		
		request.setAttribute("detailLists", detailLists);
		request.setAttribute("pageIndexList",pageIndexList);

		request.setAttribute("join_id",join_id);
		request.setAttribute("orderList_id",orderList_id2);
		request.setAttribute("refund_created",refund_created);
		request.setAttribute("orderList_resultPrice",orderList_resultPrice);
		request.setAttribute("orderList_id",orderList_id2);
		request.setAttribute("refund_saveFileName",refund_saveFileName);
		request.setAttribute("refund_reason",refund_reason);
		
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("mode", "woody");
		
		return "admin/refund/detailRefund";
		
	}

	@RequestMapping(value = "admin/refund/refundPermit.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String refundPermit(HttpServletRequest request, HttpServletResponse response) {		
		
		int orderList_id = Integer.parseInt(request.getParameter("orderList_id"));
		String join_id = request.getParameter("join_id");
		String mode = request.getParameter("mode");
		
		if(orderList_id==0) {
			
			//전부 환불 승인
			adminDAO.permitRefundAll();
			adminDAO.permitProductStateAll();
			
			return "admin/refund/detailRefund";
			
		}		
		
		AdminDTO info  = adminDAO.checkInfo(orderList_id);	
		
		int coupon_id = info.getCoupon_id();	
		int point_id = info.getPoint_id();
		
		//환불승인시		
		if(mode.equals("permit")) {
			
			//refund에 있는 상태 변경
			adminDAO.changeRefundState(orderList_id);
		
			//쿠폰과 포인트 사용전으로 변경
			if(coupon_id!=0) {
				adminDAO.returnCoupon(orderList_id);
			}
			
			int price = adminDAO.selectRefundPoint(orderList_id);
			
			System.out.println(price);
			
			adminDAO.insertRefundPoint(join_id, price);
		
			//환불금액 포인트로 전환
			adminDAO.addRefundPoint(orderList_id,join_id);
			
			//orderList의 상태 변경
			adminDAO.changeProductOrderState(orderList_id);
			
			return "admin/refund/detailRefund";
		
		}else if(mode.equals("refuse")) {
			
			//환불 반려
			adminDAO.refuseRefundState(orderList_id); 
			adminDAO.refuseProductOrderState(orderList_id);
			
			System.out.println("환불반려");

		}	
		
		return "admin/refund/detailRefund";
	}
	
	//수정부분
	@RequestMapping(value = "/admin/update.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(AdminDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String join_id = request.getParameter("join_id");

		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		dto = adminDAO.joinReadData(join_id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		
		return "admin/info/update";
	}
	
	//수정부분 
	@RequestMapping(value = "/admin/update_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public HashMap<String, Object> updateOk(AdminDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String message = "회원 정보가 수정되었습니다!!";		
		
		adminDAO.update(dto);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("message", message);
		
		return hmap;
	}
	
	
	//회원정보관리
	@RequestMapping(value = "/admin/info.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String info(Locale locale, Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		int currentPage = 1;
		
		String cp = request.getContextPath();		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);	
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue == null){
			
			searchKey = "join_id";
			searchValue = "";
			
		}else{
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
	
		}
		
		//전체데이터갯수
		int dataCount = adminDAO.getJoinDataCount(searchKey, searchValue);
		
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<AdminDTO> lists = adminDAO.joinList(start, end, searchKey, searchValue);
		//번호 넘버링
		Iterator<AdminDTO> it = lists.iterator();
		
		int i=start;
		
		while(it.hasNext()) {
			
			AdminDTO vo = it.next();
			
			vo.setJoin_num(i);
			
			i++;
			
		}

		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/admin/info.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);	
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("joinList", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("joinDataCount",dataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);

		return "admin/info/info";
		
	}
	
	@RequestMapping(value = "/admin/deleted.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleted(AdminDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String join_id = request.getParameter("join_id");
		String pageNum = request.getParameter("pageNum");
		
		adminDAO.joinDeleteData(join_id);
		
		return "redirect:/admin/info.action?pageNum=" + pageNum;
	}
	
	@RequestMapping(value = "/admin/qnaList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaList(Locale locale, Model model, HttpServletRequest request) {
		
		String qnaPageNum = request.getParameter("pageNum");
		
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		int currentPage = 1;
		
		if(qnaPageNum != null)
			currentPage = Integer.parseInt(qnaPageNum);
		
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage,qnaDataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<AdminDTO> qnaLists = adminDAO.getQnaList(start,end);

		String listUrl = "/dailychan/admin/qnaList.action";
		
		String qnaPageIndexList =
				myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//Iterator<AdminDTO> it = qnaLists.iterator();
		
		request.setAttribute("qnaLists", qnaLists);
		request.setAttribute("qnaPageNumIndexList", qnaPageIndexList);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		
		return "admin/qna/qnaList";
		
	}
	
	@RequestMapping(value = "/admin/qnaData.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaData(HttpServletRequest request) throws Exception{
		
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		
		AdminDTO dto = adminDAO.adminQnaData(qna_id);

		dto.setQna_content(dto.getQna_content().replaceAll("\n", "<br/>"));
		
		request.setAttribute("dto", dto);
		
		return "admin/qna/qnaData";
		
	}
	
	@RequestMapping(value = "/admin/qnaReply.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaReply(AdminDTO dto, HttpServletRequest request) throws Exception{
		
		adminDAO.insertQnaReply(dto);
		
		return "redirect:/admin/qnaList.action";
		
	}

	// 쿠폰으로 이동
	@RequestMapping(value = "/admin/coupon.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String addCoupon(HttpServletRequest request, HttpServletResponse response) {

		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		
		return "admin/coupon/addCoupon";

	}
	
	// 쿠폰 -> 발급
	
	@RequestMapping(value = "/admin/coupon/searchID_lists.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchID_lists(AdminDTO dto ,HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		String search_join_id = request.getParameter("search_join_id");				
		
		if(search_join_id=="") {
			
			search_join_id = "slekqeejleqtwetewt";
		}
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		String function = "insertCoupon";
		
		int currentPage = 1;
		 
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);	 
		 
		//전체 검색된 아이디 수 
		int dataCount = adminDAO.getIdCount(search_join_id);		
		
		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	 dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;
	
		List<String> lists = adminDAO.getIdList(start,end,search_join_id);	
		String listUrl = cp + "/admin/coupon/searchID_lists.action";		 
		String pageIndexList = myUtil.couponIndexList(currentPage, totalPage, listUrl, function,search_join_id);
		
		//포워딩 될 페이지에 데이터를 넘긴다		 	
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("search_join_id", search_join_id);
		request.setAttribute("pageNum", currentPage);
		
		return "admin/coupon/idList";

	}
	
	@RequestMapping(value = "/admin/coupon/coupon_insert.action", method = {RequestMethod.GET,RequestMethod.POST}) 
	public String coupon_insert(AdminDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int coupon_price = Integer.parseInt(request.getParameter("coupon_price1"));
		String join_id = request.getParameter("join_id");
		
		int couponMaxNum = adminDAO.couponMaxNum();
		
		dto.setJoin_id(join_id);		
		dto.setCoupon_id(couponMaxNum+1);
		dto.setCoupon_price(coupon_price);				
		
		adminDAO.insertCoupon(dto);
		
		return "redirect:/admin/coupon/coupon_insert.action";
		
	}

	// 쿠폰 -> 삭제
	@RequestMapping(value = "/admin/coupon/removeIdList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String removeIdList(AdminDTO dto ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String search_join_id = request.getParameter("search_join_id");			

		if(search_join_id=="") {
			
			search_join_id = "slekqeejleqtwetewt";
		}		
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		String function = "deleteCoupon";
		
		int currentPage = 1;
		 
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);
		 
		//전체 검색된 쿠폰을 가진 회원수
		int dataCount = adminDAO.getCouponCount(search_join_id);	
		
		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	 dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;
	
		List<AdminDTO> lists =  adminDAO.getCouponList(start,end,search_join_id);	

		String listUrl = cp + "/admin/coupon/removeIdList.action";		 
		
		String pageIndexList = myUtil.couponIndexList(currentPage, totalPage, listUrl, function, search_join_id);
		
		//포워딩 될 페이지에 데이터를 넘긴다		 	

		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("search_join_id",search_join_id);
		request.setAttribute("pageNum", currentPage);
		
		return "admin/coupon/removeIdList";
		
	}
	
	@RequestMapping(value = "/admin/coupon/coupon_delete.action", method = {RequestMethod.GET,RequestMethod.POST}) 
	public String coupon_delete(AdminDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int coupon_id = Integer.parseInt(request.getParameter("coupon_id"));				
		String search_join_id = request.getParameter("search_join_id");

		adminDAO.deleteCoupon(coupon_id);

		request.setAttribute("search_join_id", search_join_id);

		return "admin/coupon/removeIdList";

	}

	// 쿠폰 -> 유효기간 지난거 삭제

	@RequestMapping(value = "/admin/coupon/lastCouponList.action", method = {RequestMethod.GET,RequestMethod.POST}) 
	public String lastCouponList(AdminDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {	
		
		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum"); 
		String function = "lastList";
		int currentPage = 1;
		 
		if(pageNum != null) 
			currentPage = Integer.parseInt(pageNum);
		 
		//전체 검색된 쿠폰을 가진 회원수
		int dataCount = adminDAO.getLastCouponCount();	
		
		//전체페이지수 
		int numPerPage = 5; 
		int totalPage = myUtil.getPageCount(numPerPage,	dataCount);
		
		if(currentPage > totalPage) currentPage = totalPage;
	 
		int start = (currentPage-1)*numPerPage+1; 
		int end  = currentPage*numPerPage;
	
		List<AdminDTO> lists =  adminDAO.getLastCouponList(start,end);
		
		String listUrl = cp + "/admin/coupon/lastCouponList.action";		 
		String pageIndexList = myUtil.lastCouponIndexList(currentPage, totalPage, listUrl, function);
		 
		//포워딩 될 페이지에 데이터를 넘긴다		 	

		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("pageNum", currentPage);
		
		return "admin/coupon/lastCouponList";
		
	}
	
	@RequestMapping(value = "/admin/coupon/coupon_Alldelete.action", method = {RequestMethod.GET,RequestMethod.POST}) 
	public String coupon_Alldelete(AdminDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		adminDAO.deleteAllCoupon();
		
		return "admin/coupon/lastCouponList";	
		
	}
	
	@RequestMapping(value = "/admin/productRegister.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String register(Locale locale, Model model) {
		
		return "admin/product/register";
		
	}
	
	@RequestMapping(value = "/admin/product/register_result.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String register_result(MultipartHttpServletRequest request, ProductDTO dto,Model model) {

		if(dto==null) {
			
			return "admin/main";
			
		}
		
		if(!dto.getProduct_firstSelect().equals("오!감동")) {
			
			dto.setProduct_saleLimit(dto.getProduct_stock());
			dto.setProductDetail_configuration(dto.getProductDetail_configuration2());
			
		}else {
			
			dto.setProduct_saleLimit(Integer.parseInt(dto.getProduct_saleLimit1()));
			dto.setProductDetail_configuration(dto.getProductDetail_configuration1());
			
		}

		int maxId = productDAO.getMaxId();
		
		//delivery 체크박스 데이터 삽입
		String[] delivery = request.getParameterValues("delivery");
		
		for(int i=0;i<request.getParameterValues("delivery").length;i++) {
			
			if(delivery[i].equals("storeDelivery")) {
				
				dto.setProduct_delivery1(delivery[i]);
				
			}else if(delivery[i].equals("homeDelivery")) {
				
				dto.setProduct_delivery2(delivery[i]);
				
			}else if(delivery[i].equals("earlyDelivery")){
				
				dto.setProduct_delivery3(delivery[i]);
				
			}
			
		}
		
		if(dto.getProduct_delivery1()==null) {
			
			dto.setProduct_delivery1("no");
			
		}
		
		if(dto.getProduct_delivery2()==null) {
					
			dto.setProduct_delivery2("no");
					
		}
		
		if(dto.getProduct_delivery3()==null) {
			
			dto.setProduct_delivery3("no");
			
		}
		
		if(dto.getProduct_secondSelect()==null) {
			
			dto.setProduct_secondSelect("no");
			
		}
		
		if(dto.getProduct_lastSelect()==null) {
			
			dto.setProduct_lastSelect("no");
			
		}
		
		//상품 번호생성
		dto.setProduct_id(maxId + 1);
		
		//main,content 이미지 업로드
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "product" + File.separator;
		
		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}
		
		Iterator<String> iterator = request.getFileNames();
		
		int i = 0;

		//iterator.hasNext를 써주면 iterator안에 다음 요소가 있을때 까지만 실행.
		//iterator의 커서를 움직였을때 다음 요소가 없다면 while종료. 
		while (iterator.hasNext()) {
			
			i++;
			
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
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmss-" + i);
				Calendar now = Calendar.getInstance();
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "." + extension;
				//saveFileName에 날짜+.+확장자명으로 저장시킴.
				
				if(i==1) {
					
					dto.setProduct_mainSaveFileName(saveFileName);
					
				}else {
					
					dto.setProduct_contentSaveFileName(saveFileName);
					
				}
				
				try {
					
					//transferTo: 실제 파일을 생성한다.
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
					//실패시 fail이라는 메세지를 model에 넘겨준다.
					model.addAttribute("msg", "fail");
					
				}
				
			}
			
		}

		adminDAO.productInsertData(dto);
		adminDAO.productDetailInsertData(dto);

		return "redirect:/admin/main.action";
		
	}

	@RequestMapping(value = "/admin/recipeRegister.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String reciperegister(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "admin/recipe/recipeRegister";
		
	}
	
	@RequestMapping(value = "/admin/recipe/register_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String recipemain(RecipeDTO dto,MultipartHttpServletRequest request,HttpServletResponse response) throws Exception{
		
		if(dto==null) {
			
			return "admin/main";
			
		}
		
		String recipe_select=request.getParameter("recipe_select");
		
		dto.setRecipe_select(recipe_select);
		
		int recipeMaxId = recipeDAO.getRecipeMaxId();
		
		dto.setRecipe_id(recipeMaxId+1);
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "recipe" + File.separator;
		
		
		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}
		
		Iterator<String> iterator = request.getFileNames();
		
		int i = 0;

		//iterator.hasNext를 써주면 iterator안에 다음 요소가 있을때 까지만 실행.
		//iterator의 커서를 움직였을때 다음 요소가 없다면 while종료. 
		while (iterator.hasNext()) {
			
			i++;
			
			//next()를 해주면 커서가 움직여서 iterator안에 들어있는 요소. 즉 여기서는 name을 가져온다.
			String uploadFileName = iterator.next(); 
			
			//file생성
			MultipartFile mFile = request.getFile(uploadFileName);
			
			//파일이름
			String saveFileName = mFile.getOriginalFilename();
			
			//saveFileName이 존재할때만 실제 파일로 만들어줘야함.
			if (saveFileName != null && !saveFileName.equals("")) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd-HHmmss-" + i);
				Calendar now = Calendar.getInstance();
				String extension = saveFileName.split("\\.")[1];
				saveFileName = formatter.format(now.getTime()) + "." + extension;
				//saveFileName에 날짜+.+확장자명으로 저장시킴.
				
				if(i==1) {
					
					dto.setRecipe_mainSaveFileName(saveFileName);
					
					
				}else {
					
					dto.setRecipe_contentSaveFileName(saveFileName);
				
				}
				
				try {
					
					//transferTo: 실제 파일을 생성한다.
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
				}
						
			}
			
		}
		
		recipeDAO.recipeInsertData(dto);
		
		return "redirect:/admin/main.action";
		
	}
	
	@RequestMapping(value = "/admin/productQna/productQuestion.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productQuestion(HttpServletRequest request) throws Exception{
		
		String qnaPageNum = request.getParameter("pageNum");
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		int currentPage = 1;
		
		if(qnaPageNum != null)
			currentPage = Integer.parseInt(qnaPageNum);
		
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage,productQnaDataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<AdminDTO> qnaLists = adminDAO.adminProductQnaList(start,end);

		String listUrl = "/dailychan/admin/orderList.action";
		
		String orderPageIndexList =
				myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaLists", qnaLists);
		request.setAttribute("qnaPageIndexList",orderPageIndexList);
		
		return "admin/product/qnaList";
		
	}
	
	@RequestMapping(value = "/admin/productQna/productQuestionData.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productQuestionData(HttpServletRequest request) throws Exception{
		
		int productQuestion_id = Integer.parseInt(request.getParameter("productQuestion_id"));
		
		AdminDTO dto = adminDAO.adminProductQnaData(productQuestion_id);

		dto.setProductQuestion_content(dto.getProductQuestion_content().replaceAll("\n", "<br/>"));
		
		request.setAttribute("dto", dto);
		
		return "admin/product/qnaData";
		
	}
	
	@RequestMapping(value = "/admin/productQna/productAnswer.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String productAnswer(AdminDTO dto, HttpServletRequest request) throws Exception{
		
		dto.setProductAnswer_id(adminDAO.getMaxProductAnswerId() + 1);
		
		adminDAO.productAnswerInsertData(dto);
		adminDAO.productQnaCompete(dto.getProductQuestion_id());
		
		return "redirect:/admin/productQna/productQuestion.action";
		
	}
	
	@RequestMapping(value = "/review/bestReviewInsert.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String bestReviewInsert(ProductDTO dto, Model model,HttpServletRequest request,
			HttpSession session) throws UnsupportedEncodingException {

		ProductDTO vo = productDAO.getReviewData(dto.getProduct_id(), dto.getReview_id());
		
		vo.setBestReview_subject(vo.getReview_subject());
		vo.setBestReview_content(vo.getReview_content());
		vo.setBestReview_created(vo.getReview_created());
		vo.setBestReview_grade(vo.getReview_grade());
		vo.setBestReview_saveFileName(vo.getReview_saveFileName());
		
		adminDAO.bestReviewInsertData(vo);
		adminDAO.bestReviewPointInsert(vo.getJoin_id());
		
		return "";
		
	}
	
	@RequestMapping(value = "/admin/orderList.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String OrderData(HttpServletRequest request) throws Exception{
		
		String orderPageNum = request.getParameter("pageNum");
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		int currentPage = 1;
		
		if(orderPageNum != null)
			currentPage = Integer.parseInt(orderPageNum);
		
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, orderDataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<AdminDTO> orderLists = adminDAO.getOrderListCheck(start, end);

		String listUrl = "/dailychan/admin/orderList.action";
		
		String orderPageIndexList =	myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("orderLists", orderLists); 
		request.setAttribute("orderPageIndexList",orderPageIndexList); 
		
		return "admin/order/orderList";
		
	}
	
	@RequestMapping(value = "/admin/changeStep.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String OrderChangeStepData(AdminDTO dto,HttpServletRequest request) throws Exception{

		adminDAO.getUpdateStep(dto);
		
		return "admin/order/orderList";
		
	}
	
	@RequestMapping(value = "/admin/productRecommand.action")
	public String productRecommandChoice(AdminDTO dto,HttpServletRequest request) throws Exception{
		
		String qnaPageNum = request.getParameter("pageNum");
		int productRecommandDataCount = adminDAO.adminProductRecommandCount();
		int productQnaDataCount = adminDAO.adminProductQnaCount();
		int orderDataCount = adminDAO.getOrderListCount();
		int qnaDataCount = adminDAO.getQnaCount();
		int refundDataCount = adminDAO.getRefundCount();
		
		int currentPage = 1;
		
		if(qnaPageNum != null)
			currentPage = Integer.parseInt(qnaPageNum);
		
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage,productRecommandDataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<AdminDTO> lists = adminDAO.adminProductRecommandLists(start, end);

		String listUrl = "/dailychan/admin/productRecommand.action";
		
		String recommandPageIndexList =
				myUtil.pageIndexList(currentPage, totalPage, listUrl);

		request.setAttribute("recommandLists", lists);
		request.setAttribute("recommandPageIndexList", recommandPageIndexList);
		request.setAttribute("dataCount", productRecommandDataCount);
		request.setAttribute("refundDataCount", refundDataCount);
		request.setAttribute("qnaDataCount", qnaDataCount);
		request.setAttribute("productQnaDataCount", productQnaDataCount);
		request.setAttribute("orderDataCount", orderDataCount);
		
		
		return "admin/recommand/recommand";
		
	}
	
	@RequestMapping(value = "/admin/productRecommandList.action")
	public String productRecommandList() throws Exception{
		
		return "admin/recommand/recommandList";
		
	}
	
	@RequestMapping(value = "/admin/productRecommandConfirm.action")
	public String productRecommandConfirm(AdminDTO dto,HttpServletRequest request) throws Exception{
		
		String selectRecommand_id[] = request.getParameterValues("selectedRecommandIds[]") ;
		
		adminDAO.adminProductRecommandConfirm(selectRecommand_id);
		
		return "redirect:/admin/productRecommand.action";
		
	}
	
	@RequestMapping(value = "/admin/productRecommandSelect.action")
	public void productRecommandSelect(AdminDTO dto) throws Exception{
		
		adminDAO.adminProductRecommandSelect(dto.getJoin_addr1(), dto.getProductRecommand_id());
		adminDAO.recommandSelectPointInsert(dto.getJoin_id());
		
	}

}
