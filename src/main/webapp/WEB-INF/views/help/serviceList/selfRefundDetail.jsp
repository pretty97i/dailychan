<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../top.jsp"/>
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

</head>
<body>
 
<div class="allWrap"> 
    <div class="contentsArea">
        <div class="contentsWrap">
	        <div class="content"> 
	            <div style="text-align:center;">
		            <div>
		            <img src="/dailychan/resources/images/etc/return_Service_visual.jpg">
		            </div>
		
		            <div style="background:#efefef;margin-top:80px"> 
		                <div><img src="/dailychan/resources/images/etc/return_service_01.jpg"></div>
		                <div><img src="/dailychan/resources/images/etc/return_service_02.jpg"></div>
		                <div><img src="/dailychan/resources/images/etc/return_service_03.jpg"></div>
		                <div><img src="/dailychan/resources/images/etc/return_service_04.jpg"></div>
		                <div><img src="/dailychan/resources/images/etc/return_service_05.jpg"></div>
		                <div><img src="/dailychan/resources/images/etc/return_service_06.jpg"></div>
		            </div>
		            <div style="background:#fff;"><img src="/dailychan/resources/images/etc/return_policy.jpg"></div>
		            <div style="width: 70%;margin: auto;padding-bottom: 120px;"> 
		                <a href="/dailychan/myPage/refundProductList.action?refundGbn=R0"> 
		                	<img src="/dailychan/resources/images/etc/return_go.png">
		                </a>
		            </div>
		            <div style="background:#efefef;"> <img src="/dailychan/resources/images/etc/customer_center_info.jpg"></div>
	            </div>    
	        </div>
    	</div>
    </div>
</div>
    
</body>
</html>