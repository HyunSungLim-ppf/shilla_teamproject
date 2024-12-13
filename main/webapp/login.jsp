<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 수정v1.1.13 Login에서 로그인으로 수정 - Login으로 하니까 g의 아랫부분이 잘림 -->
    <title>로그인</title>
    <!-- Page CSS -->
    <link rel="stylesheet" href="./css/shilla_login_page_rwd.css">
    <link rel="stylesheet" href="./css/header&footer.css">
    <!-- PageJS -->
   	<script type="text/javascript" src="./js/shilla_login.js"></script>
</head>
<body>
<!-- Main -->
        <main class="w800">
            <!-- Login title -->
            <!-- <div class="login_title w1200"> -->
            <div class="login_title">
                <h2>로그인</h2>

                <!-- page info -->
                <div class="page_info">
                    <i class="fa-solid fa-house"></i>&nbsp;&nbsp;
                    <i class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;
                    <span>로그인</span>
                </div>
            </div>
            <!-- Title & intro Text -->
            <div class="login_text">
                <h2>
                    신라 호텔에 오신 것을 환영 합니다.
                </h2>
                <p><span>가입하신 아이디와 비밀번호를 입력해 주시기 바랍니다.</span></p>
                <p>회원이 되시면 회원만의 다양한 서비스와 상세한 고객 문의가 가능합니다.</p>
            </div>
            <!-- Login Container -->
            <div class="login_container">

                <!-- Login Form -->
                <form action="login.do" id="login_form" method="post">
                    <!-- input Container -->
                    <div class="input_container">
                        <input type="text" name="user_id" placeholder="아이디 입력" required>
                        <input type="password" name="user_password" placeholder="비밀번호 입력" required>
                    </div>

                    <!-- Submit Btn -->
                    <button type="submit">로그인</button>
                </form>

                <!-- User Find Btn & Join Btn -->
                <div class="find_and_join">
                    <!-- 수정v1.1.5 아이디 비밀번호 찾기 회원가입의 클릭 이벤트를 a 태그를 통해 안받음 -->
                    <!-- Fidn ID BTN -->
                    <div class="find_id_btn">
                        아이디 찾기
                    </div>

                    <!-- Fidn PassWord BTN -->
                    <div class="find_password_btn">
                        비밀번호 찾기
                    </div>

                    <!-- Join BTN -->
                    <div class="user_join_btn">
                        회원가입
                    </div>

                    <!-- 수정v1.1.5 이전 코드 -->
                    <!-- Fidn ID BTN -->
                    <!-- <div class="find_id_btn">
                        <a href="#">아이디 찾기</a>
                    </div> -->

                    <!-- Fidn PassWord BTN -->
                    <!-- <div class="find_password_btn">
                        <a href="#">비밀번호 찾기</a>
                    </div> -->

                    <!-- Join BTN -->
                    <!-- <div class="user_join_btn">
                        <a href="./shilla_clause.html">회원가입</a>
                    </div> -->


                </div>

                <!-- Membership Marketing img -->
                <div class="membership_img">
                    <a href="#">
                        <img src="images/shilla_membership_img.png" alt="멤버쉽마케팅이미지">
                    </a>
                </div>
            </div>
 <!-- Find ID Modal-->
<!-- 이건 아이디조회 결과출력 모달 ------------------------------------------- -->
            <!-- 아이디 찾기 실패 -->
			<c:if test="${requestScope.resId == 'no' }">
				<div class="find_id_container123">
	                <!-- TOP Title & Close Btn -->
	                <div class="top cf">
	                    <h2>아이디 찾기 결과</h2>
	                    <div class="close_btn">
	                        <img src="./images/close_btn.png" alt="닫기 아이콘">
	                    </div>
	                </div>
	                <!-- FIND ID FORM -->
                    <div class="find_id_result_no">
	                    <h1>조회하신 회원정보가 없습니다.</h1>
                    </div>
                    <button type="button" class="close_btn">닫기</button>
	            </div>
            </c:if>
            <!-- 아이디 찾기 성공 -->
            <c:if test="${requestScope.resId == 'ok' }">
				<div class="find_id_container123">
	                <!-- TOP Title & Close Btn -->
	                <div class="top cf">
	                    <h2>아이디 찾기 결과</h2>
	                    <div class="close_btn">
	                        <img src="./images/close_btn.png" alt="닫기 아이콘">
	                    </div>
	                </div>
	                <!-- FIND ID FORM -->
                    <div class="find_id_result_ok">
	                    <h1>아이디는 <span>${findedId }</span> 입니다.</h1>
                    </div>
                    <button type="button" class="insert_userId">아이디 입력</button>
	            </div>
            </c:if>
            <div class="find_id_container">
                <!-- TOP Title & Close Btn -->
                <div class="top cf">
                    <h2>신라 호텔 아이디 찾기</h2>
                    <div class="close_btn">
                        <img src="./images/close_btn.png" alt="닫기 아이콘">
                    </div>
                </div>
                <!-- FIND ID FORM -->
                <form action="findid.do" method="post">
                    <!-- Eng Name Input -->
                    <div class="name_input">
                        <h2>성명</h2>
                        <input type="text" name="name_en_first" placeholder="FIRST NAME(이름)" required>
                        <input type="text" name="name_en_last" placeholder="LAST NAME(성)" required>
                    </div>
                    <!-- Email Input -->
                    <div class="email_input">
                        <h2>이메일</h2>
                        <input type="email" name="user_email" required>
                    </div>
                    <button type="submit">확인</button>
                </form>
            </div>
<!-- ------------------------------------------- -->

            <!-- Find PassWord Modal -->
<!-- 이건 비밀번호조회 결과출력 모달 ------------------------------------------- -->
            <!-- 비밀번호 찾기 실패 -->
			<c:if test="${requestScope.resPwd == 'no' }">
				<div class="find_password_container123">
	                <!-- TOP Title & Close Btn -->
	                <div class="top cf">
	                    <h2>비밀번호 찾기 결과</h2>
	                    <div class="close_btn">
	                        <img src="./images/close_btn.png" alt="닫기 아이콘">
	                    </div>
	                </div>
	                <!-- FIND ID FORM -->
                    <div class="find_pwd_result_no">
	                    <h1>조회하신 회원정보가 없습니다.</h1>
                    </div>
                    <button type="button" class="close_btn">닫기</button>
	            </div>
            </c:if>
            <!-- 비밀번호 찾기 성공 -->
            <c:if test="${requestScope.resPwd == 'ok' }">
				<div class="find_password_container123">
	                <div class="top cf">
	                    <h2>비밀번호 찾기 결과</h2>
	                    <div class="close_btn">
	                        <img src="./images/close_btn.png" alt="닫기 아이콘">
	                    </div>
	                </div>
	                <div class="find_pwd_result_ok">
	                    <h1>비밀번호는 <span>${findedPwd }</span> 입니다.</h1>
                    </div>
                    <button type="button" class="insert_userPwd">닫기</button>
	            </div>
            </c:if>
            <div class="find_password_container">
                <div class="top cf">
                    <h2>신라 호텔 비밀번호 찾기</h2>
                    <div class="close_btn">
                        <img src="./images/close_btn.png" alt="닫기 아이콘">
                    </div>
                </div>
                <form action="findpassword.do" method="post">
                    <div class="id_input">
                        <h2>아이디</h2>
                        <input type="text" name="id" placeholder="가입하신 아이디를 입력해주세요." required>
                    </div>
                    <div class="name_input">
                        <h2>성명</h2>
                        <input type="text" name="name_en_first" placeholder="FIRST NAME(이름)" required>
                        <input type="text" name="name_en_last" placeholder="LAST NAME(성)" required>
                    </div>
                    <div class="email_input">
                        <h2>이메일</h2>
                        <input type="email" name="user_email" required>
                    </div>
                    <button type="submit">확인</button>
                </form>
            </div>
<!-- ------------------------------------------- -->
        </main>
</body>
</html>