function sendit(){
	const joinForm = document.joinForm;
	
	const user_email = joinForm.user_email;
	if(user_email.value == ""){
		alert("아이디를 입력하세요!")
		user_email.focus();
		return false;
	}
}