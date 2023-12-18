<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${cp}/resources/js/cp.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/"/>
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Doːgather</title>
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<style>
  	main *{
  		box-sizing: border-box;
  	}
  	
	#head {
	    width: 66%;
	    margin:0 auto;
	    margin-top: 66px;
	    height: 200px;
	    text-align: center;
 	}
 	
 	#main{
	 	width: 80%;
	 	padding-top:50px;
	 	margin:0 auto;
	 	min-height: 600px;
	 	padding-bottom:100px;
 	}
 	
 	#cont{
	 	width: 800px;
	 	margin:0 auto;
		text-align:center;
	 	background-color: #ffffff;
	 	box-shadow: 3px 3px 3px 3px grey;
	 	height: 700px;
	 	display: flex;
	 	justify-content: center;
	 	align-items: center;
	}
	
	#wrapper{
		width: 400px;
		height:400px;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;
		align-items: center;
	}

	#btns a{
	 	text-decoration: none;
	 	padding:10px 20px;
	 	border-radius: 5px;
	 	background-color: #621ae5;
	 	color:white;
	 	cursor: pointer;
	 	margin-right: 5px;
	}
	
	#btns a:hover{
 		background-color: #777777;
 	}
	#cert_code_submit{
	 	padding:4px 5px;
	 	margin-left: 10px;
	 	border: none;
	 	outline:none;
	 	border-radius: 5px;
	 	background-color: #621ae5;
	 	color:white;
	 	cursor: pointer;
 	}
 	
	#cert_code_submit:hover{
 		background-color: #444444;
	}
	
	form{
	 	display: flex;
	 	justify-content: center;
	 	align-items:center;
	 	text-align: left;
 	}
</style>
<body>
	<main>
		<div id="head">
        	<div>
          		<p class="center" style="margin: 0 auto;">
            		<a href="${cp }/main">
             			<img src="${cp}/resources/images/dogather_logo.png" alt="" width="350px"/>
           		 	</a>
          		</p>
        	</div>
		</div>
		<div id="main">
			<div id="cont">
				<div id="wrapper">
					<c:choose>
						<c:when test="${code != null }">
							<form action="${cp }/user/password_reset.us" id="password_reset" method="post">
								<input type="hidden" value="${user_index }" id="user_index" name="user_index"/>
								<input type="hidden" value="${user_email }" id="user_email" name="user_email"/>
								<table>
									<thead>
										<tr>
											<th>
												인증 번호 :
											</th>
											<td>
												<input type="text" id="cert_code" maxlength="6"/><input type="button" id="cert_code_submit" value="확인"/>
											</td>
										</tr>
									</thead>
									<tbody style="display: none;">
										<tr>
											<th>
												새로운 비밀 번호 :
											</th>
											<td>
												<input type="password" id="user_password" name="user_password" maxlength="24">
											</td>
										</tr>
										<tr>
											<th>
												비밀번호 확인 :
											</th>
											<td>
												<input type="password" id="user_password_re" name="user_password_re" maxlength="24">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="button" value="비밀번호 설정하기" id="set_password">
											</td>
										</tr>
									</tbody>								
								</table>
							</form>
						</c:when>
						<c:otherwise>
							<div>회원 정보를 찾을 수 없습니다</div>
							<div id="btns"><a href="${cp }/user/find_email.us">이메일 찾기</a><a href="${cp }/user/find_password.us">비밀번호 찾기</a><a href="${cp }/user/login.us">로그인 하기</a></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</main>
    <%@include file="/footer.jsp" %>
</body>
<script>
	$('#cert_code_submit').on('click',function(){
		checkCert();
	});

 	$('#cert_code').on('keyup',function(e){
		if(e.keyCode===13){
			checkCert();
		}
	});
	
	var checkCert=function check(){
		if($('#cert_code').val()=='${code}'){
			$('thead').hide();
			$('tbody').show('fast');
		}else{
			alert('인증 번호가 올바르지 않습니다');
		}
	}
	
	$('#set_password').on('click',function(){
		sendit();
	});

 	$('#user_password_re,#user_password').on('keyup',function(e){
		if(e.keyCode===13){
			sendit();
		}
	});
 	
	var sendit=function(){
		var user_password=$('#user_password').val();
		var user_password_re=$('#user_password_re').val();
		const reg_password = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,24}$/;
		if(user_password==''){
			alert('새로운 비밀번호를 입력하세요');
			$('#user_password').focus();
			return false;
		}
		if(!reg_password.test(user_password)){
			alert('비밀번호는 영문자 및 숫자, 특수문자를 포함하여 8자리 이상 설정해주세요');
			$('#user_password').focus();
			return false;
		}
		if(user_password_re==''){
			alert('비밀번호 확인을 입력하세요');
			$('#user_password_re').focus();
			return false;
		}
		if(user_password_re!=user_password){
			alert('비밀번호가 일치하지 않습니다');
			$('#user_password_re').focus();
			return false;
		}
		$('#password_reset').submit();
	}
</script>
</html>