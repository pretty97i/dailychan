package com.chan.util;

import java.text.DecimalFormat;

public class MyUtil {
	
	//전체 페이지수 구하기
	//numPerPage : 한화면에 표시할 데이터의 갯수
	//dataCount : 전체 데이터의 갯수
	public int getPageCount(int numPerPage, int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;	
		
	}
	
	//페이징 처리 메소드
	//currentPage :현재 표시할 페이지
	//totalPage : 전체 페이지수
	//listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl){
		
		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";
		
		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		//◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0){
						
			sb.append("<a class=\"on\" href=\"" + listUrl + "pageNum=" 
					+ currentPageSetup + "\">◀이전</a>&nbsp;");
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			
			if(page == currentPage){				
				
				sb.append("<a class=\"on\" color=\"Fuchsia\">" + page + "</a>&nbsp;");				
			
			}else{
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">"
						+ page + "</a>&nbsp;");
				
			}
			
			page++;
			
		}		
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlock){
						
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
			
		}
		
		
		return sb.toString();
		
	}
	
	//3번째 자리마 콤마찍기
	public String toNumFormat(int num) {
		
		  DecimalFormat df = new DecimalFormat("#,###");
		  return df.format(num);
		  
	}
	
	
	//DataList Method
	public String DataPageIndexList(int currentPage, int totalPage, String listUrl, String functionName){
		
		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";
		
		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		//◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0){
						
			sb.append("<a class=\"on\" href=\"javascript:"+functionName+"('"+currentPage+"')\">◀이전</a>&nbsp;");
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			
			if(page == currentPage){				
				
				sb.append("<a class=\"on\" color=\"Fuchsia\">" + page + "</a>&nbsp;");				
			
			}else{
				
				sb.append("<a href=\"javascript:"+functionName+"('"+page+"')\">"
						+ page + "</a>&nbsp;");
				
			}
			
			page++;
			
		}		
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlock){
						
			sb.append("<a href=\"javascript:"+functionName+"('"+currentPage+"')\">다음▶</a>&nbsp;");
			
		}
		
		
		return sb.toString();
		
	}
	
	//QnaPageIndexList
	public String qnaPageIndexList(int currentPage, int totalPage, String listUrl, String function, int product_id){
		
		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";
		
		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		//◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0){
						
			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\',\'" + product_id + "\'); return false;\">◀이전</a>&nbsp;");
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			
			if(page == currentPage){				
				
				sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\',\'" + product_id + "\'); return false;\">" + page + "</a>&nbsp;");				
			
			}else{
				
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + product_id + "\'); return false;\">"
						+ page + "</a>&nbsp;");
				
			}
			
			page++;
			
		}		

		//다음▶
		if(totalPage - currentPageSetup > numPerBlock){

			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + product_id + "\'); return false;\">다음▶</a>&nbsp;");

		}

		return sb.toString();

	}

	//QnaPageIndexMyList
	public String qnaPageIndexMyList(int currentPage, int totalPage, String listUrl, String function, int product_id, String join_id){

		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;

		StringBuffer sb = new StringBuffer();

		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";

		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";

		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;

		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		//◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0){

			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\',\'" + product_id + "\',\'" + join_id + "\'); return false;\">◀이전</a>&nbsp;");

		}

		//바로가기 페이지
		page = currentPageSetup + 1;

		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){

			if(page == currentPage){				

				sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\',\'" + product_id + "\',\'" + join_id + "\'); return false;\">" + page + "</a>&nbsp;");				

			}else{

				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + product_id + "\',\'" + join_id + "\'); return false;\">"
						+ page + "</a>&nbsp;");

			}

			page++;

		}		

		//다음▶
		if(totalPage - currentPageSetup > numPerBlock){

			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + product_id + "\',\'" + join_id + "\'); return false;\">다음▶</a>&nbsp;");

		}

		return sb.toString();

	}
	
	//AdminQnaPageIndexList
	public String adminQnaPageIndexList(int currentPage, int totalPage, String listUrl, String function){

		int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;

		StringBuffer sb = new StringBuffer();

		if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
			return "";

		//abc.jsp?a=1
		if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";

		//표시할 첫 페이지의 – 1 해준 값
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;

		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		//◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0){

			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\'); return false;\">◀이전</a>&nbsp;");

		}

		//바로가기 페이지
		page = currentPageSetup + 1;

		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){

			if(page == currentPage){				

				sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\'); return false;\">" + page + "</a>&nbsp;");				

			}else{

				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\'); return false;\">"
						+ page + "</a>&nbsp;");

			}

			page++;

		}		

		//다음▶
		if(totalPage - currentPageSetup > numPerBlock){

			sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\'); return false;\">다음▶</a>&nbsp;");

		}

		return sb.toString();

	}
	
	//CouponIndexList
		public String couponIndexList(int currentPage, int totalPage, String listUrl, String function,String search_join_id){
			
			int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
			int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
			int page;
			
			StringBuffer sb = new StringBuffer();
			
			if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
				return "";
			
			//abc.jsp?a=1
			if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
				listUrl = listUrl + "&";
			else
				listUrl = listUrl + "?";
			
			//표시할 첫 페이지의 – 1 해준 값
			currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
			
			if(currentPage % numPerBlock == 0)
				currentPageSetup = currentPageSetup - numPerBlock;
			
			//◀이전
			if(totalPage > numPerBlock && currentPageSetup > 0){
							
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup +"\', \'" + search_join_id + "\');return false;\">◀이전</a>&nbsp;");
				
			}
			
			//바로가기 페이지
			page = currentPageSetup + 1;
			
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				
				if(page == currentPage){				
					
					sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\', \'" + search_join_id + "\'); return false;\">" + page + "</a>&nbsp;");				
				
				}else{
					
					sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\', \'" + search_join_id +"\', \'" + search_join_id +"\'); return false;\">"
							+ page + "</a>&nbsp;");
					
				}
				
				page++;
				
			}		
			
			//다음▶
			if(totalPage - currentPageSetup > numPerBlock){
							
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\', \'" + search_join_id +"\'); return false;\">다음▶</a>&nbsp;");
				
			}
			
			return sb.toString();
			
		}

	//lastCouponIndexList
		public String lastCouponIndexList(int currentPage, int totalPage, String listUrl, String function){
			
			int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
			int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
			int page;
			
			StringBuffer sb = new StringBuffer();
			
			if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
				return "";
			
			//abc.jsp?a=1
			if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
				listUrl = listUrl + "&";
			else
				listUrl = listUrl + "?";
			
			//표시할 첫 페이지의 – 1 해준 값
			currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
			
			if(currentPage % numPerBlock == 0)
				currentPageSetup = currentPageSetup - numPerBlock;
			
			//◀이전
			if(totalPage > numPerBlock && currentPageSetup > 0){
							
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\'); return false;\">◀이전</a>&nbsp;");
				
			}
			
			//바로가기 페이지
			page = currentPageSetup + 1;
			
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				
				if(page == currentPage){				
					
					sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\');return false;\">" + page + "</a>&nbsp;");				
				
				}else{
					
					sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\');return false;\">"
							+ page + "</a>&nbsp;");
					
				}
				
				page++;
				
			}		
			
			//다음▶
			if(totalPage - currentPageSetup > numPerBlock){
							
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\');return false;\">다음▶</a>&nbsp;");
				
			}
			
			return sb.toString();
			
		}
		

		//FaqPageIndexList
			public String faqPageIndexList(int currentPage, int totalPage, String listUrl, String function, String faq_division){
			
			int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
			int currentPageSetup; //표시할 첫 페이지(6)의 ? 1 해준 값(5,10,15,20...)
			int page;
			
			StringBuffer sb = new StringBuffer();
			
			if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
				return "";
			
			//abc.jsp?a=1
			if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
				listUrl = listUrl + "&";
			else
				listUrl = listUrl + "?";
			
			//표시할 첫 페이지의 ? 1 해준 값
			currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
			
			if(currentPage % numPerBlock == 0)
				currentPageSetup = currentPageSetup - numPerBlock;
			
			//◀이전
			if(totalPage > numPerBlock && currentPageSetup > 0){
							
				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\',\'" + faq_division + "\'); return false;\">◀이전</a>&nbsp;");
				
			}
			
			//바로가기 페이지
			page = currentPageSetup + 1;
			
			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
				
				if(page == currentPage){				
					
					sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\',\'" + faq_division + "\'); return false;\">" + page + "</a>&nbsp;");				
				
				}else{
					
					sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + faq_division + "\'); return false;\">"
							+ page + "</a>&nbsp;");
					
				}
				
				page++;
				
			}		

			//다음▶
			if(totalPage - currentPageSetup > numPerBlock){

				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\',\'" + faq_division + "\'); return false;\">다음▶</a>&nbsp;");

			}

			return sb.toString();

		}
			
		//QuickPageIndexList
		public String quickPageIndexList(int currentPage, int totalPage, String listUrl, String function){

			int numPerBlock = 5; //1◀이전 6 7 8 9 10 다음▶11(6-10까지 표시되는 페이지 갯수)
			int currentPageSetup; //표시할 첫 페이지(6)의 ? 1 해준 값(5,10,15,20...)
			int page;

			StringBuffer sb = new StringBuffer();

			if(currentPage==0 || totalPage==0)	//데이터가 없을 경우
				return "";

			//abc.jsp?a=1
			if(listUrl.indexOf("?") != -1)  //주소줄에 ?표가 있다면
				listUrl = listUrl + "&";
			else
				listUrl = listUrl + "?";

			//표시할 첫 페이지의 ? 1 해준 값
			currentPageSetup = (currentPage/numPerBlock)*numPerBlock;

			if(currentPage % numPerBlock == 0)
				currentPageSetup = currentPageSetup - numPerBlock;

			//◀이전
			if(totalPage > numPerBlock && currentPageSetup > 0){

				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + currentPageSetup + "\'); return false;\">◀이전</a>&nbsp;");

			}

			//바로가기 페이지
			page = currentPageSetup + 1;

			while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){

				if(page == currentPage){				

					sb.append("<a class=\"on\" color=\"Fuchsia\" onclick=\"" + function + "(\'" + currentPage + "\'); return false;\">" + page + "</a>&nbsp;");				

				}else{

					sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\'); return false;\">"
							+ page + "</a>&nbsp;");

				}

				page++;

			}		

			//다음▶
			if(totalPage - currentPageSetup > numPerBlock){

				sb.append("<a href=\"#\" onclick=\"" + function + "(\'" + page + "\'); return false;\">다음▶</a>&nbsp;");

			}

			return sb.toString();

		}

}
