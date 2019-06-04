package com.chan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chan.dao.RecipeDAO;
import com.chan.dto.RecipeDTO;
import com.chan.util.MyUtil;

@Controller
public class RecipeController {
	
	@Autowired
	@Qualifier("recipeDAO")
	RecipeDAO recipeDAO;
	
	@Autowired
	MyUtil myUtil;



	@RequestMapping(value = "/recipe/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String recipemain(HttpSession session,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/recipe");
		String cp = request.getContextPath();
		String join_id=(String)session.getAttribute("join_id");
		String categoryId = request.getParameter("categoryId");
		
		String recipe_select = request.getParameter("recipe_select");
	
		
		if(recipe_select!=null) {
			
			recipe_select = URLDecoder.decode(recipe_select, "UTF-8");
			
		}
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue != null){
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = recipeDAO.getRecipeDataCount(searchValue, recipe_select);
		
		//전체페이지수
		int numPerPage = 12;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		int result=0;
		List<RecipeDTO> lists = recipeDAO.getRecipeLists(start, end, searchValue,recipe_select);
	
		List<RecipeDTO> myrecipe=recipeDAO.onlymyList(join_id);

		String articleUrl = 
				cp + "/recipe/recipedetail.action?pageNum=" + currentPage+"&categoryId="+categoryId;
		//페이징 처리
		String param = "";
		
		if(searchValue!=null){
			param ="searchValue=" + URLEncoder.encode(searchValue,"UTF-8")+"&categoryId="+categoryId;
		}
		if(recipe_select==null) {
			String listUrl = cp + "/recipe/list.action?categoryId="+categoryId;
			
			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList",pageIndexList);
		}else {
			String listUrl = cp + "/recipe/list.action?categoryId="+categoryId+"&recipe_select="+recipe_select;
			
			String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("pageIndexList",pageIndexList);
		}
		

		
		
		
		if(myrecipe.size()==0) {
			result=0;
			
		}
		
		request.setAttribute("result", result);
		
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("lists", lists);
		
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("param", param);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("pageNum", pageNum);
		
		request.setAttribute("myrecipe", myrecipe);
		
		return "recipe/recipeMain";
		
	}
		
	@RequestMapping(value = "/recipe/recipedetail.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String recipedetail(RecipeDTO dto,HttpSession session,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		int recipe_id=Integer.parseInt(request.getParameter("recipe_id"));
		String categoryId=request.getParameter("categoryId");
		String join_id=(String)session.getAttribute("join_id");
		int result;
		dto=recipeDAO.getRecipeReadData(recipe_id);
		
		List<RecipeDTO> myrecipe=recipeDAO.onlymyList(join_id);
		
		Iterator<RecipeDTO> it=myrecipe.iterator();
		  
		  while(it.hasNext()) {
			  
			  RecipeDTO dto2=it.next();
			  
			  if(dto2.getRecipe_id()==dto.getRecipe_id() || dto2.getRecipe_id()==recipe_id) {
				  result=0;
				  request.setAttribute("result", result);
			  }
		  }
		
		request.setAttribute("myrecipe", myrecipe);
		request.setAttribute("dto", dto);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("recipe_id", recipe_id);
		
		return "recipe/recipeDetail";
		
	}
	
	@RequestMapping(value = "/recipe/insertmyrecipe.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertmyrecipe(RecipeDTO dto,HttpSession session,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		int recipe_id=Integer.parseInt(request.getParameter("recipe_id"));
		
		String join_id=(String)session.getAttribute("join_id");
		
	
		if(join_id==null) {
			return "redirect:/join/login.action";
		}
		
		String recipe_select=request.getParameter("recipe_select");
		
		dto.setJoin_id(join_id);
		dto.setRecipe_select(recipe_select);
		dto.setRecipe_id(recipe_id);
		
		List<RecipeDTO> lists= recipeDAO.onlymyList(join_id);
		
		Iterator<RecipeDTO> it=lists.iterator();

		while(it.hasNext()) {
			
			RecipeDTO vo=it.next();
			
			
			if(dto.getRecipe_id()==vo.getRecipe_id() || recipe_id==vo.getRecipe_id()) {
	
				return "";
			}
			
		}
		
		recipeDAO.insertMyrecipe(dto);

		return "";
		
	}
	

	@RequestMapping(value = "/recipe/myrecipe.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String myrecipe(RecipeDTO dto,HttpSession session,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String pageNum = request.getParameter("pageNum");
		String join_id=(String)session.getAttribute("join_id");
		
		if(join_id==null) {
			return "redirect:/login.action";
		}
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images/recipe");
		String cp = request.getContextPath();
		
		String categoryId = request.getParameter("categoryId");
		
		String recipe_select = request.getParameter("recipe_select");

		
		if(recipe_select!=null) {
			
			recipe_select = URLDecoder.decode(recipe_select, "UTF-8");
			
		}
		dto.setRecipe_select(recipe_select);
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
			
		//전체데이터갯수
		int dataCount = recipeDAO.getmyRecipeDataCount(join_id);
	
		//전체페이지수
		int numPerPage = 6;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end=currentPage*numPerPage;

		
		List<RecipeDTO> lists= recipeDAO.getmyRecipeLists(start, join_id, end,recipe_select);
		
		Iterator<RecipeDTO> it = lists.iterator();
		
		if(lists!=null) {

			while(it.hasNext()) {

				dto = it.next();

				dto.setJoin_id(dto.getJoin_id());
				dto.setRecipe_id(dto.getRecipe_id());
				dto.setRecipe_select(recipe_select);
				dto.setRecipe_subject(dto.getRecipe_subject());
				dto.setRecipe_mainSaveFileName(dto.getRecipe_mainSaveFileName());
				
			}
		}
		
		String articleUrl = 
				cp + "/recipe/myrecipe.action?pageNum=" + currentPage+"&categoryId="+categoryId;
		//페이징 처리
		String param = "categoryId="+categoryId+"&join_id="+join_id;
		
		String listUrl = cp + "/recipe/myrecipe.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		List<RecipeDTO> myrecipe=recipeDAO.getmyRecipeLists(start, join_id, end, recipe_select);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("lists", lists);
		request.setAttribute("myrecipe", myrecipe);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("path", path);
		request.setAttribute("param", param);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("pageNum", pageNum);

		return "recipe/myRecipe";
	}	

	@RequestMapping(value = "/recipe/deletemyrecipe.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deletemyrecipe(RecipeDTO dto,HttpSession session,Locale locale, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		int recipe_id=Integer.parseInt(request.getParameter("recipe_id"));
		
		
		recipeDAO.myRecipeDelete(recipe_id);
		
		
		return "redirect:/recipe/myrecipe.action?categoryId=0&join_id=admin";
		
	}

}
