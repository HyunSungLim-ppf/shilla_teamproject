<%@page import="com.shilla.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDTO member = (MemberDTO) session.getAttribute("member");
//생년월일
String[] email = member.getEmail().split("@");
String[] phone = member.getPhone().split("-");
String[] tel = member.getTel().split("-");
// 주소 구분자 / 에서 - 로 수정
String[] address = member.getAddress().split("-");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- Page CSS -->
<link rel="stylesheet" href="./css/shilla_handle_form.css">
</head>
<body>
	<!-- Sign up Main -->
	<main>
		<div id="wrap_main">
			<h1>회원정보 수정</h1>
			<form action="memberhandle.do" method="post"
				onsubmit="return checkForm() && telLength() && telAreaNum();">
				<!-- <form action="memberhandle.do" method="post" onsubmit="return checkForm()"> -->
				<div class="essential">
					<h2>기본정보 수정</h2>
					<p>*수정할 정보를 모두 입력해주세요</p>
				</div>
				<fieldset>
					<table>
						<tr>
							<td><label for="name_kr">성명(국문) </label></td>
							<td><p class="pstyle"><%=member.getName_kr()%></p></td>
						</tr>
						<tr>
							<td><label for="name_en">성명(영문) </label></td>
							<td>
								<p class="pstyle"><%=member.getName_en_first()%>
									<%=member.getName_en_last()%></p>
							</td>
						</tr>
						<tr>
							<td><label for="birth">생년월일</label></td>
							<td>
								<p class="pstyle">
									<%=member.getBirth()%>
								</p>
							</td>
						</tr>
						<tr>
							<td><label for="email">이메일 </label></td>
							<td><input type="text" id="email_1" name="email_1"
								autocomplete="none" placeholder="<%=email[0]%>"
								value="<%=email[0]%>">@ <label for="email_2"></label> <input
								type="text" id="email_2" name="email_2" autocomplete="none"
								placeholder="<%=email[1]%>" value="<%=email[1]%>"> <select
								name="domain" id="domain" name="email">
									<option value="yourown">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
							</select>
								<button type="button" class="button1">
									<p>이메일 중복확인</p>
								</button> <!-- 추가 --> <br> <span id="email_input_info"></span> <!-- /추가 -->
							</td>
						</tr>
						<tr>
							<td><label for="c_phone">휴대전화 </label></td>
							<td><label for="phone"></label> <select name="phone_1"
								id="phone" required>
									<optgroup>
										<option value="010">010</option>
										<option value="011">011</option>
									</optgroup>
							</select> - <input type="text" id="phone_2" name="phone_2" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '')"
								autocomplete="none" placeholder="<%=phone[1]%>"
								value="<%=phone[1]%>"> - <input type="text" id="phone_3"
								name="phone_3" maxlength="4"
								oninput="this.value = this.value.replace(/[^0-9]/g, '')"
								autocomplete="none" placeholder="<%=phone[2]%>"
								value="<%=phone[2]%>"></td>
						</tr>
						<tr>
							<td><label for="adress">자택주소 </label></td>
							<td><input type="text" id="postnum" name="postnum"
								placeholder="<%=address[0]%>" value="<%=address[0]%>">
								<button class="button2">
									<a href="https://www.juso.go.kr/openIndexPage.do">주소찾기</a>
								</button>
								<br> <input type="text" id="address1" name="address1"
								size="110" placeholder="<%=address[1]%>" value="<%=address[1]%>">
								<input type="text" id="address2" name="address2" size="110"
								placeholder="<%=address[2]%>" value="<%=address[2]%>"></td>
						</tr>
						<tr>
							<td><label for="tel">자택전화 </label></td>
							<td><select name="tel_1" id="tel_1">
									<optgroup>
										<%
										switch (tel[0]) {
										case "051":
										%>
										<option value="선택">선택</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="051" selected>051</option>
										<%
										break;
										case "02":
										%>
										<option value="선택">선택</option>
										<option value="02" selected>02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="051">051</option>
										<%
										break;
										case "031":
										%>
										<option value="선택">선택</option>
										<option value="02">02</option>
										<option value="031" selected>031</option>
										<option value="032">032</option>
										<option value="051">051</option>
										<%
										break;
										case "032":
										%>
										<option value="선택">선택</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032" selected>032</option>
										<option value="051">051</option>
										<%
										break;
										default:
										%>
										<option value="선택" selected>선택</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="051">051</option>
										<%
										break;
										}
										%>
									</optgroup>
							</select> <%
 if (tel[1].equals(" ")) {
 %> <input type="text" id="tel_2"
								name="tel_2" maxlength="8" autocomplete="none"
								oninput="this.value = this.value.replace(/[^0-9]/g, '')"
								placeholder="<%=tel[1]%>"> <%
 } else {
 %> <input type="text" id="tel_2"
								name="tel_2" maxlength="8" autocomplete="none"
								oninput="this.value = this.value.replace(/[^0-9]/g, '')"
								placeholder="<%=tel[1]%>" value="<%=tel[1]%>"> <%
 }
 %></td>
						</tr>
					</table>
				</fieldset>
				<h2>비밀번호 수정</h2>
				<fieldset>
					<table>
						<tr>
							<td><label for="id">아이디</label></td>
							<td>
								<p class="pstyle">
									<%=member.getId()%>
								</p>
							</td>
						</tr>
						<tr>
							<td><label for="pwd1">새 비밀번호 </label></td>
							<td><input type="password" id="pwd1" name="pwd1"
								minlength="8" maxlength="20"> <span>8~20자 이내
									영문/숫자 조합(특수문자 입력 가능)</span></td>
						</tr>
						<tr>
							<td><label for="pwd2">새 비밀번호 확인 </label></td>
							<td><input type="password" id="pwd2" name="pwd2"> <span
								id="pasword_repeat_input_info"></span></td>
						</tr>
					</table>
				</fieldset>
				<h2>프로모션 코드 입력</h2>
				<fieldset>
					<table>
						<tr>
							<td><label for="promo">프로모션 코드 </label></td>
							<td><input type="text" id="promo" name="promo"> <span>이벤트
									참여 시 제공받은 코드를 입력해주시기 바랍니다</span></td>
						</tr>
					</table>
				</fieldset>
				<p>※신라리워즈 가입 고객께는 모바일 카드가 발급되며 혜택 및 약관은 홈페이지에서 확인 가능합니다</p>
				<div class="submit">
					<input type="button" value="취소" class="button4"
						onclick="location.href='index.jsp?content=memberhandleform.do'">
					<div>
						<input type="submit" value="회원정보 수정" class="button4">
						<%--<input type="button" value="회원정보 삭제" class="button4" onclick="location.href='memberhandle.do?id=<%=member.getId()%>'"> --%>
						<input type="button" value="회원정보 삭제" class="button4"
							onclick="deleteChk('<%=member.getId()%>')">
					</div>
				</div>
			</form>
		</div>
	</main>

	<!-- <script type="text/javascript" src="./js/shilla_member_handle.js"></script> -->
	<script type="text/javascript" src="./js/shilla_member_handle.js"></script>
</body>

</html>