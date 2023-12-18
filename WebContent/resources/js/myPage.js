$('#pwCheck').submit(function(event) {
	event.preventDefault();
	var isSubmit = false;
	$.ajax({
		url : cp + '/user/pwCheck.us',
		type : 'post',
		data : $('#pwCheck').serialize(),
		dataType : 'text',
		async : false,
		success : function(data) {

			if (data == 'O') {
				isSubmit = true;
				cnt=0;
			} else {
				isSubmit = false;
			}
		}
	});

	if (isSubmit) {
		this.submit();
	} else {
		alert("비밀번호가 일치하지 않습니다");
		user_password.value=""
		user_password.focus();
		cnt++;
		console.log(cnt);
		if(cnt==5){
			alert("5회 이상 틀리셨습니다. 로그아웃됩니다");
			$.ajax({
				url : cp + '/user/logout.us'
			});
		}
	}
});
$('#user_password').on(
		'keyup',
		function() {
			var user_password = $('#user_password').val();
			var resultText = $('#user_password').parent().parent().next()
					.children().last().children();
			resultText.css("color", "black");
			const regPW_n = /[0-9]+/;
			const regPW_l = /[a-zA-Z]+/;
			const regPW_sl = /[@$!%#?&]+/;
			var len = $('<span>비밀번호 길이 </span>');
			var len_chk = $('<span style="color:red;">X </span>');
			var n = $('<span>숫자 포함 </span>');
			var n_chk = $('<span style="color:red;">X </span>');
			var l = $('<span>문자 포함 </span>');
			var l_chk = $('<span style="color:red;">X </span>');
			var sl = $('<span>특수문자 포함 </span>');
			var sl_chk = $('<span style="color:red;">X </span>');
			resultText.text('');
			resultText.append(len);
			resultText.append(len_chk);
			resultText.append(n);
			resultText.append(n_chk);
			resultText.append(l);
			resultText.append(l_chk);
			resultText.append(sl);
			resultText.append(sl_chk);
			if (user_password.length >= 8) {
				len_chk.text('✓  ');
				len_chk.css("color", "deepskyblue");
			}
			if (regPW_n.test(user_password)) {
				n_chk.text('✓  ');
				n_chk.css("color", "deepskyblue");
			}
			if (regPW_l.test(user_password)) {
				l_chk.text('✓  ');
				l_chk.css("color", "deepskyblue");
			}
			if (regPW_sl.test(user_password)) {
				sl_chk.text('✓  ');
				sl_chk.css("color", "deepskyblue");
			}
		});

$('#user_password').on(
		'blur',
		function() {
			var user_password = $('#user_password').val();
			var result = $('#user_password').parent().parent().next()
					.children().first().children();
			var resultText = result.parent().next().children();
			resultText.text('');
			const reg_password = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,24}$/;
			if (user_password == '') {
				result.text('null');
				resultText.text('비밀번호를 입력해주세요');
				resultText.css('color', 'deeppink');
			} else if (!reg_password.test(user_password)) {
				result.text('invalid');
				resultText.text('비밀번호 형식이 올바르지 않습니다');
				resultText.css('color', 'deeppink');
			} else {
				result.text('ok');
				resultText.text('사용 가능한 비밀번호입니다.');
				resultText.css('color', 'deepskyblue');
			}
		});

$('#user_password_re').on(
'blur',
function() {
	var user_password = $('#user_password').val();
	var user_password_re = $('#user_password_re').val();
	var result = $('#user_password_re').parent().parent().next()
			.children().first().children();
	var resultText = result.parent().next().children();
	resultText.text('');
	if (user_password_re == '') {
		result.text('null');
		resultText.text('비밀번호를 확인해주세요');
		resultText.css('color', 'deeppink');
	} else if (user_password != user_password_re) {
		result.text('invalid');
		resultText.text('비밀번호가 일치하지 않습니다');
		resultText.css('color', 'deeppink');
	} else if (user_password == user_password_re) {
		result.text('ok');
		resultText.text('비밀번호가 확인되었습니다');
		resultText.css('color', 'deepskyblue');
	}
});

// 비밀번호 확인을 세기 위한 변수
let cnt = 0;

//수정하기 버튼 활성화를 감지하기 위한 변수
let isModify =false;

//로그인한 유저의 기본 정보를 보존하기 위한 변수
let org_nick = document.getElementById('user_nickname').value;
let org_phone = document.getElementById('user_phone').value;
let org_zipCode = document.getElementById('zip_code').value;
let org_address = document.getElementById('address_default').value;
let org_addressDetail = document.getElementById('address_detail').value;
let org_addressExtra = document.getElementById('address_extra').value;

//닉네임
function ckNick() {
	var user_nickname = $('#user_nickname').val();
	var result = $('#user_nickname').parent().parent().next()
			.children().first().children();
	var resultText = result.parent().next().children();
	resultText.text('');
	const reg_nickname = /^[가-힣a-zA-Z0-9]{2,10}$/;
	if (user_nickname == '') {
		result.text('null');
		resultText.text('닉네임을 입력해주세요');
		resultText.css('color', 'deeppink');
	} else if (!reg_nickname.test(user_nickname)) {
		result.text('invalid');
		resultText.text('닉네임 형식이 올바르지 않습니다');
		resultText.css('color', 'deeppink');
	} else if(user_nickname == org_nick){
		result.text('ok');
		resultText.text('전과 동일한 닉네임입니다');
		resultText.css('color', 'deepskyblue');
	} else {
		$.ajax({
			url : cp + "/user/check_nickname.us",
			data : {
				"user_nickname" : user_nickname
			},
			type : "get",
			dataType : "text",
			success : function(data) {
				if (data == 'O') {
					result.text('ok');
					resultText.text('멋진 닉네임이네요!');
					resultText.css('color', 'deepskyblue');
				} else {
					result.text('duplication');
					resultText.text('중복된 닉네임입니다.');
					resultText.css('color', 'deeppink');
					}
				}
			});
		}
	}

//핸드폰
function ckPhone() {
			var user_phone = $('#user_phone').val();
			var result = $('#user_phone').parent().parent().next().children()
					.first().children();
			var resultText = result.parent().next().children();
			resultText.text('');
			const reg_phone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (user_phone == '') {
				result.text('null');
				resultText.text('휴대전화번호를 입력해주세요');
				resultText.css('color', 'deeppink');
			} else if (!reg_phone.test(user_phone)) {
				result.text('invalid');
				resultText.text('휴대전화번호 형식이 올바르지 않습니다');
				resultText.css('color', 'deeppink');
			} else {
				result.text('ok');
				resultText.text('✔');
				resultText.css('color', 'deepskyblue');
			}
		}

//주소
function ckAddress() {
			var address_detail = $('#address_detail').val();
			var result = $('#address_detail').parent().parent().next()
					.children().first().children();
			var resultText = result.parent().next().children();
			resultText.text('');
			if (address_detail == '') {
				result.text('null');
				resultText.text('상세 주소를 입력해주세요');
				resultText.css('color', 'deeppink');
			} else {
				result.text('ok');
				resultText.text('✔');
				resultText.css('color', 'deepskyblue');
			}
		}

//다음 주소 API
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
			document.getElementById("address_default").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("address_detail").focus();
		}
	}).open();
}

//마이페이지 회원정보 수정 - 유효성체크
function pwSubmitValidCheck() {
	var flag = true;
	$('.status').each(
			function(index, item) {
				if ($(this).text() == 'null') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				} else if ($(this).text() == 'invalid') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				} else if ($(this).text() == 'duplication') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				}
			});
	return flag;
}

//마이페이지 회원정보 수정 - 유효성체크
function submitValidCheck() {
	var flag = true;
	$('.status').each(
			function(index, item) {
				if ($(this).text() == 'null') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				} else if ($(this).text() == 'invalid') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				} else if ($(this).text() == 'duplication') {
					$(this).closest('tr').prev().children().last()
							.children().focus();
					flag = false;
					return flag;
				}
			});
	return flag;
}


$( document ).ready(function() {
	console.log( "ready!" );
//	console.log(document.getElementById('user_nickname').value);
	
    
    // 페이지 분기 처리
    const curPathName = window.location.pathname.replace(".us","").replace(".jsp","");
    console.log(curPathName);
    
    // 페이지 분기 처리 로직
    switch(curPathName){
	    case "/dogather/user/pwCheck_ok", "/dogather/user/info":
	    	console.log('내정보 수정 페이지');
//	    	let isModify =false;
	    	
	    	// 수정 버튼 클릭
	    	$('#modify').on(
	    			'click',function(){
	    		$('#modify').hide();
	    		$('#modifyOk').show();
	    		$('#cancel').show();
	    		$('#user_nickname').attr('readonly',false);
	    		$('#user_phone').attr('readonly',false);
	    		$('#address_detail').attr('readonly',false);
	    		isModify = true;
	    	});
	    	
	    	//취소버튼 클릭
	    	$('#cancel').on(
	    			'click',function(){
	    		$('#modify').show();
	    		$('#modifyOk').hide();
	    		$('#cancel').hide();
	    		
	    		//기존값으로 초기화
	    		$('#user_nickname').val(org_nick);
	    		$('#user_phone').val(org_phone);
	    		$('#zip_code').val(org_zipCode);
	    		$('#address_default').val(org_address);
	    		$('#address_detail').val(org_addressDetail);
	    		
	    		$('#user_nickname').attr('readonly',true);
	    		$('#user_phone').attr('readonly',true);
	    		$('#zip_code').attr('readonly',true);
	    		$('#address').attr('readonly',true);
	    		$('#address_detail').attr('readonly',true);
	    		$('span').text('');
	    		isModify = false;
	    	});
	        
	    	// 주소 이벤트
	        $('#address_default').on('click',function(){
	        	console.log('클릭');
	        	if(isModify){
	        		daumPostcode();	
	        	}
	        });
	        $('#zip_code').on('click',function(){
	        	console.log('클릭');
	        	if(isModify){
	        		daumPostcode();	
	        	}
	        });
	        
	        //유효성 검사 로직
	        $('#user_nickname').on('blur', function(){
	        	console.log('userNickname');
	        	if(isModify){
	        		ckNick();
	        	}
	        });
	        
	        $('#user_phone').on('blur',function() {
	        	console.log('userPhone');
	        	if(isModify){
	        		ckPhone();
	        	}
	        });
	        
	        $('#address_detail').on('blur',function() {
	        	console.log('userAddress');
	        	if(isModify){
	        		ckAddress();
	        	}
	        });

	    	break;
	    	
//	    case "/dogather/user/pw.us":
//	    	console.log('패스워드 변경 페이지');
//
//	    	break;
		default:
			break;
    }
});