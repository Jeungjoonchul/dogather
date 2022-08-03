/**
 * 
 */
var cp = '${cp}'

function checkEmail(cp) {
	var user_email_tag = $('#user_email');
	var user_email = user_email_tag.val();
	var result = user_email_tag.parent().parent().next().children().first()
			.children();
	const reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if (user_email == '') {
		result.text('null');
	} else if (!reg_email.test(user_email)) {
		result.text('invaild');
	} else {
		$.ajax({
			url : cp + "/user/user_check_email.us",
			data : {
				"user_email" : user_email
			},
			type : "get",
			dataType : "text",
			success : function(data) {
				if (data == 'O') {
					result.text('ok');
				} else {
					result.text('duplication');
				}
			}
		});
	}
}

function emailStatus(){
	var user_email_tag = $('#user_email');
	var result = user_email_tag.parent().parent().next().children().first().children();
	var resultText=result.parent().next().children();
	if(result.text()=='null'){
		resultText.text('이메일을 입력해주세요.');
		resultText.css('color','deeppink');
	}else if(result.text()=='invaild'){
		resultText.text('이메일 형식이 올바르지 않습니다.');
		resultText.css('color','deeppink');
	}else if(result.text()=='duplication'){
		resultText.text('중복된 이메일입니다.');
		resultText.css('color','deeppink');
	}else{
		resultText.text('사용 가능한 이메일입니다.');
		resultText.css('color','deepskyblue');
	}
}

function checkNickname(cp) {
	var user_nickname_tag = $('#user_nickname');
	var user_nickname = user_nickname_tag.val();
	var result = user_nickname_tag.parent().parent().next().children().first()
			.children();
	const reg_nickname = /^[가-힣a-zA-Z0-9]{2,10}$/;
	if (user_nickname == '') {
		result.text('null');
	} else if (!reg_nickname.test(user_nickname)) {
		result.text('invaild');
	} else {
		$.ajax({
			url : cp + "/user/user_check_nickname.us",
			data : {
				"user_nickname" : user_nickname
			},
			type : "get",
			dataType : "text",
			success : function(data) {
				if (data == 'O') {
					result.text('ok');
				} else {
					result.text('duplication');
				}
			}
		});
	}
}

function nicknameStatus(){
	var user_nickname_tag = $('#user_nickname');
	var result = user_nickname_tag.parent().parent().next().children().first().children();
	var resultText=result.parent().next().children();
	if(result.text()=='null'){
		resultText.text('닉네임을 입력해주세요.');
		resultText.css('color','deeppink');
	}else if(result.text()=='invaild'){
		resultText.text('닉네임 형식이 올바르지 않습니다.');
		resultText.css('color','deeppink');
	}else if(result.text()=='duplication'){
		resultText.text('중복된 닉네임입니다.');
		resultText.css('color','deeppink');
	}else{
		resultText.text('사용 가능한 닉네임입니다.');
		resultText.css('color','deepskyblue');
	}
}

function sendit_terms() {
	var terms_form = document.terms_form;
	const user_terms_essential1 = terms_form.user_terms_type1;
	const user_terms_essential2 = terms_form.user_terms_type2;
	const user_terms_selective1 = terms_form.user_terms_type3;
	const user_terms_selective2 = terms_form.user_terms_type4;
	if (!user_terms_essential1.checked) {
		alert('이용 약관에 미동의');
		return false;
	}
	if (!user_terms_essential2.checked) {
		alert('개인 정보 제공에 미동의');
		return false;
	}
	if (user_terms_selective1.checked) {
		user_terms_selective1.value = true;
	}
	if (user_terms_selective2.checked) {
		user_terms_selective2.value = true;
	}
	return true;
}

function daumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("address_extra").value = extraAddr;

			} else {
				document.getElementById("address_extra").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zip_code').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("address_detail").focus();
		}
	}).open();
}

// user_email_tag.parent().parent().next().children().next().children().text('사용
// 가능한 이메일입니다.');
// user_email_tag.parent().parent().next().children().next().children().css('color',
// 'deepskyblue');
// user_email_tag.parent().parent().next().children().next().children().text('사용이
// 불가한 이메일입니다.');
// user_email_tag.parent().parent().next().children().next().children().css('color',
// 'deeppink');
