<%@page import="com.shilla.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 되어있는가?(일단 세션에 저장된 로그인된 회원 꺼내오기)
	MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<div class="top_wrap">
      <aside class="gnb_top">
        <ul>
<%
	// 로그인이 되어 있지 않다면 : 세션에서 꺼내온 member가 null이라면
	if(member == null) {
%>
          <li><a href="index.jsp?content=login.jsp">로그인</a>&nbsp;&nbsp;|</li>
          <!-- 수정v1.1.10 텍스트노드 신라리워즈 가입에서 회원가입으로 수정 -->
          <li>&nbsp;&nbsp;<a href="index.jsp?content=clause.jsp">회원가입</a>&nbsp;&nbsp;|</li>
<%
	} else {	// 로그인이 되어 있다면 : 세션에서 꺼내온 member가 null이 아니라면
%>
		  <li><a href="logout.do">로그아웃</a>&nbsp;&nbsp;|</li>
          <!-- 수정v1.1.10 텍스트노드 신라리워즈 가입에서 회원가입으로 수정 -->
          <li>&nbsp;&nbsp;<a href="index.jsp?content=Member_info.jsp">마이페이지</a>&nbsp;&nbsp;|</li>
<%
	}
%>
          <!-- 수정v1.1.11 언어선택 기능 추가를 위한 수정 -->
          <li class="select_lang">
            <p>
              &nbsp;&nbsp;
              <img src="./images/earth.png" alt="language">
              &nbsp;&nbsp;한국어&nbsp;&nbsp;
              <img src="./images/down.png" alt="down_button">
            </p>
            <!-- 공통 기능 추가 FLAG -->
            <ul class="lang_list">
              <li>
                &nbsp;&nbsp;
                <img src="./images/earth.png" alt="language">
                &nbsp;&nbsp;日本語&nbsp;&nbsp;
              </li>
              <li>
                &nbsp;&nbsp;
                <img src="./images/earth.png" alt="language">
                &nbsp;&nbsp;ENGLISH&nbsp;&nbsp;
              </li>
            </ul>
          </li>

        </ul>
      </aside>
    </div>
    <header>
      <h1><a href="index.jsp"><img src="./images/logo.png" alt="logo"></a></h1>
      <nav class="gnb_main w1200 cf">
        <ul>
          <li class="m1"><a href="index.jsp?content=sub.jsp">호텔신라&nbsp;소개</a></li>
          <li class="m2"><a href="#">SHILLA&nbsp;BLANDS</a></li>
        </ul>
        <ul>
          <li class="m3"><a href="#">멤버십</a></li>
          <li class="m4"><a href="boardlist.do">고객문의</a></li>
          <li class="m5"><a href="https://www.theshilla.shop/" target="_blank">The&nbsp;Shilla&nbsp;Shop</a>
          </li>
        </ul>
      </nav>
    </header>
    <div class="hidden_depth">
      <nav class="gnb_sub">
        <ul>
          <li><a href="index.jsp?content=sub.jsp">개요</a>&nbsp;&nbsp;&nbsp;&nbsp;|</li>
          <!-- 수정v1.1.5 href속성값 수정 -->
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?content=sub.jsp#seoul">서울신라호텔 소개</a>&nbsp;&nbsp;&nbsp;&nbsp;|
          </li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?content=sub.jsp#jeju">제주신라호텔 소개</a>&nbsp;&nbsp;&nbsp;&nbsp;|
          </li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?content=sub.jsp#monogram">신라모노그램 in다낭
              소개</a>&nbsp;&nbsp;&nbsp;&nbsp;|</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?content=sub.jsp#stay">신라스테이</a></li>
        </ul>
      </nav>
      <nav class="gnb_sub cf">
        <dl class="seoul">
          <!-- 수정v1.1.10 서울신라호텔 제외 링크 # 처리 + Dinning, LifeStyle 페이지링크 추가 + Dinning 텍스트노드 오타수정 -->
          <dt>서울신라호텔</dt>
          <dd><a href="index.jsp?content=contents_room.jsp">Room</a></dd>
          <dd><a href="index.jsp?content=contents_dinning.jsp">Dinning</a></dd>
          <dd><a href="index.jsp?content=contents_lifestyle.jsp">LifeStyle</a></dd>
          <dd><a href="index.jsp?content=contents_wedding.jsp">웨딩&연회</a></dd>
        </dl>
        <dl class="jeju">
          <dt>제주신라호텔</dt>
          <dd><a href="#">Room</a></dd>
          <dd><a href="#">Dinning</a></dd>
          <dd><a href="#">Activity</a></dd>
          <dd><a href="#">부대시설</a></dd>
        </dl>
        <dl class="danang">
          <dt>신라모노그램</dt>
          <dd><a href="#">Room</a></dd>
          <dd><a href="#">Dinning</a></dd>
          <dd><a href="#">Activity</a></dd>
          <dd><a href="#">부대시설</a></dd>
        </dl>
        <dl class="stey">
          <dt>신라스테이</dt>
          <dd><a href="#">Room</a></dd>
          <dd><a href="#">Dinning</a></dd>
          <dd><a href="#">부대시설</a></dd>
        </dl>
      </nav>
      <nav class="gnb_sub">
        <dl>
          <dt>신라&nbsp;리워즈</dt>
          <dd><a href="#">회원특전</a></dd>
          <dd><a href="#">포인트안내</a></dd>
        </dl>
        <dl>
          <dt>신라&nbsp;에스</dt>
          <dd><a href="#">소개</a></dd>
          <dd><a href="#">브라운</a></dd>
          <dd><a href="#">블랙</a></dd>
        </dl>
      </nav>
      <nav class="gnb_sub">
        <ul>
          <li><a href="boardlist.do">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;|</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">지점별&nbsp;연락처</a>&nbsp;&nbsp;&nbsp;&nbsp;|</li>
          <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="boardadd.do">문의하기</a></li>
        </ul>
      </nav>
    </div>
    <!-- /Header 영역 끝 -->