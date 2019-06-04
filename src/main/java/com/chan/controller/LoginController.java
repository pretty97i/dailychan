package com.chan.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chan.dao.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller	
public class LoginController {
	
	/* NaverLoginBO */	
	@Autowired
	@Qualifier("naverLoginBO")
	NaverLoginBO naverLoginBO;
	
	@Autowired
	@Qualifier("kakaoLogin")
	KakaoController kakaoLogin;
	
    private String apiResult = null;

    //�α��� ù ȭ�� ��û �޼ҵ�
    @RequestMapping(value = "/join/naverlogin.action", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        System.out.println("���̹�:" + naverAuthUrl);
        
        //���̹� 
        model.addAttribute("url", naverAuthUrl);

        /* ������ ���� URL�� View�� ���� */
        return "join/naverLogin";
    }

    //���̹� �α��� ������ callbackȣ�� �޼ҵ�
    @RequestMapping(value = "/join/naverlogin_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
    	
        System.out.println("����� callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //�α��� ����� ������ �о�´�.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
    
        return "join/naverSuccess";
    }

    
    @RequestMapping(value = "/join/kakao_ok.action")
    
    public String getKakaoSignIn(ModelMap model,@RequestParam("code") String code, HttpSession session) throws Exception {
   
      JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);

      String kakao_id = userInfo.get("id").toString();
    
		/*
		 * if(userInfo.get("kaccount_email").toString() != "" ||
		 * userInfo.get("kaccount_email").toString() != null) {
		 * 
		 * String email = userInfo.get("kaccount_email").toString();
		 * model.addAttribute("email", email);
		 * 
		 * }
		 */
      
      model.addAttribute("k_userInfo", userInfo);
      model.addAttribute("id", kakao_id);


      return "redirect:/join/signUp.action";
    }


}
