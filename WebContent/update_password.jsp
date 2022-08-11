<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<h2>비밀번호 변경</h2>
<form name="update_password_Form" method="post" action="${cp}/user/user_password_update.us" onsubmit="return handin()">
<table>
	<tr>
		<th>현재 비밀번호</th>
			<td>
				<input type="password" name="user_password" id="user_password" maxlength="24">
			</td>
		<th>새 비밀번호</th>
			<td>
				<input type="password" name="user_new_password" id="user_new_password" maxlength="24">
			</td>
	</tr>
	
</table>
<input type="submit" value="비밀번호 변경"> 
</form>
</body>
<script>
function handin(){
	var user_password = $('#user_password');
	var user_new_password = $('#user_new_password');
	var flag = false;
		$.ajax({ // 비밀번호 일치 검사
			url : '${cp}/user/user_password_check.us',
			type : 'post',
			data : {"user_password":user_password.val()},
		    success:function(data){
		    	 if(data== "O") {
		    		flag = true;
		    	} else {
		    		flag = false;
		    	} 
		    }
				
		});
		
		
		 return flag;
}
</script>


</html>