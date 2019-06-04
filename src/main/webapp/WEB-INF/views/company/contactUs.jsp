<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<jsp:include page="../top.jsp"/>
<jsp:include page="../right.jsp"/>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/commons.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript">

function requestContactUs() {	
	var f = document.contactUsForm;	
	
	str = f.company.value;
	str = str.trim();
	if(!str){		
		alert("\n회사명을 입력하세요");
		f.company.focus();
		return;		
	}
	f.company.value = str;
	
	
	str = f.setfrom.value;
	str = str.trim();
	if(!str){		
		alert("\n담당자 이메일을 입력하세요");
		f.setfrom.focus();
		return;		
	}
	f.setfrom.value = str;
	
	str = f.tel.value;
	str = str.trim();
	if(!str){		
		alert("\n연락처를 입력하세요");
		f.tel.focus();
		return;		
	}
	f.tel.value = str;
	
	str = f.description.value;
	str = str.trim();
	if(!str){		
		alert("\n제품소개를 입력하세요");
		f.description.focus();
		return;		
	}
	f.description.value = str;
	
	str = f.description.value;
	str = str.trim();
	if(!str){		
		alert("\n제품소개를 입력하세요");
		f.description.focus();
		return;		
	}
	f.description.value = str;
	
	
	if(f.termsAgreeYn.checked==false){
		
		alert("\n약관에 동의하세요.");
		return;
	}
	
	f.action = "<%=cp%>/company/sendEmail.action";
	f.submit();

}

</script>


<title>데일리찬</title></head>
<body>
<div class="contentsArea">
	<div class="contentsWrap">
	<div class="list_top_banner img_new_contact">
			<div class="contents">
				<p>
					&nbsp;
				</p>
			</div>
		</div>
		<!-- 오른쪽 영역 -->
		<div class="content newContactArea">
			<!-- 내용 입니다 -->
			
			<div class="newContaceWrap">
				<div class="newContactTitle">데일리찬 입점문의</div>
				<div class="newContactSubTitle">
	                	엄마가 가족에게 주고 싶은 것을 찾는 사람들, 그 마음과 같은 마음으로 물건을 만드는 사람들에게<br>
			똑같은 마음으로 장터를 열어 보겠다는 소박한 생각은 데일리찬의 한결같은 다짐입니다.
	                </div> 
				
				<div class="newContactForm">
					<form name="contactUsForm" method="post" action="" enctype="multipart/form-data">
						<table class="newTableComWrite">
							<colgroup>
								<col width="15%">
								<col width="85%">
							</colgroup>
							<tbody>
								<tr>
									<th>회사명</th>
									<td colspan="3"><input name="company" type="text"></td>
								</tr>
								<!-- 2018-05-31 필드 테이블 분리-->
								<tr>
									<th>입점자 이메일</th>
									<td colspan="3"><input name="setfrom" type="text"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan="3"><input name="tel" type="text"></td>
								</tr>
								<!-- 2018-05-31 필드 테이블 분리-->
								<tr>
									<th>제품소개</th>
									<td colspan="3">
										<div class="cmTxtInput">
											<textarea name="description" class="cmMtinput" placeholder="내용을 입력해 주세요."></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<div class="cmAddPhotoWrap">
											<input type="file" id="attachFile" name="attachFile" style="height: 0; width: 0; display:none" onchange="contactUsUploadChg();">
											<input type="text" readonly="readonly" id="uploadFile">
												<a href="#" class="cmAddPhotoBtn" onclick="contactUsFileUpload(); return false;">
													<img src="/dailychan/resources/images/common/btn_file.jpg">
												</a> 
										</div>
										<p style="font-size: 16px; padding-top:10px;">100MB 이하</p>
									</td>
								</tr>
								<tr style="display:true">
	                                   <th>약관동의</th>
	                                   <td colspan="3">
	                                   		<span class="checks"  style="margin-top: 24px;" >
	                                   		<input type="checkbox" name="termsAgreeYn" id="termsAgreeYn" value="Y" >
	                                   		<label for="termsAgreeYn"></label>
	                                   		
		                                       <label for="termsAgreeYn" >
		                                           <span class="checkTxt2" style="cursor:pointer" >개인정보 보호 정책 동의</span>
		                                       </label>
	                                   		</span>
	                                   </td>
	                               </tr>
							</tbody>
						</table>
					</form>
				</div>
				
				<div class="newContactBtnSet">
					<a href="#" onclick="requestContactUs(); return false;">문의</a>
					<a href="#" onclick="contactCancel(); return false;">취소</a>
				</div>  
			</div>	
			<!-- //내용 입니다 -->
		</div>
		<!-- //오른쪽 영역 -->
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>