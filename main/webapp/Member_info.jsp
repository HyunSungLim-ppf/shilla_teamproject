
<%@page import="com.shilla.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberDTO member = (MemberDTO)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 확인하기</title>
    <!-- Page CSS -->
    <link rel="stylesheet" href="./css/shilla_member_info.css">
</head>
<body>
<!-- Sign up Main -->
        <main>
            <div id="wrap_main">
                <h1>마이페이지</h1>
                <form action="#" method="post">
                    <div class="essential">
                        <h2>내 정보</h2>
                    </div>
                    <fieldset>
                        <table>
                            <tr>
                                <td>아이디</td>
                                <td>
                                    <p class="pstyle"><%=member.getId()%></p>
                                </td>
                            </tr>
                            <tr>
                                <td>성명(국문)</td>
                                <td>
                                    <p class="pstyle"><%=member.getName_kr() %></p>
                                </td>
                            </tr>
                            <tr>
                                <td>성명(영문)</td>
                                <td>
                                    <p class="pstyle"><%=member.getName_en_first()%> <%=member.getName_en_last() %></p>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="birth">생년월일  </label></td>
                                <td>
                                    <p class="pstyle"><%=member.getBirth() %></p>
                                </td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td>
                                    <p class="pstyle"><%=member.getEmail() %></p>
                                </td>
                            </tr>
                            <tr>
                                <td>휴대전화</td>
                                <td>
                                    <p class="pstyle"><%=member.getPhone() %></p>
                                </td>
                            </tr>
                            <tr>
                     			<td>자택주소</td>
                     			<td>
                     				<c:if test="${member.address == '- -' }">
                           				<p class="pstyle address">-</p>
                        			</c:if>
                        			<p class="pstyle address"><%=member.getAddress()%></p>
                        		</td>
                  			</tr>
                            <tr>
                                <td>
                                    자택전화
                                </td>
                                <td>
                                    <p class="pstyle"><%=member.getTel() %></p>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <div class="submit">
                        <!------------------------------------------ -->
                        <input type="button" value="내가 작성한 글 보기" onclick="location.href='boardidsearch.do?board_id=<%=member.getId() %>'" 
                        class="button5">
                      	<!------------------------------------------ -->
                        <div>
                        	<input type="button" value="회원정보 수정/삭제" class="button5" onclick="location.href='index.jsp?content=Member_handle_form.jsp'">
                        </div>
                    </div>
                </form>
            </div>
        </main>
        <!-- /Sign up Main -->
<script>
$(document).ready(
      function() {
         var addressText = $(".address").text().trim(); // 주소 텍스트 가져오기

         // 1. 값이 "- -"일 때 "-""로 변경
         if (addressText === "- -") {
            $(".address").text("-");
         } else {
            // 2. 주소를 "-" 기준으로 나누어서 처리
            let result = addressText.split("-");

            // 각 칸이 비어있는 경우를 처리
            if (result[0].trim() === "" && result[1].trim() != "" && result[2].trim() != "") {  //첫번째 칸만 비어있으면
               $(".address").text(result[1]+"-"+result[2]);
            } 
            else if(result[0].trim() != "" && result[1].trim() == "" && result[2].trim() != ""){ //두번째 칸만 비어있을 때
               $(".address").text(result[0]+"-"+result[2]);
            }
            else if(result[0].trim() != "" && result[1].trim() != "" && result[2].trim() == ""){ //세번째 칸만 비어있을 때
               $(".address").text(result[0]+"-"+result[1]);
            }
            
            else if(result[0].trim() === "" && result[1].trim() === "" && result[2].trim() != ""){ //세번째 칸만 값이 있을 떄
               $(".address").text(result[2]);                     
            }
            else if(result[0].trim() === "" && result[1].trim() != "" && result[2].trim() == ""){ //두번째 칸만 값이 있을 떄
               $(".address").text(result[1]);                     
            }
            else if(result[0].trim() != "" && result[1].trim() === "" && result[2].trim() == ""){ //첫번쩨 칸만 값이 있을 떄
               $(".address").text(result[0]);                     
            }

         }
      });
</script>
      
    <!-- <script src="./js/shilla_sign_up.js"></script> -->
</body>

</html></html>