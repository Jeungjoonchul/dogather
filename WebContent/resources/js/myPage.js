$('#pwCheck').submit(function(event) {
	event.preventDefault();
	var isSubmit = false;
	let cnt = 0;
	$.ajax({
		url : cp + '/user/pwCheck.us',
		type : 'post',
		data : $('#pwCheck').serialize(),
		dataType : 'text',
		async : false,
		success : function(data) {

			if (data == 'O') {
				isSubmit = true;
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