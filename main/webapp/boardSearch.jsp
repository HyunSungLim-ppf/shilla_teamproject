<%@page import="com.shilla.dao.BoardDAO"%>
<%@page import="com.shilla.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 해결책: 컨트롤러를 무의미하게 만든다. ----------------------------------------- -->
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	String searchText = request.getParameter("searchText");
	String searchField = request.getParameter("searchField");
	if(searchText == null){
		searchText = "";
	}
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<BoardDTO> searchlist = null;
	int searchResult = 0;
	
	// BoardIdSearchCtrl 관련
	String user_id = request.getParameter("user_id");
	System.out.println("boardSearch - user_id : "+user_id);
	
	if(user_id != null){
		searchlist = bdao.idSearch(user_id);
		searchResult = searchlist.size();
	} else {
		searchlist = bdao.searchBoard(searchField, searchText);
		searchResult = searchlist.size();
	}
%>
<!-- 해결책: 컨트롤러를 무의미하게 만든다. ----------------------------------------- -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의게시판-검색결과</title>
    <!-- Page CSS -->
    <link rel="stylesheet" href="./css/shilla_search.css">
    <link rel="stylesheet" href="./css/header&footer.css">
    <!-- Page JS -->
    
	<script src="./js/boardsearch.js"></script>
</head>
<body>
    <!-- Main -->
    <main class="w1000">
        <div class="title">
            <div class="top_menu cf">
                <h1>문의글 검색결과</h1>
                <ul>
                    <li><i class="fa-solid fa-house"></i></li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li>고객문의</li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li>검색결과</li>
                </ul>
            </div>
        </div>
        <!-- 전체 탭메뉴 부모박스 -->
        <div class="top_container">
            <!-- 검색창 -->
            <div class="search cf">
                <div class="box">
                    <form action="boardsearch.do" method="post" name="searchScript">
                        <select name="searchField">
                            <option value="title">제목</option>
                            <option value="name">작성자</option>
                        </select>
<!-- 해결책: 컨트롤러를 무의미하게 만든다. ---------------------------------------------------------------------- -->
                        <input type="text" name="searchText" id="searchText" value="<%=searchText%>">
                        <button type="submit" onclick="return searchCheck()">검색</button>
                    </form>
                </div>
            </div>
            <!-- /검색창 -->
		</div>
        <!-- 개별 게시판 메뉴 모음 박스-->
        <div class="all">
	        <div class="container seoul_tab">
	            <!-- 탭내용 부모박스 -->
	            <div class="tab_contents">
	                <!-- 탭메뉴1 -->
	                <div class="list">
	                	<c:if test="<%=searchResult != 0 %>">
		                    <ul>
		                    <c:forEach var="bean" items="<%=searchlist %>" varStatus="loop">
		                        <li class="li_num li_${loop.index}">
		                            <dl class="question notice cf">
		                            	<c:if test="${bean.category == 'a'}">
		                                	<dt>객실/패키지 문의</dt>
		                                </c:if>
		                                <c:if test="${bean.category == 'b'}">
		                                	<dt>다이닝 문의</dt>
		                                </c:if>
		                                <c:if test="${bean.category == 'c'}">
		                                	<dt>웨딩 문의</dt>
		                                </c:if>
		                                <c:if test="${bean.category == 'd'}">
		                                	<dt>연회/회의 문의</dt>
		                                </c:if>
		                                <c:if test="${bean.category == 'e'}">
		                                	<dt>멤버쉽 문의</dt>
		                                </c:if>
		                                <c:if test="${bean.category == 'f'}">
		                                	<dt>기타 문의</dt>
		                                </c:if>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->		             
		                                <dd class="udline">
		                          			<a href="boardread.do?num=${bean.num }&searchText=<%=searchText%>&searchField=<%=searchField%>">${bean.title }</a>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
		                                	<div class="name_date">
                                       			<span id="user_name">${bean.name }</span>
                                       			<span id="reg_date">${bean.regdate }</span>
                                    		</div>
		                                </dd>
		                            </dl>
		                        </li>
		               		</c:forEach>         
		                    </ul>
	                    </c:if>
	                    <c:if test="<%=searchResult == 0 %>">
	                    	<h2 class="instructions">
<%-- 	                    		<b>' ${searchText} '</b> --%>
<!-- 	                    		<br><br> -->
	                    		검색결과가 없습니다.<br>
	                    		다른 검색어를 입력해보세요.
	                    	</h2>
	                    </c:if>
				        <!-- /개별 게시판 메뉴 모음 박스-->  
				        <p class="paging">
					        <c:if test="<%=searchResult % 7 == 0 %>">
					        	<c:forEach var="i" begin="1" end="<%=searchResult/7%>">
					           		<span class="paging_btn">${i}</span>
					        	</c:forEach>
					        </c:if>
					        <c:if test="<%=searchResult % 7 != 0 %>">
						        <c:forEach var="j" begin="1" end="<%=searchResult/7+1%>">
						        	<span class="paging_btn" >${j}</span>
						        </c:forEach>
							</c:if>
				        </p>
	        		</div>
	                <!-- /탭메뉴1 -->
	            </div>
	        </div>
        </div>
		<div class="bottom_container">
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->		
		    <!-- 검색결과가 있을 경우 -->
	        <c:if test="<%=searchResult != 0 %>">
		        <button class="boardList_go_btn" onclick="location.href='boardlist.do'">글목록</button>
		        <button class="write_go_btn" onclick="location.href='boardadd.do?searchText=<%=searchText%>&searchField=<%=searchField%>'">문의하기</button>
	        </c:if>
	        <!-- 검색결과가 없을 경우 -->
	        <c:if test="<%=searchResult == 0 %>">
	        	<div class="bottom_btn">
			        <button class="boardList_go_btn1" onclick="location.href='boardlist.do'">글목록</button>
			        <button class="write_go_btn1" onclick="location.href='boardadd.do?searchText=<%=searchText%>&searchField=<%=searchField%>'">문의하기</button>
	        	</div>
	        </c:if>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
	    </div>
    </main>
    <!-- /Main -->
           
</body>

</html>