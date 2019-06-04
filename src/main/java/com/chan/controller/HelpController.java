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
	@Qualifier("helpDAO")//�׳� ����
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
	
	//===============================��������=============================
	//�������� ���� ����
	@RequestMapping(value = "/help/noticeRegister.action")
	public ModelAndView created() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/notice/noticeRegister");
		
		return mav;
	}
	
	//_ok�� post ������� �´�
	//�޼ҵ���� ���Ƶ� ������ �ȳ��� ������ �Ű������� �޶� �����ε��Ǳ� ������
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
			//next()�� ���ָ� Ŀ���� �������� iterator�ȿ� ����ִ� ���. �� ���⼭�� name�� �����´�.

			MultipartFile mFile = mr.getFile(uploadFileName);
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
				saveFileName = "\\"+formatter.format(now.getTime()) + "." + extension;
				//saveFileName�� ��¥+.+Ȯ���ڸ����� �����Ŵ.
				
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
		
		//��ü�����Ͱ���
		int dataCount = helpDAO.getDataCount(searchKey, searchValue);
		
		//��ü��������
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<HelpDTO> lists =
				helpDAO.getList(start, end, searchKey, searchValue);
		
		//����¡ ó��
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
		
		//�ۺ��� �ּ� ����
		String articleUrl = 
			cp + "/help/noticeArticle.action?pageNum=" + currentPage;
			
			
		//������ �� �������� �����͸� �ѱ��
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
			//return "redirect:/list.action"; ModelAndView����� �ƴ϶� �ּ��� 
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
		mav.addObject("pageNum",pageNum);//model���̵�
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
	
	//��===============================��������=============================
	
	
	//=================================faq����Ʈ============================
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

		//��ü�����Ͱ���
		int dataCount = helpDAO.faqDataCount(faq_division);
		
		//��ü��������
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

	
	//��=================================faq����Ʈ============================
	
	
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
	
	//=================================1:1����============================
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
		
		//��ü�����Ͱ���
		int dataCount = helpDAO.qnagetDataCount();
		
		//��ü��������
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<HelpDTO> lists =helpDAO.qnaGetLists(start, end, join_id);
		
		//����¡ ó��
		
		String listUrl = cp + "/help/qnalist.action";

		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//�ۺ��� �ּ� ����
		String articleUrl = 
			cp + "/help/qnaArticle.action?pageNum=" + currentPage;		
			
		//������ �� �������� �����͸� �ѱ��
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
		
		String qna_state="�̴亯";
		
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

		dto.setQna_saveFileName(saveFileName);
		
		dto.setQna_id(maxNum+1);
		dto.setQna_select(qna_select);
		
		String qna_store=request.getParameter("qna_store");

		if(qna_type.equals("2")) {			
			
			dto.setQna_store(qna_store);
			dto.setQna_type("���忡 ��������");			
			
		}else {
			if(qna_store==null) {
				dto.setQna_type("�Ϲݹ���");
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
		dto.setQna_state("�亯�Ϸ�");
		
		helpDAO.qnaAdminReply(dto);	
		
		return "redirect:/help/qnaArticle.action?qna_id="+qna_id+"&pageNum="+pageNum;
	}
	
	@RequestMapping(value = "/help/qnaArticlereplydel.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaArticlereplydel(HelpDTO dto,HttpServletRequest request,Locale locale, Model model) {
		
		String pageNum=request.getParameter("pageNum");
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		
		dto.setQna_state("�̴亯");
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
	//��=================================1:1����============================

	
		
		
		
		
		
		
	
}









