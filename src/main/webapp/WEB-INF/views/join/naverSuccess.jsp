<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
  window.onload = function () {
		
		naverjoin();
		
	}
  
  
  function naverjoin() {
		
	  	var id = ${result}.response.id;
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		
		location.href = "/dailychan/join/signUp.action?naver_name=" + name +"&naver_email=" + email + "&naver_id=" + id ;
	}

  
  </script>

</head>
<body>


</body>
</html>