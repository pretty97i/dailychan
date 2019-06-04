package com.chan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.MainDTO;
import com.chan.dto.RecipeDTO;

public class MainDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}
	
	//=================고객추천=================
	public List<MainDTO> mainRecommandLists() {
		
		List<MainDTO> lists = sessionTemplate.selectList("mainMapper.mainRecommandLists");
		
		return lists;
		
	}
	
	public List<MainDTO> noticeList (){

		List<MainDTO> lists = sessionTemplate.selectList("mainMapper.noticeLists");

		return lists;


	}
	
	//=================best=================
	
	public List<MainDTO> getBestList(String secondSelect){
		
		List<MainDTO> lists = sessionTemplate.selectList("mainMapper.getBestLists",secondSelect);
		
		return lists;

	}
	
	//=================recipe=================
	//메인창에 레시피
	public RecipeDTO getMainRecipeFirst(){
		
		RecipeDTO dto = sessionTemplate.selectOne("mainMapper.getMainRecipeFirst");
		
		return dto;
		
	}
	
	public RecipeDTO getMainRecipeSecond(){
		
		RecipeDTO dto = sessionTemplate.selectOne("mainMapper.getMainRecipeSecond");
		
		return dto;
		
	}
	
	//=================오 감동!!================
	
	//리스트로 띄우기
	public List<MainDTO> Oimpression(){
		
		List <MainDTO> lists = sessionTemplate.selectList("mainMapper.Oimpression");
		
		return lists;

	}

}
