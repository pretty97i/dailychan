package com.chan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.chan.dao.CartDAO;
import com.chan.dao.JoinDAO;
import com.chan.dao.NaverLoginBO;
import com.chan.dto.EmailDTO;
import com.chan.dto.JoinDTO;

@Controller
public class JoinController {

	@Autowired
	@Qualifier("JoinDAO")
	JoinDAO dao;
	
	@Autowired
	@Qualifier("cartDAO")
	CartDAO cartDAO;
	
	/* NaverLoginBO */	
	@Autowired
	@Qualifier("naverLoginBO")
	NaverLoginBO naverLoginBO;
	
	@Autowired
	@Qualifier("kakaoLogin")
	KakaoController kakaoLogin;
	
	//ȸ������
	@RequestMapping(value = "/join/signUp.action")
	public String singUp(Model model, JoinDTO dto, HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {	

		String kakao_id = request.getParameter("id");
		String naver_id = request.getParameter("naver_id");
		String naver_name = request.getParameter("naver_name");
		String naver_email = request.getParameter("naver_email");

		//id ������ dto �������� �˻��ؾ���
		String join_id=null;
		
		if(naver_id!=null) {
			join_id = dao.checkUserId(naver_id);
		}else if(kakao_id!=null) { 
			join_id = dao.checkUserId(kakao_id);
		}
		
		// naver_id�� join_id���ؼ� ������ �̹� ���̵������Ұ��
			if (join_id!=null) {
	
				session.setAttribute("join_id", join_id);			
			
				return "redirect:/main.action";
	
			}else if(naver_id!=null || kakao_id != null ){	//���̹����̵�� �α��� ������ �����ͺ��̽��� ���� ���
				
				request.setAttribute("kakao_id", kakao_id);
				request.setAttribute("naver_id", naver_id);
				request.setAttribute("join_name", naver_name);
				request.setAttribute("join_email", naver_email);
			
			}

		return "join/signUp";

	}
	
	/*
	 @RequestMapping(value = "/join/kakao.action", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	    public String kakaoLogin(@RequestParam("code") String code) {
	        System.out.println(access_token);
	        return "join/kakao";
	    }
	 */

	// ���̵� �ߺ��˻�

	@RequestMapping(value = "join/checkUserId.action")
	public @ResponseBody String checkUserId(@ModelAttribute("JoinDTO") JoinDTO dto, Model model,
			HttpServletRequest request) throws Exception {

		String join_id = request.getParameter("join_id");
		String result = null;

		String temp_id = dao.checkUserId(join_id);

		if (temp_id == null) {

			result = "��� ������ ���̵��Դϴ�.";

		} else {

			result = "�̹� ������� ���̵��Դϴ�.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;
	}

	// ȸ������ �Ϸ�

		@RequestMapping(value = "/join/complete.action")
		public String signUp_ok(JoinDTO dto, HttpServletRequest request) {

			String naver_id = request.getParameter("naver_id");

			if (dto.getJoin_recommender() != "") {
				// ��õ���� �ִٸ�

				
				// ������ ����Ʈ
				dto.setJoin_point(5000);
				
				// ��õ�� ����Ʈ
		
				
				//��õ�� ����Ʈ ������ ���̹� ���̵� ���� ���
				if(naver_id==null || naver_id=="" || naver_id.equals("")) {
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					dao.insertData(dto);
					dao.JoinPoint(dto.getJoin_id());
				
				//��õ�� ����Ʈ�� ������ ���̹� ���̵� �ִ°��	
				}else{
					dao.insertNaverData(dto);
					dao.naverJoinPoint(dto.getJoin_id());
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					
				}
				
				dao.RecommendPointChange(dto.getJoin_recommender());
				
				dao.JoinPoint(dto.getJoin_recommender());
				
			} 
			
			
			if(dto.getJoin_recommender()=="" || dto.getJoin_recommender()==null){ // ��õ���� ���ٸ�
				
				dto.setJoin_point(0);
				
				//��õ�� ���� �׾Ʒε� ����
				if(naver_id==null || naver_id=="" || naver_id.equals("")) {
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					dao.insertData(dto);
				}else{	//��õ�� ���� �׾Ʒ� �ְ�
					
					dao.insertNaverData(dto);
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					System.out.println(dto.getJoin_id());
				}
				
			}
			
			dao.JoinCoupon(dto);
			
			return "/join/complete";
		}
	// �޴��� �ߺ��˻�

	@RequestMapping(value = "join/checkTelAlreadyExists.action", method = RequestMethod.POST)
	public @ResponseBody String checkTelAlreadyExists(HttpServletRequest request) throws Exception {

		String join_phone = request.getParameter("join_phone");
		String result = null;

		String temp_phone = dao.checkTelAlreadyExists(join_phone);

		if (temp_phone == null) {

			result = "��� ������ ����ó�Դϴ�.";

		} else {

			result = "�̹� ������� ����ó�Դϴ�.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;
	}

	// ��õ�� ���̵�

	@RequestMapping(value = "/join/checkRecommendId.action", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String checkRecommendId(@ModelAttribute("JoinDTO") JoinDTO dto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String join_id = request.getParameter("join_id");

		String result = null;

		String join_recommender = dao.checkRecommendId(join_id);

		if (join_recommender == null) {

			result = "��õ�� ���̵� �����ϴ�.";

		} else {

			result = "��õ�� ���̵� Ȯ�εǾ����ϴ�.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;

	}

	@RequestMapping(value = "/join/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		//īī���α���
		String url = kakaoLogin.getAuthorizationUrl(session);
		
		request.setAttribute("url", url);
		
		return "join/login";
	}

	@RequestMapping("/join/loginCheck.action")
	public ModelAndView loginCheck(@ModelAttribute JoinDTO dto, HttpSession session) {

		String join_id = dao.loginCheck(dto);
		ModelAndView mav = new ModelAndView();

		if (join_id != null) {
			
			int cartCount = cartDAO.getCartCount(join_id);
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("join_id", dto.getJoin_id());
			// session.setAttribute("join_name", dto.getJoin_name());

			mav.setView(new RedirectView("/dailychan/main.action"));
			
		} else {
			mav.setViewName("join/login");
			mav.addObject("msg", "fail");
		}

		return mav;

	}

	// �α׾ƿ�
	@RequestMapping(value = "/join/logout.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.getAttribute("join_id");
		session.removeAttribute("join_id");
		session.getAttribute("cartCount");
		session.removeAttribute("cartCount");

		session.invalidate();

		return "redirect:/main.action";

	}

	// ����ȭ��(�α���)
	@RequestMapping(value = "/join/list.action", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

		//īī��
		String url = kakaoLogin.getAuthorizationUrl(session);
		
		session.setAttribute("url", url);
		
		
		return "join/list";
	}

	// ���̵� ã��
	@RequestMapping(value = "/join/findUserIdForm.action", method = RequestMethod.GET)
	public String findUserIdForm(JoinDTO dto, HttpServletRequest request, HttpServletResponse response) {

		return "join/findUserIdForm";
	}

	@RequestMapping(value = "/join/findUserIdForm_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String findUserIdForm_ok(JoinDTO dto, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String join_name = request.getParameter("join_name");
		String join_phone = request.getParameter("join_phone");

		String join_ID = dao.findId(join_name, join_phone);

		return join_ID;
	}

	// ��й�ȣ ã��
	@RequestMapping(value = "/join/findPasswordForm.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String findPasswordForm() {

		return "join/findPasswordForm";
	}

	@RequestMapping(value = "/join/findPasswordForm_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String findPasswordForm_ok(JoinDTO dto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String join_id = request.getParameter("join_id");
		String join_email = request.getParameter("join_email");

		String join_password1 = dao.findPassword(join_id, join_email);

		return join_password1;
	}
	
	//ģ����õ
	@RequestMapping(value = "/join/recommend.action")
	public String friend (Model model, JoinDTO dto, HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {


		  String join_recommender = request.getParameter("recommend");
	        	
			
			request.setAttribute("join_recommender", join_recommender);	
		
		return "join/signUp";
		
	}
	
	@Autowired
	private JavaMailSender mailSender;
    @Autowired
    private EmailDTO email;
	     
	@RequestMapping(value="/join/searchPw.action", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String sendEmailAction (HttpServletRequest request) throws Exception {
	 
		String join_id = (String)request.getParameter("join_id");
		String join_email = (String)request.getParameter("join_email");
        String join_password = dao.findPassword(join_id, join_email);
 
        if(join_password!=null) {
        	
        	int ran = new Random().nextInt(100000) + 100000; //
        	join_password = String.valueOf(ran);
        	dao.newPassword(join_password,join_email,join_id);
        	
            email.setContent("��й�ȣ�� "+join_password+" �Դϴ�."); // �̸��Ϸ� ���� �޽���
	        email.setReceiver(join_email); // �޴����� �̸��� �ּ�
	        email.setSubject(join_id+"�� ��й�ȣ ã�� �����Դϴ�."); // �̸��Ϸ� ���� ����
         
	        try {
	        	
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject(email.getSubject());
	            messageHelper.setText(email.getContent());
	            messageHelper.setTo(email.getReceiver());
	            messageHelper.setFrom("wkddbswl900706@gmail.com"); // ������ ���� �ּ�(root-context.xml ���� ���������� ��������)
	           
	            //===���ϸ� ���� �� ���===
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
	            
	            //===���� ���� ���� �� ���===
	            //DataSource dataSource = new FileDataSource("C:\\Users\\itwill\\Desktop\\�����\\����.jpg");
	            //messageHelper.addAttachment(MimeUtility.encodeText("����.jpg", "UTF-8", "B"), dataSource);
	
	            mailSender.send(msg);
	        	
	        }catch(MessagingException e) {
	            System.out.println("MessagingException");
	            e.printStackTrace();
	        }
        
	        String message = "���� ���� �Ϸ�!!";
	        message = URLEncoder.encode(message, "UTF-8");
	
	        return message;
	        
	    }else {
	        
	    	String message = "���� ���� ����!!";
	    	message = URLEncoder.encode(message, "UTF-8");
	    	
	        return message;
	    }
	}
	
}
