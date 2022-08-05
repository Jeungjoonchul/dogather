function contextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf(
			'/', hostIndex + 1));
	return contextPath;
}
const cp = contextPath();

$('#login').submit(function(event) {
	event.preventDefault();
	var isSubmit = false;
	$.ajax({
		url : cp + '/user/user_login_check.us',
		type : 'post',
		data : $('#login').serialize(),
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
		$('#login_status').text('이메일 또는 비밀번호를 잘못 입력하였습니다');
		$('#login_status').css('color', 'deeppink');
	}
});
