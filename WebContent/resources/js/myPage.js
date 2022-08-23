let cnt = 0;
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
			alert("5회 이상 틀리셨습니다. 로그아웃됩니다.");
			$.ajax({
				url : cp + '/user/logout.us'
			});
		}
	}
});

$('#user_nickname').on(
		'blur',
		function() {
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
		});

$('#user_phone').on(
		'blur',
		function() {
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
		});

$('#address_detail').on(
		'blur',
		function() {
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
		});

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

//infor

function modify(){
	$('#modify').hide();
	$('#modifyOk').show();
	$('#cancel').show();
	$('#user_nickname').attr('readonly',false);
	$('#user_phone').attr('readonly',false);
	$('#zip_code').attr('readonly',false);
	$('#address').attr('readonly',false);
	$('#address_detail').attr('readonly',false);
	$('#zip_code').on('onclick',daumPostcode());
	$('#address').on('onclick',daumPostcode());
	
	
}

function modify(){
	$('#modify').show();
	$('#modifyOk').hide();
	$('#cancel').hide();

// 기존값 어캐넘기지
//	$('#user_nickname').val(org_nick);
//	$('#user_phone').val(org_phone);
//	$('#zip_code').val(org_zipCode);
//	$('#address').val(org_address);
//	$('#address_detail').val(org_addressDetail);
	
	
	$('#user_nickname').attr('readonly',true);
	$('#user_phone').attr('readonly',true);
	$('#zip_code').attr('readonly',true);
	$('#address').attr('readonly',true);
	$('#address_detail').attr('readonly',true);
	
}