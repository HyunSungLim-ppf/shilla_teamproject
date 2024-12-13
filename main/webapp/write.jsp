<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
    <link rel="stylesheet" href="./css/shilla_write_rwd.css">
    <style>
        .button1 {
            /* 이메일, 아이디 중복확인 버튼 */
            background-color: #7c6347;
            color: #faf1d0;
        }
    </style>
</head>

<body>
<!-- <main class="w800"> -->
        <main class="w800">
            <div class="top">
                <h2>문의하기</h2>
                <ul>                    
                    <!-- 수정v1.1.8 폰트어썸에서 아이콘 추가 및 간격 수정 -->
                    <li><a><i class="fa-solid fa-house"></i></a></li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li><a>고객문의</a></li>
                    <li><i class="fa-solid fa-chevron-right"></i></li>
                    <li><a>문의하기</a></li>
                </ul>
            </div>
            <!-- <form action="#" method="post"> -->
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
            <form action="boardadd.do" method="post" class="w800" name="frm">
                <fieldset>
                	<input type="hidden" name="searchText" value="${searchText}">
                	<input type="hidden" name="searchField" value="${searchField}">                	
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
                    <div class="sec_1">
                        <h3>*구분</h3>
                        <div class="radio_group">
                            <!-- 수정v1.1.8 구조수정 -->
                            <label for="shilla">
                                <input type="radio" name="brand" id="shilla1" value="1" checked="checked">
                                <p>서울신라호텔</p>
                            </label>
                            <label for="shilla">
                                <input type="radio" name="brand" id="shilla2" value="2">
                                <p>제주신라호텔</p>
                            </label>
                            <label for="shilla">
                                <input type="radio" name="brand" id="shilla3" value="3">
                                <p>신라모노그램</p>
                            </label>
                            <label for="shilla">
                                <input type="radio" name="brand" id="shilla4" value="4">
                                <p>신라스테이</p>
                            </label>
                            <!-- <label for="shilla">
                                <input type="radio" name="shilla" id="shilla" checked>
                                <p>신라호텔</p>
                            </label>
                            <label for="shilla_mono">
                                <input type="radio" name="shilla" id="shilla_mono">
                                <p>신라모노그램</p>
                            </label>
                            <label for="shilla_stay">
                                <input type="radio" name="shilla" id="shilla_stay">
                                <p>신라스테이</p>
                            </label>
                            <label for="shilla_dev">
                                <input type="radio" name="shilla" id="shilla_dev">
                                <p>호텔개발</p>
                            </label> -->
                        </div>
                    </div>
                    <div class="sec_2">
                        <h3>*관련문의</h3>
                        <!-- 수정v1.1.8 구조변경 -->
                        <div class="select_q">
                            <select name="category" id="select">
                                <option value=""  selected disabled id="ss">서울신라호텔 문의</option>
                                <option value=""  disabled id="js">제주신라호텔 문의</option>
                                <option value=""  disabled id="sm">신라모노그램 문의</option>
                                <option value=""  disabled id="st">신라스테이 문의</option>
                                <option value="a" id="aa">객실/패키지문의</option>
                                <option value="b" id="bb">다이닝문의</option>
                                <option value="c" id="cc">웨딩 문의</option>
                                <option value="d" id="dd">연회/회의 문의</option>
                                <option value="e" id="ee">멤버쉽 문의</option>
                                <option value="f" id="ff">기타 문의</option>
                            </select>
                            <!-- <select name="category" id="select2">
                                <option value="" selected disabled>제주신라호텔 문의</option>
                                <option value="a">객실/패키지문의</option>
                                <option value="b">다이닝문의</option>
                                <option value="d">연회/회의 문의</option>
                                <option value="e">멤버쉽 문의</option>
                            </select>
                            <select name="category" id="select3">
                                <option value="" selected disabled>신라모노그램 문의</option>
                                <option value="a">객실/패키지문의</option>
                                <option value="b">다이닝문의</option>
                                <option value="e">멤버쉽 문의</option>
                                <option value="f">기타 문의</option>
                            </select>
                            <select name="category" id="select4">
                                <option value="" selected disabled>신라스테이 문의</option>
                                <option value="a">객실/패키지문의</option>
                                <option value="b">다이닝문의</option>
                                <option value="f">기타 문의</option>                                
                            </select> -->
                        </div>
                        <!-- <div>
                            <select name="#" id="#">
                                <option value="#">선택</option>
                                <option value="#">객실/패키지문의</option>
                                <option value="#">다이닝문의</option>
                                <option value="#">연회/회의 문의</option>
                                <option value="#">홈페이지 오류 문의</option>
                            </select>
                        </div> -->
                    </div>
                    <div class="sec_20">
                        <h3>*제목</h3>
                        <div><input type="text" name="title"></div>
                    </div>
                    <!-- 제목 아래 쪽으로 작성자 위치 이동 -->
                    <div class="sec_4">
                        <!-- 성명 => 작성자로 변경 -->
                        <h3>작성자</h3>
                        <!-- <h3>*성명(국문/영문)</h3> -->
                        <div>
                        	${member.name_kr }
                        	<!-- 성명 삭제 (작성자 고정 값 들어감)-->
                            <!-- <select name="select1" id="select1">
                                <option value="#">선택</option>
                                <option value="#">Ms.</option>
                                <option value="#">Mr.</option>
                                <option value="#">Dr.</option>
                            </select>
                            <input type="text"> -->
                        </div>
                    </div>
                    <div class="sec_3">
                        <h3 class="content">*내용</h3>
                        <div><textarea name="content" id="content" cols="30" rows="5"></textarea></div>
                    </div>
                    <div class="group">                        
                        <div class="sec_5">
                            <h3>이메일</h3>
                            <div class="email">
	                            ${member.email }
                        	</div>
                        </div>
                        <div class="sec_6">
                            <h3>휴대전화</h3>
                            <div>${member.phone }</div>
                        </div>
                        <!-- 자택전화번호 삭제 -->
                        <!-- <div class="sec_7">
                            <h3>*자택전화</h3>
                            <div><input type="tel"></div>
                        </div> -->
                    </div>
                    <div class="sec_8">
                        <h4>필수적 개인정보 수집 및 이용에 대한 동의</h4>
                        <textarea name="text" id="textarea">
  신라호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.

  1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항
  ① 수집ㆍ이용 항목 | 성명(국문·영문), 성별, 이메일, 휴대전화
  ② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공
  ③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 2년간
  ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.
               			</textarea>
                        <label>
                            <input type="checkbox" name="checkbox1" id="agree1">
                            <p>동의함</p>
                        </label>
                    </div>
                    <div class="sec_9">
                        <h4>선택적 개인정보 수집 및 이용에 대한 동의</h4>
                        <textarea name="text" id="textarea">
  신라호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.

  선택적인 개인정보의 수집 ㆍ이용에 관한 사항
  ① 수집ㆍ이용 항목 | 자택전화
  ② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공
  ③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 2년간
  ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 일반전화 안내 진행이 불가능 할 수 있음을 알려드립니다.
               			</textarea>
                        <label>
                            <input type="checkbox" name="checkbox2" id="agree2">
                            <p>동의함</p>
                        </label>
                    </div>
                    <div class="button_group">
                        <!-- 수정v1.1.8 = button type="submit, get" 제거 / a태그 위치 button 내부로 변경 -->                        
                        <button type="submit" onclick="return addCheck()"><a>등록</a></button>
                        <button type="reset" onclick="history.go(-1)"><a>취소</a></button>
                        <!-- <a href="./shilla_board.html"><button type="submit">등록</button></a>
                        <a href="./shilla_board.html"><button type="get">취소</button></a> -->
                    </div>
                </fieldset>
            </form>
        </main>
    <script src="./js/shilla_write.js"></script>  
</body>
</html>