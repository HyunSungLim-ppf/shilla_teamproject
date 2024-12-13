<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- = 수정사항 =
     1. 상단 구분선 : 7px => 5px 
     2. 공지부분 : 공지 답변내용은 읽기 게시판으로 이동함으로 공지 답변내용 삭제 및 상하 화살표 삭제
     2. 게시판 border : black =>  #d1d1d1(연하게)
     3. 게시판 하단 숫자 박스 및 화살표 : 숫자 위치 정가운데로 이동
                                        black => opacity: 0.5로 연하게 -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 수정v1.1.13 TeamProject에서 문의게시판으로 수정  -->
	<title>문의게시판</title>
	<!-- Page CSS -->
	<link rel="stylesheet" href="./css/shilla_board.css">
	<!-- Page JS -->
	<script src="./js/shilla_board.js"></script>
</head>
<body>
	<!-- Main -->
	<main class="w1000">
		<div class="title">
			<div class="top_menu cf">
				<!-- 수정v1.1.8 NoticeBoard에서 문의게시판으로 텍스트노드 수정 -->
				<h1>문의게시판</h1>
				<ul>
					<!-- 20240902 Hot Fix 일단 막아둠 -->
					<!-- <li><a href="#"><i class="fa-solid fa-house"></i></a></li> -->
					<li><i class="fa-solid fa-house"></i></li>
					<li><i class="fa-solid fa-chevron-right"></i></li>
					<!-- 수정v1.1.8 고객문의 추가 -->
					<!-- 20240902 Hot Fix 일단 막아둠 -->
					<!-- <li><a href="#">고객문의</a></li> -->
					<li>고객문의</li>
					<li><i class="fa-solid fa-chevron-right"></i></li>
					<!-- 20240902 Hot Fix 일단 막아둠 -->
					<!-- <li><a href="#">문의게시판</a></li> -->
					<li>문의게시판</li>
				</ul>
			</div>
		</div>
		<div class="text">
			<p>
				고객님께서 문의하신 호텔에 관련된 사항은 빠른 시간내에 담당자가 답변드리도록 하겠습니다.<br> 문의하신 내용에
				대한 답변은 고객님께서 접수하신 이메일로도 안내해드립니다.
			</p>
		</div>
		<!-- 전체 탭메뉴 부모박스 -->
		<div class="top_container">
			<!-- 전체 Tab Menu -->
			<div class="top_tabs">
				<ul class="top_tab_btn cf">
					<li class="top_on">서울신라호텔</li>
					<li>제주신라호텔</li>
					<li>신라모노그램in다낭</li>
					<li>신라스테이</li>
				</ul>
			</div>
			<!-- /전체 Tab Menu -->
		
			<!-- 검색창 -->
			<div class="search cf">
				<div class="box">
					<form action="boardsearch.do" method="post" name="searchScript">
                        <select name="searchField">
                            <option value="title">제목</option>
                            <option value="name">작성자</option>
                        </select>
                        <input type="text" name="searchText" id="searchText">
                        <button type="submit" onclick="return searchCheck()">검색</button>
                    </form>
                    <!--  onclick="return searchCheck()" -->
				</div>
			</div>
			<!-- /검색창 -->

			<!-- 개별 게시판 메뉴 모음 박스-->
			<div class="all">
				<!-- Seoul -->
				<div class="container seoul_tab">
					<!-- Seoul Tab Menu 1 -->
					<div class="tabs">
						<ul class="tab_btn cf">
							<li class="on">객실/패키지 문의</li>
							<li>다이닝 문의</li>
							<li>웨딩 문의</li>
							<li>연회/회의 문의</li>
						</ul>
					</div>
					<!-- /Seoul Tab Menu -->

					<!-- 탭내용 부모박스  a-->
					<div class="tab_contents">
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>객실/패키지 문의</dt>
											<dd class="udline">
											
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<!--페이징  -->
							<p class="paging">
								<c:if test="${blist.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>

						<!-- 탭메뉴2  b-->
						<div class="list">
							<ul>
								<!-- 탭메뉴1_질문답1 -->
								<c:forEach var="el" items="${blist2}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>다이닝 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist2.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist2.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist2.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist2.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴2 -->

						<!-- 탭메뉴3 c-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist3}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>웨딩 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist3.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist3.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist3.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist3.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴3 -->

						<!-- 탭메뉴4 d -->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist4}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>연회/회의 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist4.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist4.size()/7}">
										<span class="paging_btn">${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist4.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist4.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴4 -->
					</div>
				</div>
				<!-- /Seoul -->

				<!-- Jeju -->
				<div class="container jeju_tab">
					<!-- Jeju Tab Menu  2 -->
					<div class="tabs">
						<ul class="tab_btn cf">
							<li class="on">객실/패키지 문의</li>
							<li>다이닝 문의</li>
							<li>연회/회의 문의</li>
							<li>멤버쉽 문의</li>
						</ul>
					</div>
					<!-- /Jeju Tab Menu -->

					<!-- 탭내용 부모박스 -->
					<div class="tab_contents">
						<!-- 탭메뉴1 a -->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist5}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>객실/패키지</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist5.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist5.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist5.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist5.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴1 -->

						<!-- 탭메뉴2 b-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist6}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>다이닝 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist6.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist6.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist6.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist6.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴2 -->

						<!-- 탭메뉴3  d-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist7}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>연회/회의 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist7.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist7.size()/7}">
										<span class="paging_btn">${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist7.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist7.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴3 -->

						<!-- 탭메뉴4 e-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist8}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>멤버쉽 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist8.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist8.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist8.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist8.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴4 -->
					</div>
				</div>
				<!-- /Jeju -->

				<!-- Mono  3 -->
				<div class="container mono_tab">
					<!-- Mono Tab Menu -->
					<div class="tabs">
						<ul class="tab_btn cf">
							<li class="on">객실/패키지 문의</li>
							<li>다이닝 문의</li>
							<li>멤버쉽 문의</li>
							<li>기타 문의</li>
						</ul>
					</div>
					<!-- /Mono Tab Menu -->

					<!-- 탭내용 부모박스 -->
					<div class="tab_contents">
						<!-- 탭메뉴1  a-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist9}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>객실/패키지 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist9.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist9.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist9.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist9.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴1 -->

						<!-- 탭메뉴2 b-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist10}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>다이닝 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist10.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist10.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist10.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist10.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴2 -->

						<!-- 탭메뉴3 e-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist11}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>멤버쉽 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist11.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist11.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist11.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist11.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴3 -->

						<!-- 탭메뉴4 f-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist12}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>기타 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist12.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist12.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist12.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist12.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴4 -->
					</div>
				</div>
				<!-- /Mono -->

				<!-- Stay  4 -->
				<div class="container stay_tab">
					<!-- Stay Tab Menu -->
					<div class="tabs">
						<ul class="tab_btn cf">
							<li class="on">객실/패키지 문의</li>
							<li>다이닝 문의</li>
							<li>기타 문의</li>
						</ul>
					</div>
					<!-- /Stay Tab Menu -->

					<!-- 탭내용 부모박스 -->
					<div class="tab_contents">
						<!-- 탭메뉴1 a-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist13}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>객실/패키지 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist13.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist13.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist13.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist13.size()/7+1}">
										<span class="paging_btn">${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴1 -->

						<!-- 탭메뉴2 b-->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist14}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>다이닝 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist14.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist14.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist14.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist14.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴2 -->

						<!-- 탭메뉴3 f -->
						<div class="list">
							<ul>
								<c:forEach var="el" items="${blist15}" varStatus="loop">
									<li class="li_num li_${loop.index}">
										<dl class="question notice cf">
											<dt>기타 문의</dt>
											<dd class="udline">
												<a href="boardread.do?num=${el.num}">${el.title}</a>
												<div class="name_date">
													<span id="user_name">${el.name }</span> <span id="reg_date">${el.regdate }</span>
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
							</ul>
							<p class="paging">
								<c:if test="${blist15.size()%7==0}">
									<c:forEach var="i" begin="1" end="${blist15.size()/7}">
										<span class="paging_btn" >${i}</span>
      							  </c:forEach>
								</c:if>
								<c:if test="${blist15.size()%7 !=0 }">
									<c:forEach var="j" begin="1" end="${blist15.size()/7+1}">
										<span class="paging_btn" >${j}</span>
        							</c:forEach>
								</c:if>
							</p>
						</div>
						<!-- /탭메뉴3 -->
					</div>
				</div>
				<!-- /Stay -->
			</div>
			<!-- /개별 게시판 메뉴 모음 박스-->
		</div>
		<!-- /전체 탭메뉴 부모박스 -->
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
      <div class="bottom_container">
         <!-- 페이지 표시 -->
         <button onclick="location.href='boardadd.do?searchText=${searchText}&searchField=${searchField }'">
            <a>문의하기</a>
         </button>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
			<!-- 페이지 표시 -->
		</div>
	</main>
	<!-- /Main -->
</body>
</html>