package com.chan.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.servlet.ModelAndView;

import com.chan.dao.HelpDAO;
import com.chan.dto.HelpDTO;
import com.chan.util.MyUtil;

@Controller
public class HelpController {
	
	@Autowired
	@Qualifier("helpDAO")//그냥 쓰심
	HelpDAO helpDAO;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main";
	}

	@RequestMapping(value = "/help/helpmain.action", method ={RequestMethod.POST, RequestMethod.GET})
	public String helpmain(HelpDTO dto,HttpServletRequest request) throws Exception{	
		
		return "help/faqmain";
	}
	
	//===============================공지사항=============================
	//위에꺼랑 같은 역할
	@RequestMapping(value = "/help/noticeRegister.action")
	public ModelAndView created() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/notice/noticeRegister");
		
		return mav;
	}
	
	//_ok는 post 방식으로 온다
	//메소드명은 같아도 에러가 안나는 이유는 매개변수가 달라서 오버로딩되기 때문에
	@RequestMapping(value = "/help/noticeRegister_ok.action", method = {RequestMethod.POST})
	public String noticeRegister_ok(HelpDTO dto,HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;	
	
		int maxNum = helpDAO.getMaxNum();
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "notice" + File.separator;

		File f= new File(path);
		if(!f.exists()){
			
			f.mkdirs();
			
		}

		Iterator<String> iterator = mr.getFileNames();
		
		int i = 0;
		
			i++;
			String uploadFileName = iterator.next(); 
			//next()를 해주면 커서가 움직여서 iterator안에 들어있는 요소. 즉 여기서는 name을 가져온다.

			MultipartFile mFile = mr.getFile(uploadFileName);
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
				saveFileName = "\\"+formatter.format(now.getTime()) + "." + extension;
				//saveFileName에 날짜+.+확장자명으로 저장시킴.
				
				try {
								
					mFile.transferTo(new File(path + saveFileName));
					
				} catch (Exception e) {
					
				}
			}

		dto.setNotice_saveFileName(saveFileName);
		
		dto.setNotice_id(maxNum+1);
	 
		helpDAO.insertData(dto);
	
		
		request.setAttribute("path", path);
		request.setAttribute("saveFileName",  saveFileName);
		
		return "redirect:/help/notice.action";
	}
	
	@RequestMapping(value = "/help/notice.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey == null){
			
			searchKey = "notice_subject";
			searchValue = "";
			
		}else{
			
			if(request.getMethod().equalsIgnoreCase("eGET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = helpDAO.getDataCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<HelpDTO> lists =
				helpDAO.getList(start, end, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/help/notice.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/help/noticeArticle.action?pageNum=" + currentPage;
			
			
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("saveFileName", request.getParameter("saveFileName"));
	
		return "help/notice/noticeList";
		
	}
	
	/*
	@RequestMapping(value = "/article.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String article(HttpServletRequest request,HttpServletResponse response) throws Exception{
	*/
	@RequestMapping(value = "/help/noticeArticle.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView article(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "notice" + File.separator;

		int notice_id = Integer.parseInt(request.getParameter("notice_id"));
		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		
		HelpDTO dto = helpDAO.getReadData(notice_id);
		
		
		if(dto==null){
			//return "redirect:/list.action"; ModelAndView방식이 아니라 주석쓰 
		}
		

		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("help/notice/noticeArticle");//view
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("pageNum",pageNum);//model아이들
		mav.addObject("path",path);
		mav.addObject("saveFileName",dto.getNotice_saveFileName());
		
		return mav;
	}
	
	@RequestMapping(value = "/help/noticeDelete.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleted(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		int notice_id = Integer.parseInt(request.getParameter("notice_id"));
		String pageNum = request.getParameter("pageNum");
		
		helpDAO.deleteData(notice_id);
		
		return "redirect:/help/notice.action?pageNum=" + pageNum;
	}
	
	//끝===============================공지사항=============================
	
	
	//=================================faq리스트============================
	@RequestMapping(value = "/help/faqlist.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String faqlist(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "help/faq/faqList";
	}
	

	@RequestMapping(value = "/help/faqbox.action", method =  {RequestMethod.GET,RequestMethod.POST})
	public String faqbox(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String faq_division=request.getParameter("faq_division");
		String search=request.getParameter("search");
		String pageNum = request.getParameter("pageNum");
	
		int currentPage = 1;
		
		try {
			
			if(pageNum != null) {

				currentPage = Integer.parseInt(pageNum);
				
			}
			
		}catch (NumberFormatException e){
			System.out.println(e.toString());
			
		}

		//전체데이터갯수
		int dataCount = helpDAO.faqDataCount(faq_division);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;	

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		dto.setFaq_division(faq_division);

		List<HelpDTO> lists=helpDAO.faqGetLists(faq_division, search, start, end);
		
		Iterator<HelpDTO> it = lists.iterator();
		
		while(it.hasNext()) {
			
			HelpDTO vo = it.next();
			vo.setFaq_content(vo.getFaq_content().replaceAll("\n", "<br/>"));
			
		}
		
		String cp = request.getContextPath();

		String listUrl = cp + "/help/faqlist.action";
	
		String pageIndexList =
			myUtil.faqPageIndexList(currentPage, totalPage, listUrl, "faqselect", faq_division);

		
		request.setAttribute("lists", lists);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("pageNum", pageNum);
	
		return "help/faq/test";
	}

	
	//끝=================================faq리스트============================
	
	
	@RequestMapping(value = "/help/deliveryrule.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deliveryrule(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "help/serviceList/deliveryRule";
	}
	
	@RequestMapping(value = "/help/cancelrule.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String cancelrule(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "help/serviceList/cancelRule";
	}

	@RequestMapping(value = "/help/selfrefund.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String selfrefund(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "help/serviceList/selfRefund";
	}	

	@RequestMapping(value = "/help/selfrefundDetail.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String selfrefundDetail(HelpDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		return "help/serviceList/selfRefundDetail";
	}	

	@RequestMapping(value = "/event/promotion/deliveryevent.action", method = RequestMethod.GET)
	public String deliveryevent(Locale locale, Model model) {

		return "event/deliveryEvent"; }
	
	
	@RequestMapping(value = "/event/deliveryarea.action", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String deliveryarea(HttpServletRequest request,Locale locale, Model model) {

		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		
		int result = 0;

		if(addr1!=null) {
		
			result = helpDAO.dayBreak(addr1);
			return String.valueOf(result);
			
		}

		if(addr2!=null) {
			
			result = helpDAO.storeDelivery(addr2);
			return String.valueOf(result);
			
		}
		
		return "";
	
	}
	
	//=================================1:1문의============================
	@RequestMapping(value = "/help/qnalist.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnalist(HttpSession session,HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {		
		
		String join_id = (String)session.getAttribute("join_id");
		
		if(join_id==null) {
			return "redirect:/join/login.action";
		}
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		//전체데이터갯수
		int dataCount = helpDAO.qnagetDataCount();
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<HelpDTO> lists =helpDAO.qnaGetLists(start, end, join_id);
		
		//페이징 처리
		
		String listUrl = cp + "/help/qnalist.action";

		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/help/qnaArticle.action?pageNum=" + currentPage;		
			
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("saveFileName", request.getParameter("saveFileName"));
		request.setAttribute("pageNum", pageNum);
		
		
		return "help/qnaList/qnaList"; 		
	}	

	@RequestMapping(value = "/help/qnaregister.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaregister(HttpSession session,HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {

		String join_id = (String)session.getAttribute("join_id");
		
		if(join_id==null) {
			return "redirect:/join/login.action";
		}		
		
		return "help/qnaList/qnaregister"; 	
	}
	
	@RequestMapping(value = "/help/qnaregister_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaregister_ok(HttpSession session,HelpDTO dto,MultipartHttpServletRequest request,Locale locale, Model model) {
	
		String join_id = (String)session.getAttribute("join_id");
		String qna_select=request.getParameter("qna_select");
		String qna_type=request.getParameter("qna_type");
		
		String qna_state="미답변";
		
		//MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;	
	
		int maxNum = helpDAO.qnaMaxNum();

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

		dto.setQna_saveFileName(saveFileName);
		
		dto.setQna_id(maxNum+1);
		dto.setQna_select(qna_select);
		
		String qna_store=request.getParameter("qna_store");

		if(qna_type.equals("2")) {			
			
			dto.setQna_store(qna_store);
			dto.setQna_type("매장에 직접문의");			
			
		}else {
			if(qna_store==null) {
				dto.setQna_type("일반문의");
				dto.setQna_store("");
			}
		}
		String qna_content=request.getParameter("qna_content");
		qna_content=qna_content.replace("\r\n", "<br>");
		
		dto.setQna_content(qna_content);
		dto.setQna_state(qna_state);
		dto.setJoin_id(join_id);
		
		helpDAO.insertqna(dto);	
		
		request.setAttribute("path", path);
		request.setAttribute("saveFileName",  saveFileName);		
		
		return "redirect:/help/qnalist.action"; 
		
	}
	
	@RequestMapping(value = "/help/qnaArticle.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaArticle(HttpSession session,HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {

		String join_id = (String)session.getAttribute("join_id");
		
		if(join_id==null) {
			return "redirect:/join/login.action";
		}
		

		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + File.separator + "resources" + File.separator + "images" + File.separator + "recipe" + File.separator;
		
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		String pageNum = request.getParameter("pageNum");		
		
		dto = helpDAO.qnaGetReadData(qna_id);	

		String param = "?pageNum=" + pageNum;
	
		request.setAttribute("dto",dto);
		request.setAttribute("param",param);
		request.setAttribute("path",path);
		request.setAttribute("saveFileName",dto.getQna_saveFileName());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("qna_id", qna_id);

		return "help/qnaList/qnaArticle";
	}
	
	@RequestMapping(value = "/help/qnaArticle_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaArticle_ok(HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {
			
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		String pageNum=request.getParameter("pageNum");
		String qna_reply=request.getParameter("qna_reply");
		qna_reply=qna_reply.replace("\r\n", "<br>");
		
		dto.setQna_reply(qna_reply);
		dto.setQna_state("답변완료");
		
		helpDAO.qnaAdminReply(dto);	
		
		return "redirect:/help/qnaArticle.action?qna_id="+qna_id+"&pageNum="+pageNum;
	}
	
	@RequestMapping(value = "/help/qnaArticlereplydel.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaArticlereplydel(HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {
		
		String pageNum=request.getParameter("pageNum");
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		
		dto.setQna_state("미답변");
		dto.setQna_reply("");
		
		
		helpDAO.qnaAdminReply(dto);
		
	
		return "redirect:/help/qnaArticle.action?qna_id="+qna_id+"&pageNum="+pageNum;
	}

	
		@RequestMapping(value = "/help/qnadelete.action", method = {RequestMethod.GET,RequestMethod.POST})
		public String qnadelete(HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {
	
			int qna_id=Integer.parseInt(request.getParameter("qna_id"));
			
			helpDAO.qnadeleteData(qna_id);
	
		return "redirect:/help/qnalist.action"; 
	
}
	//끝=================================1:1문의============================

	
		
		
		
		
		
		
	
}









