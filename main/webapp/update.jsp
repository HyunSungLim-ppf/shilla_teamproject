<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의글 수정</title>
    <link rel="stylesheet" href="./css/shilla_update_rwd.css">
    <style>
        .button1 {           
            background-color: #7c6347;
            color: #faf1d0;
        }
       
        
    </style>
</head>

<body>
    <div class="hidden_brand">${bean.brand}</div>
    <div class="hidden_category">${bean.category}</div>
    <main class="w800">
       <div class="top">
           <h2>문의글 수정</h2>
           <ul> 
               <li><i class="fa-solid fa-house"></i></li>
               <li><i class="fa-solid fa-chevron-right"></i></li>
               <li>고객문의</li>
               <li><i class="fa-solid fa-chevron-right"></i></li>
               <li>문의글 수정</li>
           </ul>
       </div>            
       <form action="boardupdate.do" method="post" class="w800" name="frm">
           <fieldset>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->           
           		<input type="hidden" name="searchText" value="${searchText }"/>
           		<input type="hidden" name="searchField" value="${searchField }"/>
<!-- 여기부터 리스트 / 서치리스트 페이지 이동관련 논리짠거임 ------------------------------------------------------------------------------------ -->
               	<div class="sec_1">
                	<h3>*구분</h3>
                	<div class="radio_group">
                      <!-- 수정v1.1.8 구조수정 -->
                    <label for="shilla1">
                        <input type="radio" name="brand" id="shilla1" value="1" checked="checked">
                        <p>서울신라호텔</p>
                    </label>
                    <label for="shilla2">
                        <input type="radio" name="brand" id="shilla2" value="2">
                        <p>제주신라호텔</p>
                    </label>
                     <label for="shilla3">
                         <input type="radio" name="brand" id="shilla3" value="3">
                         <p>신라모노그램</p>
                     </label>
                     <label for="shilla4">
                         <input type="radio" name="brand" id="shilla4" value="4">
                         <p>신라스테이</p>
                     </label>                   
                  </div>
               </div>
               <div class="sec_2">
                   <h3>*관련문의</h3>
            
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
                   </div>                 
               </div>
               <div class="sec_20">
                   <h3>*제목</h3>
                   <div><input type="text" name="title" value="${bean.title }"></div>
               </div>              
               <div class="sec_4">                   
                   <h3>작성자</h3>                   
                   <div>
                   	${bean.name }                   	
                   </div>
               </div>
               <div class="sec_3">
                   <h3 class="content">*내용</h3>
                   <div><textarea name="content" id="content" cols="30" rows="5">${bean.content }</textarea></div>
               </div>
               <div class="group">                        
                   <div class="sec_5">
                       <h3>이메일</h3>
                       <div class="email">
                        ${bean.email }
                   	</div>
                   </div>
                   <div class="sec_6">
                       <h3>휴대전화</h3>
                       <div>${bean.phone }</div>
                   </div>                       
                </div>                
                <div class="button_group">                    
                    <input type="hidden" name="num" value="${bean.num }">
                    <button type="submit" onclick="return updateCheck()"><a>수정완료</a></button>
                    <button type="button" onclick="history.go(-1)"><a>취소</a></button>                    
                </div>
            </fieldset>
        </form>
    </main>
    <script src="js/shilla_update.js"></script>    
</body>
</html>