<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 24.10.23 작업 -> Command 패턴 적용
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	
	if(content == null) {
		content = "/includes/main.jsp";
	}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 수정v1.1.13 Header & Footer에서 The Shilla Hotels & Resorts로 수정  -->
  <title>The Shilla Hotels & Resorts</title>
  <!-- 추가v1.0.4 파비콘 추가 -->
  <link rel="shortcut icon" href="./images/shilla_favicon.png">
  <link rel="apple-touch-icon=precomposed" href="./images/shilla_favicon.png">
  <!-- 추가v1.0.4 파비콘 추가 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- Reset CSS -->
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/font.css">
  <link rel="stylesheet" href="./css/header&footer.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
  <link rel="stylesheet" href="./css/shilla_main_var.css" />
	<!-- 추가 -->
 
  <link rel="stylesheet" href="./css/main_ani.css" />

  <script src="./js/jquery-1.12.4.min.js"></script>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
  <script src="./js/shilla_main_bxslider.js"></script>
  <script src="./js/shilla_main_var.js"></script>
  <script src="./js/shilla_main_swiper.js"></script>
  <script src="./js/prefixfree.min.js"></script>
</head>
<!-- 오류방지를 위해 CSS 링크, JS 링크, #wrap 위치 등 동일하게 위치시켜주시면 감사하겠습니다~~~~  -->
<!-- 아 그리고 컨텐츠 넣기전에 GNB 서브메뉴 margin이 틀어져 보이는 것은 오른쪽 스크롤바가 없어서 그런 것이라 -->
<!-- 컨텐츠 채우시면 스크롤바 생기면서 자동으로 맞춰집니다. -->

<body>
  <div id="wrap">
    <!-- Header -->
    	<jsp:include page="includes/common/header.jsp"/>
    <!-- /Header -->
    
    <!-- Main -->
    	<jsp:include page="<%=content %>"/>
    <!-- /Main -->

	<!-- Footer -->
    	<jsp:include page="includes/common/footer.jsp"/>
	<!-- /Footer -->
  </div>
  <!-- /Footer 영역 끝 -->
  <!-- 아래 스크립트는 GNB메뉴 슬라이드 효과 js 링크입니다. 위치 동일하게 해주시면 감사하겠습니다! -->
  <script src="./js/header&footer.js"></script>
</body>
</html>