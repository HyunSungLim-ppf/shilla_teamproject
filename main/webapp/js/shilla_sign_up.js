// 도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain')
const domainInputEl = document.querySelector('#email_2')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
	// 이메일 양식 스타일 전부 제거
	$('input[id=email_2]')
		.removeClass('failed_input_style')
		.removeClass('success_input_style')
	$('input[id=email_1]')
		.removeClass('failed_input_style')
		.removeClass('success_input_style')
	$('#email_input_info')
		.empty()
	// option에 있는 도메인 선택 시
	if (event.target.value !== "yourown") {
		// 선택한 도메인을 input에 입력하고 disabled
		//domainInputEl.value = event.target.value
		//domainInputEl.disabled = true

		//$('input[id=email_2]').val(event.target.value);
		//$('input[id=email_2]').disable = true

		domainInputEl.value = event.target.value
		domainInputEl.readOnly = true

	} else { // 직접 입력 시
		// input 내용 초기화 & 입력 가능하도록 변경
		domainInputEl.value = ""
		domainInputEl.readOnly = false
	}
});


// Populate Year Dropdown
const yearSelect = document.getElementById('year');
const currentYear = new Date().getFullYear();
for (let i = currentYear; i >= 1900; i--) {
	const option = document.createElement('option');
	option.value = i;
	option.textContent = i;
	yearSelect.appendChild(option);
}

// Populate Day Dropdown based on selected month and year
const monthSelect = document.getElementById('month');
const daySelect = document.getElementById('day');

function updateDays() {
	daySelect.innerHTML = '<option disabled selected>일</option>'; // Reset days

	const year = parseInt(yearSelect.value);
	const month = parseInt(monthSelect.value);

	if (!isNaN(year) && !isNaN(month)) {
		const daysInMonth = new Date(year, month, 0).getDate(); // Get number of days in the month
		for (let i = 1; i <= daysInMonth; i++) {
			const option = document.createElement('option');
			option.value = i;
			option.textContent = i;
			daySelect.appendChild(option);
		}
	}
}


// Event Listeners
yearSelect.addEventListener('change', updateDays);
monthSelect.addEventListener('change', updateDays);



// -----------------------------기능 추가 by 현성 -----------------------------

/*
서버(DB) 없는 상황에서 js만으로 구현한다 했을때 check해야 할 것 3가지
(나머지는 제출시 DOM객체 inline 속성 required로 검증할 수 있어서 안함)
1. 아이디 중복 -> 일단은 아이디 형식 확인을 통과 했는가?
2. 이메일 중복 -> 일단은 이메일 형식 확인을 통과 했는가?
3. 비밀번호 -> 일단은 올바른 비밀번호 형식과 가입시 비밀번호 확인을 통과 했는가?
*/
// 객체로(객체로 작성하는게 내가(현성) 쓰기 편해서)
/*let chkList = {
	idChk: false,
	emailChk: false,
	passwordChk: false
}*/

// 유효성검사 판별을 객체에서 변수로(알아보기 쉽게 하기 위해)
let idChk = false;
let emailChk = false;
let pwdChk = false;

// 1. .button1 : 기존 이메일 확인 버튼 -> 클릭시 Front 에서만 유효성 검사
// 일단은 DB가 없어 이메일 형식만 맞는지 확인
$('.button1').click(function(event) {

	// Form 태그안 기본 기능 막기(Front에서만 처리할거라서) 
	// 왜이렇게하나요? 알아보니 Form 태그 안에 button태그 클릭시 기본 기능이 submit 입니다. submit을 지정해 주지 않아도
	event.preventDefault()

	// 이메일 조건 1 = @ 앞에는 알파벳(대문자, 소문자)와 숫자의 조합으로만 가능
	// 이메일 조건 2 = @ 뒤에는(보편적 이메일 주소) 알파벳(소문자).알파벳(소문자)만 가능
	let correct_email_form = /^[A-Za-z0-9]+@[a-z]+\.[a-z]+/;

	// 가입자가 입력한 이메일 
	let inputed_email = $('input[id=email_1]').val() + "@" + $('input[id=email_2]').val()

	// 이메일 앞 input에 000@000.com 형식으로 입력했으면 유효성 검사 실패
	if (correct_email_form.test($('input[id=email_1]').val())) {
		// 1. 경고창을 통해 올바른 이메일 주소가 아니라고 출력
		alert("이메일 주소가 올바르지 않습니다.");

		// 2. 이메일 입력 input의 값 초기화 
		$('input[id=email]').val("")

		// 3-1. 실패 텍스트 보여주기
		$('#email_input_info')
			.text("※이메일 양식을 다시 입력해 주세요.")
			.css({ color: "red", 'font-weight': '600' })

		// 3-2. 실패시 이메일 입력 input창 스타일
		$('input[id=email_1]')
			.removeClass('success_input_style')
			.addClass('failed_input_style')

		$('input[id=email_2]')
			.removeClass('success_input_style')
			.addClass('failed_input_style')
		// 실패시 바로 탈출!
		emailChk = false;
		return
	}

	// 가입자가 입력한 값으로만 Front에서 이메일 형식 유효성 검사
	if (correct_email_form.test(inputed_email) == false) {  // 유효성 검사 실페시
		// 1. 경고창을 통해 올바른 이메일 주소가 아니라고 출력
		alert("이메일 주소가 올바르지 않습니다.");

		// 2. 이메일 입력 input의 값 초기화 
		$('input[id=email]').val("")

		// 3-1. 실패 텍스트 보여주기
		$('#email_input_info')
			.text("※이메일 양식을 다시 입력해 주세요.")
			.css({ color: "red", 'font-weight': '600' })

		// 3-2. 실패시 이메일 입력 input창 스타일
		$('input[id=email_1]')
			.removeClass('success_input_style')
			.addClass('failed_input_style')

		$('input[id=email_2]')
			.removeClass('success_input_style')
			.addClass('failed_input_style')
		// 실패시 바로 탈출!
		emailChk = false;
		return

	} else { // 유효성 검사 성공시

		// 1-1. 성공 텍스트 보여주기
		/*
		$('#email_input_info')
			.text("※사용가능한 이메일 입니다.")
			.css({ color: "green", 'font-weight': '600' })
		*/
		// 1-2. 성공시 input창 스타일
		/*
		$('input[id=email_1]')
			.removeClass('failed_input_style')
			.addClass('success_input_style')

		$('input[id=email_2]')
			.removeClass('failed_input_style')
			.addClass('success_input_style')
		*/
		// 1-3 성공시 아이디 확인(일단은 아이디 형식만 맞는지(DB가 없어 중복확인은 못함))
		// 1-4 이메일 형식 검사 성공시 ajax를 통해 실제 DB 중복 검사
		// 비동기식 통신 : ajax
		/*
		- url : 매핑값
		- data : key에는 name속성 
		- type : form태그의 method속성과 유사
		- success : 성공했을 때 => 매개변수에 변수를 넣어 결과값을 받아줌 
			=> label의 content영역에 출력해주기 
		- error : 실패 시 실행할 구문 
		- complete : 성공/실패와 상관없이 실행할 구문 
		 */
		$.ajax({
			url: 'emailoverlappingchk.do',
			data: {
				email: $('input[id=email_1]').val() + "@" + $('input[id=email_2]').val(),

			},
			type: 'get',
			success: function(result) {
				if (result == "ok") {
					alert('사용가능한 이메일 입니다.')
					emailChk = true;
					$('input[id=email_1]')
						.removeClass('failed_input_style')
						.addClass('success_input_style')

					$('input[id=email_2]')
						.removeClass('failed_input_style')
						.addClass('success_input_style')
					$('#email_input_info')
						.text("※사용가능한 이메일 입니다.")
						.css({ color: "green", 'font-weight': '600' })
				} else if (result == "no") {
					alert('중복된 이메일 입니다. 다시 입력해 주세요.')
					emailChk = false;
					$('input[id=email_1]')
						.removeClass('success_input_style')
						.addClass('failed_input_style')

					$('input[id=email_2]')
						.removeClass('success_input_style')
						.addClass('failed_input_style')
					$('#email_input_info')
						.text("※이메일 양식을 다시 입력해 주세요.")
						.css({ color: "red", 'font-weight': '600' })
				}
			},
			error: function() {
				alert('ajax통신 실패');
			},
			complete: function() {
				console.log('테스트');
			}
		});
	}



})
// 가입자가 이메일 유효성 검사 후 해당 input 내용을 바꿨을 시
$('input[id=email_1]').change(function() {
	$(this)
		.removeClass('failed_input_style')
		.removeClass('success_input_style')

	$('input[id=email_2]')
		.removeClass('failed_input_style')
		.removeClass('success_input_style')
	$('#email_input_info')
		.empty()
})
$('input[id=email_2]').change(function() {
	$(this)
		.removeClass('failed_input_style')
		.removeClass('success_input_style')
	$('#email_input_info')
		.empty()
})


// 2. .button3 : 아이디 중복 확인 버튼 -> 클릭시 Front 에서만 유효성 검사
$('.button3').click(function() {

	// 아이디 조건 : 5~12자 이내 영문/숫자 조합 이어야 함
	let correct_id_form = /^[A-Za-z0-9]{5,12}$/

	// 가입자가 입력한 아이디 
	let inputed_id = $('input[name=id]').val()

	// 가입자가 입력한 값으로만 Front에서 유효성 검사
	if (correct_id_form.test(inputed_id) == false) { // 실페시
		alert('사용 불가능한 아이디 입니다.\n※5~12자 이내 영문/숫자 조합 아이디를 다시 입력해 주세요.')

		$('span[id=id_input_info]')
			.empty()
			.text('※5~12자 이내 영문/숫자 조합 아이디를 다시 입력해 주세요.')
			.css({ color: "red", 'font-weight': '600' })

		$('input[id=id]')
			.val("")
			.removeClass('success_input_style')
			.addClass('failed_input_style')
		idChk = false;
		return
	} else {
		$.ajax({
			url: 'idoverlappingchk.do',
			data: {
				id: $('input[id=id]').val()
			},
			type: 'get',
			success: function(result) {
				if (result == "ok") {
					alert('사용가능한 아이디 입니다.')
					idChk = true;
					$('input[id=id]')
						.removeClass('failed_input_style')
						.addClass('success_input_style')

					$('#id_input_info')
						.text("※사용가능한 아이디 입니다.")
						.css({ color: "green", 'font-weight': '600' })
				} else if (result == "no") {
					alert('중복된 아이디 입니다. 다시 입력해 주세요.')
					idChk = false;
					$('input[id=id]')
						.removeClass('success_input_style')
						.addClass('failed_input_style')
					$('span[id=id_input_info]')
						.empty()
						.text('※5~12자 이내 영문/숫자 조합 아이디를 다시 입력해 주세요.')
						.css({ color: "red", 'font-weight': '600' })
				}
			},
			error: function() {
				alert('ajax통신 실패');
			},
			complete: function() {
				console.log('테스트');
			}
		});
	}
	// 가입자가 아이디 유효성 검사 후 해당 input 내용을 바꿨을 시
	$('input[id=id]').change(function() {
		$(this)
			.removeClass('failed_input_style')
			.removeClass('success_input_style')

		$('span[id=id_input_info]')
			.empty()
	})
})

// 3. 비밀번호 
// 비밀번호 형식 정규식
let correct_password_form = /[A-Za-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{8,20}$/

// 비밀번호 입력시(변경될 때마다)
$('input[id=pwd1]').change(function() {
	// 비밀번호 입력이 변경될 때마다 형식만 유효성 검사
	if (correct_password_form.test($(this).val()) == false) {  // 실패시
		$(this)
			.removeClass('success_input_style')
			.addClass('failed_input_style')
	} else {  // 성공시
		$(this)
			.removeClass('failed_input_style')
			.addClass('success_input_style')
	}
})

// 4. 비밀번호 확인
// 비밀번호 확인 input의 내용이 바뀔 때마다
$('input[id=pwd2]').change(function() {
	// 비밀번호 확인 입력이 변경될 때마다 형식만 유효성 검사
	if (correct_password_form.test($(this).val()) == false) {  // 실패시
		$(this)
			.removeClass('success_input_style')
			.addClass('failed_input_style')
	} else {  // 성공시
		$(this)
			.removeClass('failed_input_style')
			.addClass('success_input_style')
	}

	// 비밀번호 input의 내용과 일치한지 검사
	if ($(this).val() != $('input[id=pwd1]').val()) {   // 일치하지 않으면
		$(this)
			.removeClass('success_input_style')
			.addClass('failed_input_style')

		$('span[id=pasword_repeat_input_info]')
			.empty()
			.text('※비밀번호가 일치하지 않습니다.')
			.css({ color: "red", 'font-weight': '600' })
	} else { // 일치하면
		$(this)
			.removeClass('failed_input_style')
			.addClass('success_input_style')

		$('span[id=pasword_repeat_input_info]')
			.empty()
			.text('※비밀번호가 일치합니다.')
			.css({ color: "green", 'font-weight': '600' })
	}

	// 만약 비밀번호 확인 input의 내용이 비었다면
	if ($(this).val().length === 0) {
		$(this)
			.removeClass('failed_input_style')
			.removeClass('success_input_style')
		$('span[id=pasword_repeat_input_info]')
			.empty()
	}
})

// 5. 제출시 DOM객체 inline 속성 required없이 검증하는 3가지(아이디 확인, 이메일 확인, 비밀번호 확인)
// 을 모두 통과했을 때 활성화 => (시간남으면)작업 중







// 추가v1.1.5 
// 취소버튼 클릭시 회원 가입 form만 초기화 시킬지 회원 가입 자체를 취소할지 물어보고
// 최대한 Simple하게 처리할 것
$('.submit button').eq(1).click(function() {
	let userInput = confirm("[확인]을 누르면, 로그인 페이지로 이동합니다.\n[취소]를 누르면 가입 양식을 초기화 합니다.")
	if (userInput) {
		location.href = "index.jsp?content=login.jsp"
	} else {
		// location.reload()
		location.href = "index.jsp?content=sign_up.jsp"
	}
})

// 추가v1.1.11 가입 버튼 클릭시 일단 미안하다 해주고 로그인 페이지로 이동시킴
$("body").append('<div class="a" id=alert_easter>' +
	'<p>ㅗㅗ기껏작성했는데, 미안하다.</p>' +
	'<p>우리 일단 DB가 없어서 회원기능은 없으니, 그리 알아라</p>' +
	'<p>ㅋㅋㅄㅄㅄㅄㅄ</p>'
	+ '</div>')

$("body")
	.append('<div class="alert" id="alert_sign_up">' +
		'<p>🙇‍♂️🙇‍♀️</p>' +
		'<p>죄송합니다. 회원가입 기능이 준비되지 않았습니다.</p>' +
		'<p>회원가입은 자동으로 취소 됩니다.</p>' +
		'<p>3초 뒤에 로그인 페이지로 이동됩니다.</p>' +
		'</div>')


$('.submit button').eq(0).click(function(event) {
	event.preventDefault();
	if ($('input[id=reco]').val() == "형섭123") {

		$("#alert_easter").stop().fadeIn(700);
		setTimeout(function() {
			$("#alert_easter").stop().fadeOut(700)
			// }, 2000)
		}, 10000)
		setTimeout(function() {
			location.href = "index.jsp?content=login.jsp"
		}, 10000)
	} else {
		$("#alert_sign_up").stop().fadeIn(800);
		setTimeout(function() {
			$("#alert_sign_up").stop().fadeOut(800)
		}, 4000)
		setTimeout(function() {
			location.href = "index.jsp?content=login.jsp"
		}, 3000)
	}
});


// 폼 유효성 검사 추가 y
function checkForm() {
	/*
	if (idChk == false || emailChk == false || pwdChk == false) {
		alert('다시 작성해 주세요.')
		return false;
	} else if (idChk == true && emailChk == true && pwdChk == true) {
		return true;
	}
	*/
	// #비밀번호 유효성 검사 pwdChk
	if($('input[id=pwd1]').val() != $('input[id=pwd2]').val()){
		pwdChk = false;
		$('input[id=pwd2]').focus();
		alert('비밀번호 확인을 다시 해주세요')
		return false;
	} else {
		pwdChk = true;
	}
	if (emailChk == false || idChk == false) {
		if (emailChk == false) {
			$('input[id=email_1]').focus();
			alert('이메일을 다시 작성해주세요')
		} else if (idChk == false) {
			$('input[id=id]').focus();
			alert('아이디를 다시 작성해주세요')
		}
		return false;
	} else if (emailChk && idChk) {
		return true;
	}
}
