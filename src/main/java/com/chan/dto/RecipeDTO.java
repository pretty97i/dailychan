package com.chan.dto;

public class RecipeDTO {
	
	private int recipe_id;
	private String recipe_subject;
	
	private String recipe_mainSaveFileName;
	private String recipe_contentSaveFileName;
	
	private String join_id;
	
	
	
	
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	private String recipe_select;
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getRecipe_subject() {
		return recipe_subject;
	}
	public void setRecipe_subject(String recipe_subject) {
		this.recipe_subject = recipe_subject;
	}
	public String getRecipe_mainSaveFileName() {
		return recipe_mainSaveFileName;
	}
	public void setRecipe_mainSaveFileName(String recipe_mainSaveFileName) {
		this.recipe_mainSaveFileName = recipe_mainSaveFileName;
	}
	public String getRecipe_contentSaveFileName() {
		return recipe_contentSaveFileName;
	}
	public void setRecipe_contentSaveFileName(String recipe_contentSaveFileName) {
		this.recipe_contentSaveFileName = recipe_contentSaveFileName;
	}
	public String getRecipe_select() {
		return recipe_select;
	}
	public void setRecipe_select(String recipe_select) {
		this.recipe_select = recipe_select;
	}
	
	
	

}
