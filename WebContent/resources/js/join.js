function contextPath(){
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
	return contextPath;
}
const cp = contextPath();

$('#user_email').on('blur',function(){
	var user_email=$('#user_email').val();
	var result = $('#user_email').parent().parent().next().children().first().children();
	var resultText=result.parent().next().children();
	resultText.text('');
	const reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if (user_email == '') {
		result.text('null');
		resultText.text('이메일을 입력해주세요');
		resultText.css('color', 'deeppink');
	}else if(!reg_email.test(user_email)){
		result.text('invalid');
		resultText.text('이메일 형식이 올바르지 않습니다');
		resultText.css('color', 'deeppink');
	}else{
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
					resultText.text('사용 가능한 이메일입니다');
					resultText.css('color', 'deepskyblue');
				} else {
					result.text('duplication');
					resultText.text('중복된 이메일입니다');
					resultText.css('color', 'deeppink');
				}
			}
		});
	}
});

$('#user_nickname').on('blur',function(){
	var user_nickname=$('#user_nickname').val();
	var result = $('#user_nickname').parent().parent().next().children().first().children();
	var resultText=result.parent().next().children();
	resultText.text('');
	const reg_nickname = /^[가-힣a-zA-Z0-9]{2,10}$/;
	if (user_nickname == '') {
		result.text('null');
		resultText.text('닉네임을 입력해주세요');
		resultText.css('color', 'deeppink');
	}else if(!reg_nickname.test(user_nickname)){
		result.text('invalid');
		resultText.text('닉네임 형식이 올바르지 않습니다');
		resultText.css('color', 'deeppink');
	}else{
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

$('#user_password').on('keyup',function(){
	var user_password = $('#user_password').val();
	var resultText = $('#user_password').parent().parent().next().children()
			.last().children();
	resultText.css("color","black");
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

$('#user_password').on('blur',function(){
	var user_password=$('#user_password').val();
	var result=$('#user_password').parent().parent().next().children().first().children();
	var resultText=result.parent().next().children();
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

$('#user_password_re').on('blur',function(){
	var user_password = $('#user_password').val();
	var user_password_re=$('#user_password_re').val();
	var result = $('#user_password_re').parent().parent().next().children().first().children();
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


$('#user_name').on('blur',function(){
	var user_name=$('#user_name').val();
	var result = $('#user_name').parent().parent().next().children().first().children();
	var resultText = result.parent().next().children();
	resultText.text('');
	const reg_name = /^[가-힣]{2,17}$/;
	if (user_name == '') {
		result.text('null');
		resultText.text('이름을 입력해주세요');
		resultText.css('color',"deeppink");
	} else if (!reg_name.test(user_name)) {
		result.text('invalid');
		resultText.text('이름 형식이 올바르지 않습니다');
		resultText.css('color',"deeppink");
	} else {
		result.text('ok');
		resultText.text('멋진 이름이네요!');
		resultText.css('color', 'deepskyblue');
	}
});

$('#user_phone').on('keyup',function(){
	var number=$('#user_phone').val().replace(/[^0-9]/g,"");
	var phone="";
	if (number.length < 4) {
		return number;
	} else if (number.length < 7) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3);
	} else if (number.length < 11) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 3);
		phone += "-";
		phone += number.substr(6);
	} else {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 4);
		phone += "-";
		phone += number.substr(7);
	}
	$('#user_phone').val(phone);
});

$('#user_phone').on('blur',function(){
	var user_phone=$('#user_phone').val();
	var result = $('#user_phone').parent().parent().next().children().first().children();
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

$('#user_birth_date').on('keyup',function(){
	var number=$('#user_birth_date').val().replace(/[^0-9]/g, "");
	var date = "";

	if (number.length < 5) {
		return number;
	} else if (number.length < 7) {
		date += number.substr(0, 4);
		date += "-";
		date += number.substr(4);
	} else {
		date += number.substr(0, 4);
		date += "-";
		date += number.substr(4, 2);
		date += "-";
		date += number.substr(6);
	}
	
	$('#user_birth_date').val(date);
});

$('#user_birth_date').on('blur',function(){
	var user_birth_date=$('#user_birth_date').val();
	var result = $('#user_birth_date').parent().parent().next().children().first().children();
	var resultText = result.parent().next().children();
	resultText.text('');
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var now = year + '-' + month  + '-' + day;
	const reg_birth_date = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	if (user_birth_date == '') {
		result.text('null');
		resultText.text('생년월일을 입력해주세요');
		resultText.css('color', 'deeppink');
	} else if (!reg_birth_date.test(user_birth_date)||user_birth_date>now) {
		result.text('invalid');
		resultText.text('생년월일 형식이 올바르지 않습니다');
		resultText.css('color', 'deeppink');
	} else {
		result.text('ok');
		resultText.text('✔');
		resultText.css('color', 'deepskyblue');
	}
});

$('#address_detail').on('blur',function(){
	var address_detail=$('#address_detail').val();
	var result = $('#address_detail').parent().parent().next().children().first().children();
	var resultText = result.parent().next().children();
	resultText.text('');
	if (address_detail == '') {
		result.text('null');
		resultText.text('상세 주소를 입력해주세요');
		resultText.css('color', 'deeppink');
	}else {
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
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("address_detail").focus();
		}
	}).open();
}
function sendit(){
	var flag=true;
	$('.status').each(function (index, item) {
     	if($(this).text()=='null'){
     		$(this).parent().parent().prev().children().last().children().focus();
     		$(this).parent().parent().prev().children().last().children().blur();
     		$(this).parent().parent().prev().children().last().children().focus();
     		flag=false;
     		return flag;
     	}else if($(this).text()=='invalid'){
     		$(this).parent().parent().prev().children().last().children().focus();
     		flag=false;
     		return flag;
     	}else if($(this).text()=='duplication'){
     		$(this).parent().parent().prev().children().last().children().focus();
     		flag=false;
     		return flag;
     	}
     });
	return flag;
}


//페이지 넘기기
const btn1 = document.getElementById('join1');
const btn2 = document.getElementById('join2');
const btn3 = document.getElementById('join3');
const joinForm = document.joinForm;
const injeong1 = joinForm.user_terms_type1;
const injeong2 = joinForm.user_terms_type2;
  
  function next(){
    if(btn1.style.display='block'){
      btn1.style.display ='none'
      btn2.style.display ='block'
      document.getElementById('join_step1').style.color ="#141414";
      document.getElementById('join_step2').style.color ="blue";
    }
  }
    function next1(){
      if(injeong1.checked & injeong2.checked){
        if(btn2.style.display = 'block'){
              btn2.style.display = 'none';
              btn3.style.display = 'block';
              document.getElementById('join_step2').style.color ="#141414";
              document.getElementById('join_step3').style.color ="blue";
      
        }  
      }else{
        alert("약관에 동의해주세요");
      }
      
    }
    function back(){
        if(confirm("작성을 취소하시겠습니까?")){
        if(btn3.style.display = 'block'){
            btn3.style.display = 'none';
            btn1.style.display = 'block';
            document.getElementById('join_step3').style.color ="#141414";
            document.getElementById('join_step1').style.color ="blue";
        }
    }
    }
    function back1(){
        
        if(btn2.style.display = 'block'){
            btn2.style.display = 'none';
            btn1.style.display = 'block';
            document.getElementById('join_step2').style.color ="#141414";
            document.getElementById('join_step1').style.color ="blue";
        }
    }