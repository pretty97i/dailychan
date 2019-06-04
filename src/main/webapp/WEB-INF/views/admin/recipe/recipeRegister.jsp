<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>데일리찬::믿을 수 있는 먹거리</title>

<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>  
    
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.99" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />

 <script type="text/javascript">
 function sendIt() {
	
	 var f = document.myForm;	
	 
	str = f.recipe_subject.value;
	str = str.trim();

		if(!str){
			alert("\n제목을 입력하세요.");
			f.recipe_subject.focus();
			return;
		}
	
		f.recipe_subject.value = str;

		f.action = "/dailychan/admin/recipe/register_ok.action";
		f.submit();
		
} 
 
 </script>
 
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" name="myForm" method="post" enctype="multipart/form-data">

    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_order_pay">
        <div class="contentsWrap">
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                <div class="orderStepWrap">
                    <!-- 주문단계 -->
                    
                    <div style="background-color:#f5f5f5; height:36px; color:#6ca437; font-size:34px; font-weight:bold;text-align:center; padding-top:22px"> 레&nbsp;&nbsp;&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;&nbsp;피&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 등&nbsp;&nbsp;&nbsp;&nbsp;록 </div>
                    <!--// 주문단계 -->

 			<div>        
               <h4 class="orderTit2 conS1">1. 레시피 등록</h4>
                    <div class="orderTbl2" style="border:solid 1px #ddd">
                         <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                            	<tr>
                                    <th scope="row"><span class="inputWd260" > 분류  </span></th>
                                    <td>
                                    
                                    <select name="recipe_select">
                                    
                                    	<option value="국/찌개/전골">국/찌개/전골</option>
                                    	<option value="밥/죽">밥/죽</option>
                                    	<option value="반찬/김치">반찬/김치</option>
                                    	<option value="일품요리">일품요리</option>
                                    	<option value="간단요리">간단요리</option>
                                    	<option value="면류/파스타">면류/파스타</option>
                                    	<option value="간식/음료">간식/음료</option>
                                    	<option value="베이킹">베이킹</option>
                                    
                                    </select>
                                    
                                    
                                    
                                    </td>                                   	                                 
                                </tr>
                            
                            	<tr>
                                    <th scope="row"><span class="inputWd260" > 제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  </span></th>
                                    <td><input type="text" class="inputWd370" name="recipe_subject"/></td>                                   	                                 
                                </tr>
                                <tr>
                                    <th scope="row"><span class="inputWd260"> 메인 이미지 </span></th>
                                    <td><input type="file" class="inputWd370"  name="file1" value="${dto.recipe_mainSaveFileName }"/>
                                    <input type="hidden" name="recipe_mainSaveFileName" value="${dto.recipe_mainSaveFileName }">
                                    
                                    </td>     
                                                                  	                                 
                                </tr>
                                <tr>
                                    <th scope="row"><span class="inputWd260"> 컨텐츠 이미지 </span></th>
                                    <td><input type="file" class="inputWd370"  name="file2" value="${dto.recipe_contentSaveFileName }"/>
                                    <input type="hidden" name="recipe_contentSaveFileName" value="${dto.recipe_contentSaveFileName }"></td>                                   	                                 
                                </tr>                      
                            </tbody>                           
                        </table>
      				 </div>
      			</div>
      		</div>			                   
       </div> 
       
       
       <div  style="padding-left:730px; padding-top:20px">
	      	<span>
	      	<!-- 등록하기 -->
	      	<input type="button" value="" onclick="sendIt();"
	      	style="background-image:url(/dailychan/resources/images/admin/K_button1.png);
	      	width: 140px; height: 47px; cursor: pointer;"/>
	      	&nbsp;&nbsp;&nbsp; 
	      	
	      	<!-- 다시쓰기 -->
	      	<input type="reset" value=""
	      	style="background-image:url(/dailychan/resources/images/admin/K_button3.png);
	      	width: 140px; height: 47px; cursor: pointer;"/>
	      	&nbsp;&nbsp;&nbsp; 
	      	
	      	<!-- 돌아가기 -->
	      	<input type="button" value="" onclick="javascript:location.href='main.action'"
	      	style="background-image:url(/dailychan/resources/images/admin/K_button2.png);
	      	width: 140px; height: 47px; cursor: pointer;"/>
	      	</span>
	                                      
	    </div>
   

</form>
</body>
</html>