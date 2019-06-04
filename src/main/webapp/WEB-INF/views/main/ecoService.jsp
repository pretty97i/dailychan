<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"><head>
<title>데일리찬::믿을 수 있는 먹거리</title>
    
<jsp:include page="../top.jsp"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
 
 
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/jquery.bxslider.css" />


<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>


<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        var btnOffset = $(".ecoMenu").offset().top;
        $(window).scroll(function() {
            var tab1Top = $("#tab1").offset().top;
            var tab2Top = $("#tab2").offset().top;
            var tab3Top = $("#tab3").offset().top;
            var height = $(document).scrollTop();
            if (height > btnOffset - 5) {
                $(".ecoMenu").addClass('fixMenu');
                if (tab3Top - 20 < height) {
                    $("#tab3Menu").parent().addClass('on');
                    $("#tab2Menu").parent().removeClass('on');
                    $("#tab1Menu").parent().removeClass('on');
                } else if (tab2Top - 20 < height) {
                    $("#tab2Menu").parent().addClass('on');
                    $("#tab3Menu").parent().removeClass('on');
                    $("#tab1Menu").parent().removeClass('on');
                } else if (tab1Top - 20 < height) {
                    $("#tab1Menu").parent().addClass('on');
                    $("#tab3Menu").parent().removeClass('on');
                    $("#tab2Menu").parent().removeClass('on');
                }
            } else {
                $(".ecoMenu").removeClass('fixMenu');
                $("#tab1Menu").parent().removeClass('on');
                $("#tab2Menu").parent().removeClass('on');
                $("#tab3Menu").parent().removeClass('on');
            }
        })
    }); 
    
    function scrollTab(num) {
        $('html, body').animate({
            scrollTop: $('#tab' + num).offset().top
        }, 500);
    }
    </script>
</head>
<body>
<div class="allWrap">

    <!-- 컨텐츠 -->
    <div class="contentsArea">
        <div class="contentsWrap">
            <div style="text-align:center; background:#f7f7f7">
	            <div style="min-width:1903px">
	                <img src="/dailychan/resources/images/shopBanner/Web_main_banner_ecowrap_0516.jpg" style="width:100%;">
	            </div>
                <div class="ecoMenu" style="border-top: solid 1px #bbb;border-bottom: solid 1px #bbb;height:110px;background:#ffffff; width:100%; margin:auto">
                    <ul>
                        <li class><a href="#" id="tab1Menu" onclick="javascript:scrollTab('1'); return false"></a></li>
                        <li class><a href="#" id="tab2Menu" onclick="javascript:scrollTab('2'); return false"></a></li>
                        <li class><a href="#" id="tab3Menu" onclick="javascript:scrollTab('3'); return false"></a></li>
                        <div class="clear"></div>
                    </ul>    
                </div>
	            <div style="padding:120px 0 0 0; background:#f2f2f2" id="tab1">
	                <img src="/dailychan/resources/images/etc/eco_boxweb_2_02.jpg" style="width:860px">
	            </div>
 
	            <div style="text-align:center; background:#f2f2f2">
	                <img src="/dailychan/resources/images/etc/eco_boxweb_2_03.jpg"><br>
	                <img src="/dailychan/resources/images/etc/eco_boxweb_2_04.jpg">
	            </div>
                <div style="background:#fcfcfc;text-align:center" id="tab2">
                   <div><img src="/dailychan/resources/images/etc/eco_boxweb_2_05.jpg"></div>
                </div>
                <div style="padding:120px 0 120px 0; background:#f2f2f2" id="tab3">
                    <img src="/dailychan/resources/images/etc/eco_boxweb_2_06.jpg">
                </div>
             </div>
            <!-- 오른쪽 영역 -->
            <!-- //오른쪽 영역 -->      
        </div>
    </div>
    <!-- //컨텐츠 -->
    
    <!-- footer -->

	<!-- //footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>
</body></html>