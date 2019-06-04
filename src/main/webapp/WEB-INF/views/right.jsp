<%@page import="com.chan.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리찬</title>

<script type="text/javascript">

function quickPage(pageNum) {
	
	var url = "/dailychan/right.action";
	
	$.post(url,{pageNum:pageNum},function(data){
		
		$("#miniArticle").html(data);
		
	});
	
}

function showQuick(id) {
	
	$("#quick" + id).show();
	
}

</script>
</head>
<body>

<div class="quickMenu" id="miniArticle">

</div>

</body>

</html>
