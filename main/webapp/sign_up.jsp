	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- Page CSS -->
    <link rel="stylesheet" href="./css/shilla_sign_up.css">
</head>
<body>
<!-- Sign up Main -->
        <main>
            <div id="wrap_main">
                <h1>회원정보 입력</h1>
                <form action="signup.do" method="post" onsubmit="return checkForm()">
                    <div class="essential">
                        <h2>기본 입력</h2>
                        <p>*표시 입력 필수사항</p>
                    </div>
                    <fieldset>
                        <table>
                            <tr>
                                <td><label for="name_kr" >성명(국문) * </label></td>
                                <td><label for="gender"></label>
                                    <select name="gender" id="gender" required>
                                        <optgroup>
                                            <option value="male">Mr.</option>
                                            <option value="female">Ms.</option>
                                        </optgroup>
                                    </select>
                                    <input type="text" id="name_kr" name="name_kr" required>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="name_en">성명(영문) * </label></td>
                                <td>
                                    <input type="text" id="name_en_f" name="name_en_f" placeholder="First name(이름)" required>
                                    <input type="text" id="name_en_l" name="name_en_l" placeholder="Last name(성)" required>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="birth">생년월일 * </label></td>
                                <td><label for="year"></label>
                                    <select name="year" id="year" required>
                                        <option disabled selected>출생연도</option>
                                    </select>
                                    <label for="month"></label>
                                    <select name="month" id="month" required>
                                        <option disabled selected size="10">월</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                    <label for="day"></label>
                                    <select name="day" id="day" required>
                                        <option disabled selected>일</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="email">이메일 * </label></td>
                                <td>
                                    <input type="text" id="email_1" name="email_1" autocomplete="none" required>@
                                    <label for="email_2"></label>
                                    <input type="text" id="email_2" name="email_2" autocomplete="none" required>
                                    <select name="domain" id="domain" name="email">
                                        <option value="yourown">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                    </select>
                                    <button class="button1">
                                        <p>이메일 중복확인</p>
                                    </button>
                                    <!-- 추가 -->
                                    <br>
                                    <span id="email_input_info"></span>
                                    <!-- /추가 -->
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td>
                                    <label for="c_phone">휴대전화 * </label>
                                </td>
                                <td>
                                    <label for="phone"></label>
                                    <select name="phone_1" id="phone" required>
                                        <optgroup>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                        </optgroup>
                                    </select>
                                    - <input type="text" id="phone_2" name="phone_2" maxlength="4"
                                        oninput="this.value = this.value.replace(/[^0-9]/g, '')" required
                                        autocomplete="none">
                                    - <input type="text" id="phone_3" name="phone_3" maxlength="4"
                                        oninput="this.value = this.value.replace(/[^0-9]/g, '')" required
                                        autocomplete="none">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="adress">자택주소 </label>
                                </td>
                                <td>
                                    <input type="text" id="postnum" name="postnum">
                                    <button class="button2"><a href="https://www.juso.go.kr/openIndexPage.do">주소찾기</a></button><br>
                                    <input type="text" id="address1" name="address1" size="110">
                                    <input type="text" id="address2" name="address2" size="110">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="tel">자택전화 </label>
                                </td>
                                <td>
                                    <select name="tel_1" id="tel_1">
                                        <optgroup>
                                            <option value="선택">선택</option>
                                            <option value="02">02</option>
                                            <option value="031">031</option>
                                            <option value="032">032</option>
                                            <option value="051">051</option>
                                        </optgroup>
                                    </select>
                                    <input type="text" id="tel_2" name="tel_2" maxlength="8" autocomplete="none"
                                        oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <h2>웹사이트 비밀번호 입력</h2>
                    <fieldset>
                        <table>
                            <tr>
                                <td>
                                    <label for="id">아이디 * </label>
                                </td>
                                <td>
                                    <input type="text" id="id" name="id" minlength="5" maxlength="12" required>
                                    <button type="button" class="button3">아이디 중복확인</button>
                                    <span id="id_input_info">5~12자 이내 영문/숫자 조합</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd1">비밀번호 *</label>
                                </td>
                                <td>
                                    <input type="password" id="pwd1" name="pwd1" minlength="8" maxlength="20"
                                        required>
                                    <span>8~20자 이내 영문/숫자 조합(특수문자 입력 가능)</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd2">비밀번호 확인 *</label>
                                </td>
                                <td>
                                    <input type="password" id="pwd2" name="pwd2" required>
                                    <span id="pasword_repeat_input_info"></span>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <h2>프로모션 코드 / 추천인 아이디 입력</h2>
                    <fieldset>
                        <table>
                            <tr>
                                <td>
                                    <label for="promo">프로모션 코드 </label>
                                </td>
                                <td>
                                    <input type="text" id="promo" name="promo">
                                    <span>이벤트 참여 시 제공받은 코드를 입력해주시기 바랍니다</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="reco">추천인 아이디 </label>
                                </td>
                                <td>
                                    <input type="text" id="reco" name="reco">
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <p>※신라리워즈 가입 고객께는 모바일 카드가 발급되며 혜택 및 약관은 홈페이지에서 확인 가능합니다 </p>
                    <div class="submit">
                    <!-- 
                    
                        <button value="가입 신청" class="button4"><a href="">가입신청</a></button>
                     -->
                     	<input type="submit" value="가입신청" class="button4"/>
                        <input type="button" value="취소" class="button4" 
                     		onclick="location.href='index.jsp?content=login.jsp'"/>
                    </div>
                </form>
            </div>
        </main>
        <!-- /Sign up Main -->
    <script src="./js/shilla_sign_up.js"></script>
</body>

</html>