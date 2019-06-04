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
	
	//회원가입
	@RequestMapping(value = "/join/signUp.action")
	public String singUp(Model model, JoinDTO dto, HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {	

		String kakao_id = request.getParameter("id");
		String naver_id = request.getParameter("naver_id");
		String naver_name = request.getParameter("naver_name");
		String naver_email = request.getParameter("naver_email");

		//id 가지고 dto 가져가서 검사해야함
		String join_id=null;
		
		if(naver_id!=null) {
			join_id = dao.checkUserId(naver_id);
		}else if(kakao_id!=null) { 
			join_id = dao.checkUserId(kakao_id);
		}
		
		// naver_id와 join_id비교해서 있으면 이미 아이디존재할경우
			if (join_id!=null) {
	
				session.setAttribute("join_id", join_id);			
			
				return "redirect:/main.action";
	
			}else if(naver_id!=null || kakao_id != null ){	//네이버아이디로 로그인 하지만 데이터베이스에 없을 경우
				
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

	// 아이디 중복검사

	@RequestMapping(value = "join/checkUserId.action")
	public @ResponseBody String checkUserId(@ModelAttribute("JoinDTO") JoinDTO dto, Model model,
			HttpServletRequest request) throws Exception {

		String join_id = request.getParameter("join_id");
		String result = null;

		String temp_id = dao.checkUserId(join_id);

		if (temp_id == null) {

			result = "사용 가능한 아이디입니다.";

		} else {

			result = "이미 사용중인 아이디입니다.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;
	}

	// 회원가입 완료

		@RequestMapping(value = "/join/complete.action")
		public String signUp_ok(JoinDTO dto, HttpServletRequest request) {

			String naver_id = request.getParameter("naver_id");

			if (dto.getJoin_recommender() != "") {
				// 추천인이 있다면

				
				// 가입자 포인트
				dto.setJoin_point(5000);
				
				// 추천인 포인트
		
				
				//추천인 포인트 있지만 네이버 아이디 없을 경우
				if(naver_id==null || naver_id=="" || naver_id.equals("")) {
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					dao.insertData(dto);
					dao.JoinPoint(dto.getJoin_id());
				
				//추천인 포인트가 있지만 네이버 아이디가 있는경우	
				}else{
					dao.insertNaverData(dto);
					dao.naverJoinPoint(dto.getJoin_id());
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					
				}
				
				dao.RecommendPointChange(dto.getJoin_recommender());
				
				dao.JoinPoint(dto.getJoin_recommender());
				
			} 
			
			
			if(dto.getJoin_recommender()=="" || dto.getJoin_recommender()==null){ // 추천인이 없다면
				
				dto.setJoin_point(0);
				
				//추천인 없고 네아로도 없고
				if(naver_id==null || naver_id=="" || naver_id.equals("")) {
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					dao.insertData(dto);
				}else{	//추천인 없고 네아로 있고
					
					dao.insertNaverData(dto);
					dto.setJoin_id(dto.getJoin_id().replace(",", ""));
					System.out.println(dto.getJoin_id());
				}
				
			}
			
			dao.JoinCoupon(dto);
			
			return "/join/complete";
		}
	// 휴대폰 중복검사

	@RequestMapping(value = "join/checkTelAlreadyExists.action", method = RequestMethod.POST)
	public @ResponseBody String checkTelAlreadyExists(HttpServletRequest request) throws Exception {

		String join_phone = request.getParameter("join_phone");
		String result = null;

		String temp_phone = dao.checkTelAlreadyExists(join_phone);

		if (temp_phone == null) {

			result = "사용 가능한 연락처입니다.";

		} else {

			result = "이미 사용중인 연락처입니다.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;
	}

	// 추천인 아이디

	@RequestMapping(value = "/join/checkRecommendId.action", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String checkRecommendId(@ModelAttribute("JoinDTO") JoinDTO dto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String join_id = request.getParameter("join_id");

		String result = null;

		String join_recommender = dao.checkRecommendId(join_id);

		if (join_recommender == null) {

			result = "추천인 아이디가 없습니다.";

		} else {

			result = "추천인 아이디가 확인되었습니다.";

		}

		result = URLEncoder.encode(result, "UTF-8");

		return result;

	}

	@RequestMapping(value = "/join/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		//카카오로그인
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

	// 로그아웃
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

	// 메인화면(로그인)
	@RequestMapping(value = "/join/list.action", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

		//카카오
		String url = kakaoLogin.getAuthorizationUrl(session);
		
		session.setAttribute("url", url);
		
		
		return "join/list";
	}

	// 아이디 찾기
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

	// 비밀번호 찾기
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
	
	//친구추천
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
        	
            email.setContent("비밀번호는 "+join_password+" 입니다."); // 이메일로 보낼 메시지
	        email.setReceiver(join_email); // 받는이의 이메일 주소
	        email.setSubject(join_id+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
         
	        try {
	        	
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject(email.getSubject());
	            messageHelper.setText(email.getContent());
	            messageHelper.setTo(email.getReceiver());
	            messageHelper.setFrom("wkddbswl900706@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
	           
	            //===메일만 보낼 시 사용===
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
	            
	            //===파일 같이 보낼 시 사용===
	            //DataSource dataSource = new FileDataSource("C:\\Users\\itwill\\Desktop\\고냥이\\헤헤.jpg");
	            //messageHelper.addAttachment(MimeUtility.encodeText("헤헤.jpg", "UTF-8", "B"), dataSource);
	
	            mailSender.send(msg);
	        	
	        }catch(MessagingException e) {
	            System.out.println("MessagingException");
	            e.printStackTrace();
	        }
        
	        String message = "메일 전송 완료!!";
	        message = URLEncoder.encode(message, "UTF-8");
	
	        return message;
	        
	    }else {
	        
	    	String message = "메일 전송 실패!!";
	    	message = URLEncoder.encode(message, "UTF-8");
	    	
	        return message;
	    }
	}
	
}
