package com.chan.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.chan.dto.RecipeDTO;

public class RecipeDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}
	
	
	public int getRecipeMaxId(){
		
		int recipeMaxId = 0;
		
		recipeMaxId = sessionTemplate.selectOne("recipe.getRecipeMaxId");
		
		return recipeMaxId;
		
	}
	
	public void recipeInsertData(RecipeDTO dto) {
		
		sessionTemplate.insert("recipe.recipeInsertData",dto);
		
	}
	
	//��ü������
		public List<RecipeDTO> getRecipeLists(int start, int end, String searchValue,String recipe_select){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("start", start);
			params.put("end", end);
			params.put("searchValue", searchValue);
			params.put("recipe_select", recipe_select);
			
			List<RecipeDTO> lists = 
					sessionTemplate.selectList("recipe.getRecipeLists",params);
			
			return lists;
			
			
		}
		//��ü �����ͼ� ���ϱ�
		public int getRecipeDataCount(String searchValue,String recipe_select){
			
			int result = 0;
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("searchValue", searchValue);
			params.put("recipe_select", recipe_select);
			
			result = sessionTemplate.selectOne("recipe.getRecipeDataCount",params);
			
			return result;
		
		}
		
		
		
		
		

		
		public RecipeDTO getRecipeReadData(int recipe_id){
			
			RecipeDTO dto = sessionTemplate.selectOne("recipe.getRecipeReadData",recipe_id);
			
			return dto;
			
		}
		
		
		
		public void recipeDeleteData(int recipe_id){

			sessionTemplate.delete("recipe.recipeDeleteData",recipe_id);
		}
		
		
		
		
		
		//������ ������
		public void insertMyrecipe(RecipeDTO dto) {
			
			sessionTemplate.insert("recipe.insertMyrecipe",dto);
			
		}
		
		
		
		
		
		
		
		
		//��ü������
		public List<RecipeDTO> getmyRecipeLists(int start, String join_id,int end,String recipe_select){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("start", start);
			params.put("end", end);
			params.put("join_id", join_id);
			params.put("recipe_select", recipe_select);
			
			List<RecipeDTO> lists = 
					sessionTemplate.selectList("recipe.getmyRecipeLists",params);
			
			return lists;
			
			
		}



		//��ü �����ͼ� ���ϱ�
		public int getmyRecipeDataCount(String join_id){
			
			int result = 0;
			
				result = sessionTemplate.selectOne("recipe.getmyRecipeDataCount",join_id);
			
			return result;
		
		}
		
		public void myRecipeDelete(int recipe_id){

			sessionTemplate.delete("recipe.myRecipeDelete",recipe_id);
		}
		
		
		public List<RecipeDTO> onlymyList(String join_id){
			
			List<RecipeDTO> lists=sessionTemplate.selectList("recipe.onlymyList",join_id);
		
			return lists;
		}
		
		

}


















