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
	
	//=================����õ=================
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
	//����â�� ������
	public RecipeDTO getMainRecipeFirst(){
		
		RecipeDTO dto = sessionTemplate.selectOne("mainMapper.getMainRecipeFirst");
		
		return dto;
		
	}
	
	public RecipeDTO getMainRecipeSecond(){
		
		RecipeDTO dto = sessionTemplate.selectOne("mainMapper.getMainRecipeSecond");
		
		return dto;
		
	}
	
	//=================�� ����!!================
	
	//����Ʈ�� ����
	public List<MainDTO> Oimpression(){
		
		List <MainDTO> lists = sessionTemplate.selectList("mainMapper.Oimpression");
		
		return lists;

	}

}
