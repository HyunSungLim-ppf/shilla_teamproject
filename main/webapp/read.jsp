<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 수정v1.1.13 TeamProject에서 문의글로 수정  -->
    <title>문의글</title>
    <!-- Page CSS -->
    <link rel="stylesheet" href="./css/shilla_read.css">
    <!-- Page JS -->
</head>
<body>
        <!-- Main -->
        <!-- <main class="w1000"> -->
        <!-- 수정 w1000 -> w800으로 변경 -->
        <main class="w800">
            <!-- 타이틀 -->
            <div class="title">
                <div class="top_menu cf">
                    <!-- 수정v1.1.8 Read에서 문의글로 텍스트노드 수정 -->
                    <h1>문의글</h1>
                    <ul>
                        <!-- HOT FIX 240902 -->
                        <!-- <li><a href="#"><i class="fa-solid fa-house"></i></a></li>
                        <li><i class="fa-solid fa-chevron-right"></i></li> -->
                        <!-- 수정v1.1.8 FAQ추가 및 문의보기에서 문의글로 텍스트노드 수정 -->
                        <!-- <li><a href="#">FAQ</a></li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li><a href="#">문의글</a></li> -->

                        <li><i class="fa-solid fa-house"></i></li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li>FAQ</li>
                        <li><i class="fa-solid fa-chevron-right"></i></li>
                        <li>문의글</li>
                    </ul>
                </div>
            </div>
            <!-- /타이틀 -->
            <!-- QnA 박스 -->
            <div class="text_box">
                <!-- 질문영역 -->
                <!-- 질문영역 플롯 추가 -->
                <div class="question cf">
                    <p>${bean.title }</p>
                    <!-- 질문영역 작성자, 작성일 추가 -->
                    <ul class="cf">
                    	<li>${bean.regdate }</li>
                    	<li>${bean.name }</li>
                    </ul>
                </div>
                <!-- /질문영역 -->
                <!-- 답변영역 -->
                <div class="answer">
                    <p>
                        ${bean.content }
                    </p>
                </div>
                <!-- /답변영역 -->
            </div>
            <!-- /QnA 박스 -->
            <!-- 댓글 박스 -->
            <div class="text_box2">
                <h2>댓글</h2>
                <div class="text">
                    <div class="name">
                        <h3>관리자님의 댓글</h3>
                        <p>
                            &#124;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 : &nbsp;${admindate }
                        </p>
                    </div>
                    <p><i class="fa-solid fa-lock"></i>&nbsp;&nbsp; ${bean.reply }</p>
                    <!-- 댓글박스 버튼 삭제 -->
                    <!-- <div class="btn">
                        <button><a href="#">답변</a></button>
                        <button><a href="#">삭제</a></button>
                    </div> -->
                </div>
                <!-- 댓글 작성하기 버튼 삭제 -->
                <!-- <div class="btn2">
                    <button><a href="#">댓글작성하기</a></button>
                </div> -->
            </div>
            <!-- /댓글 박스 -->
     		
            <!-- 목록 버튼 -->
            <!-- 버튼에 플롯 추가 -->
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
            <div class="bottom_container cf">  
            <!--------------------- 로그인 상태에 따른 목록 변경(JSTL IF)  -------------------------->
            <c:if test="${sessionScope.member.id == bean.board_id }">
				<c:if test="${check == null && searchText == '' }">
	            	<button type="button" name='리스트_리스트' onclick="history.go(-1)"><a>목록</a></button>
	            </c:if>     	
	           	<c:if test="${check == '1' && searchText == ''}">
	           		<button type="button" onclick="location.href='boardlist.do'"><a>목록</a></button>
	           	</c:if>
	           	<c:if test="${check == '2' && searchText != ''}">
	           		<button type="button" onclick="location.href='boardsearch.do?searchText=${searchText}&searchField=${searchField }'"><a>목록</a></button>
	           	</c:if>
	           	<c:if test="${check == null && searchText != ''}">
	            	<button type="button" onclick="history.go(-1)"><a>목록</a></button>
	            </c:if>
            </c:if>         
            <c:if test="${sessionScope.member.id != bean.board_id }">
            	<div>
					<c:if test="${check == null && searchText == '' }">
		            	<button type="button" name='리스트_리스트' onclick="history.go(-1)"><a>목록</a></button>
		            </c:if>     	
		           	<c:if test="${check == '1' && searchText == ''}">
		           		<button type="button" onclick="location.href='boardlist.do'"><a>목록</a></button>
		           	</c:if>
		           	<c:if test="${check == '2' && searchText != ''}">
		           		<button type="button" onclick="location.href='boardsearch.do?searchText=${searchText}&searchField=${searchField }'"><a>목록</a></button>
		           	</c:if>
		           	<c:if test="${check == null && searchText != ''}">
		            	<button type="button" onclick="history.go(-1)"><a>목록</a></button>
		            </c:if>
            	</div>
            </c:if> 
            <!--------------------- 로그인 상태에 따른 목록 변경  -------------------------->
            
<!-- 여기까지 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
                <!-- 수정 삭제 버튼 추가 -->
                <!-- 로그인중인 유저와 게시글 아이디 비교  -->
				<c:if test="${sessionScope.member.id == bean.board_id }">      
					<div class="btn">                		
						<button type="button" onclick="location.href='boardupdate.do?num=${bean.num }&searchText=${searchText}&searchField=${searchField }'"><a>수정</a></button> 	
						<button class="delete_btn"><a>삭제</a></button>
					</div>
				</c:if>
				<div class="hidden_num">${bean.num}</div>
				<div class="hidden_searchText">${searchText }</div>
				<div class="hidden_searchField">${searchField }</div>
<!-- 여기 삭제버튼 분기 ------------------------------------------------------------------------------------ -->
            </div>
            <!-- /목록 버튼 -->
        </main>
        <!-- /Main -->
    <script src="./js/shilla_read.js"></script>
</body>
</html>