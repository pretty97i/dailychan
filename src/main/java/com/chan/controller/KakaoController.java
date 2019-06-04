package com.chan.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class KakaoController {

	private final static String K_CLIENT_ID = "9fb25c19eb21ced1df9522dd786606f4";
    private final static String K_REDIRECT_URI = "http://192.168.16.7:8080/dailychan/join/kakao_ok.action";

    public String getAuthorizationUrl(HttpSession session) {

      String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
          + "client_id=" + K_CLIENT_ID + "&redirect_uri="
          + K_REDIRECT_URI + "&response_type=code";
      return kakaoUrl;
    }

    public String getAccessToken(String autorize_code) {

    	ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = sra.getRequest();
        HttpSession session = request.getSession();
    	
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값

        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;
      
      try {

        post.setEntity(new UrlEncodedFormEntity(postParams));
        final HttpResponse response = client.execute(post);
        final int responseCode = response.getStatusLine().getStatusCode();

        // JSON 형태 반환값 처리

        ObjectMapper mapper = new ObjectMapper();
        returnNode = mapper.readTree(response.getEntity().getContent());

        session.setAttribute("token", returnNode.get("access_token").toString());

      } catch (UnsupportedEncodingException e) {

        e.printStackTrace();

      } catch (ClientProtocolException e) {

        e.printStackTrace();

      } catch (IOException e) {

        e.printStackTrace();

      } finally {
        // clear resources
      }
      return returnNode.get("access_token").toString();
    }

    public JsonNode getKakaoUserInfo(String autorize_code) {

      final String RequestUrl = "https://kapi.kakao.com/v1/user/me";
      //String CLIENT_ID = K_CLIENT_ID; // REST API KEY
      //String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
      String code = autorize_code; // 로그인 과정중 얻은 토큰 값
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);
      String accessToken = getAccessToken(autorize_code);

      // add header
      post.addHeader("Authorization", "Bearer " + accessToken);
      
      JsonNode returnNode = null;

      try {

        final HttpResponse response = client.execute(post);
        final int responseCode = response.getStatusLine().getStatusCode();
        //System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
        //System.out.println("Response Code : " + responseCode);

        // JSON 형태 반환값 처리
        ObjectMapper mapper = new ObjectMapper();
        returnNode = mapper.readTree(response.getEntity().getContent());
      } catch (UnsupportedEncodingException e) {

        e.printStackTrace();
      } catch (ClientProtocolException e) {

        e.printStackTrace();
      } catch (IOException e) {

        e.printStackTrace();
      } finally {

        // clear resources
      }
      return returnNode;
    }
    
    //카카오 로그아웃
    public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
 
        final HttpClient client = HttpClientBuilder.create().build();

        final HttpPost post = new HttpPost(RequestUrl);

        post.addHeader("Authorization", "Bearer " + autorize_code);

        JsonNode returnNode = null;
 
        try {
 
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
            
            System.out.println("client1 : " + client);
            System.out.println("Response Code : " + responseCode);
            //여기서 응답코드가 400 Bad Request
            //이 응답은 잘못된 문법으로 인하여 서버가 요청을 이해할 수 없음
            
            ObjectMapper mapper = new ObjectMapper();

            returnNode = mapper.readTree(response.getEntity().getContent());

            System.out.println("returnNode :" + returnNode);	
            //토근이 만료가 되었을때 code;-2가 뜨는데 지금 토근 만료되어있다고 뜸  
            
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }

	
}
