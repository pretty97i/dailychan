package com.chan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.HelpDTO;

public class HelpDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}

	public int getMaxNum(){

		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("helpMapper.maxNum");

		return maxNum;
	}

	public void insertData(HelpDTO dto){

		sessionTemplate.insert("helpMapper.insertData",dto);
	}


	//전체데이터
	public List<HelpDTO> getList(int start, int end,
			String searchKey, String searchValue){

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);

		List<HelpDTO> lists = 
				sessionTemplate.selectList("helpMapper.getLists",params);

		return lists;


	}

	//전체 데이터수 구하기
	public int getDataCount(String searchKey,String searchValue){

		int result = 0;

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);

		result = sessionTemplate.selectOne("helpMapper.getDataCount",params);

		return result;

	}


	//한명의 데이터 출력
	public HelpDTO getReadData(int notice_id){

		HelpDTO dto = sessionTemplate.selectOne("helpMapper.getReadData",notice_id);

		return dto;

	}

	//삭제
	public void deleteData(int notice_id){

		sessionTemplate.delete("helpMapper.deleteData",notice_id);
	}

	
	
	//전체 데이터수 구하기
	public int faqDataCount(String faq_division){

		int result = 0;

		result = sessionTemplate.selectOne("helpMapper.faqDataCount",faq_division);

		return result;

	}


	//전체데이터
	public List<HelpDTO> faqGetLists(String faq_division,String search,int start,int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("faq_division", faq_division);
		params.put("search", search);
		params.put("start", start);
		params.put("end", end);
		
		
		List<HelpDTO> lists = sessionTemplate.selectList("helpMapper.faqGetLists",params);


		return lists;

	}




	//전체데이터
	public int dayBreak(String addr1){
		
		int result=0;

		result=sessionTemplate.selectOne("helpMapper.dayBreak",addr1);


		return result;

	}
	
	public int storeDelivery(String addr2){
		
		int result=0;

		result=sessionTemplate.selectOne("helpMapper.storeDelivery",addr2);


		return result;

	}


	//qna
	

	public int qnaMaxNum(){

		int maxNum = 0;

		maxNum = sessionTemplate.selectOne("helpMapper.qnaMaxNum");

		return maxNum;
	}
	
	
	
	public void insertqna(HelpDTO dto){

		sessionTemplate.insert("helpMapper.insertqna",dto);
	}
	
	//전체 데이터수 구하기
	public int qnagetDataCount(){

		int result = 0;
		
		result = sessionTemplate.selectOne("helpMapper.qnagetDataCount");

		return result;

	}
	
	public List<HelpDTO> qnaGetLists(int start,int end,String join_id){

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("start", start);
		params.put("end", end);
		params.put("join_id", join_id);
		
		List<HelpDTO> lists = sessionTemplate.selectList("helpMapper.qnaGetLists",params);


		return lists;

	}

	//한명의 데이터 출력
	public HelpDTO qnaGetReadData(int qna_id){

		HelpDTO dto = sessionTemplate.selectOne("helpMapper.qnaGetReadData",qna_id);

		return dto;

	}
	
	//삭제
	public void qnadeleteData(int qna_id){

		sessionTemplate.delete("helpMapper.qnadeleteData",qna_id);
	}
	
	//리플달기
	public void qnaAdminReply(HelpDTO dto){

		sessionTemplate.update("helpMapper.qnaAdminReply", dto);
		
	}
	
}
