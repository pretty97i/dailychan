package com.chan.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.chan.dto.JoinDTO;
@Repository("JoinDAO")
public class JoinDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	//쿠폰삽입
	public void JoinCoupon(JoinDTO dto){
		
		sessionTemplate.insert("JoinMapper.JoinCoupon",dto);
	
	}
	
	//1.삽입
	public void insertData(JoinDTO dto) {
		

		sessionTemplate.insert("JoinMapper.insertData",dto);
	}
	
	//1.네이버 삽입
	public void insertNaverData(JoinDTO dto) {
		

		sessionTemplate.insert("JoinMapper.insertNaverData",dto);
	}
	
	//추천
	public String checkRecommendId(String join_id) {
			
		return sessionTemplate.selectOne("JoinMapper.checkRecommendId",join_id);
		
	}
	
	//네아로 가입여부 확인
	public String naverCheck(String join_id) {
		
		return sessionTemplate.selectOne("JoinMapper.naverCheck",join_id);
	}
	
	
	//회원가입시 추천인 자동으로 point지급
	/*
	 * public void RecommendIdPoint(JoinDTO dto) {
	 * 
	 * sessionTemplate.insert("JoinMapper.RecommendIdPoint",dto); }
	 */
	
	public void RecommendPointChange(String join_id) {
	  
	  sessionTemplate.update("JoinMapper.recommenderPointUpdate", join_id); 
	  
	}
	 
	//회원가입 포인트 적립
	public void JoinPoint(String join_id) {
		
		sessionTemplate.insert("JoinMapper.joinPoint",join_id);
	}
	
	
	public void naverJoinPoint(String join_id) {
		
		sessionTemplate.insert("JoinMapper.naverJoinPoint",join_id);
	}
	
	
	//2.로그인
	public String loginCheck(JoinDTO dto) {		
		
		return sessionTemplate.selectOne("JoinMapper.loginCheck",dto);
		
	}
	//3.한개의 데이터 읽어오기
	public JoinDTO getReadData(String str) {
		
		JoinDTO dto = sessionTemplate.selectOne("JoinMapper.recommenderReadData",str);
		return dto;
		
	}
	//4.아이디 중복검사
	public String checkUserId(String join_id) {
		
		return sessionTemplate.selectOne("JoinMapper.checkUserId",join_id);
		
	}

	//5.휴대폰 중복검사
	public String checkTelAlreadyExists(String join_phone) {
		
		return sessionTemplate.selectOne("JoinMapper.checkTelAlreadyExists",join_phone);
		
	}
	
	//비밀번호 찾기
	
	public String findPassword(String join_id,String join_email) throws Exception{
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("join_id", join_id);
		hMap.put("join_email", join_email);
		
		String st = sessionTemplate.selectOne("JoinMapper.findPasswordChecked",hMap);
		
		
		return  st;
		
	}
	//아이디 찾기
	
	public String findId(String join_name,String join_phone) throws Exception{
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("join_name", join_name);
		hMap.put("join_phone", join_phone);
		
		String fd = sessionTemplate.selectOne("JoinMapper.findcheckId",hMap);

		return fd;
		
	}
	
	public String newPassword (String join_password, String join_email, String join_id) throws Exception{
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("join_id", join_id);
		hMap.put("join_email", join_email);
		hMap.put("join_password", join_password);
		
		return sessionTemplate.selectOne("JoinMapper.newPassword",hMap);
		
	}
	
}
