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
  main *{box-sizing: border-box;}
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
 input{
 	width: 200px;
 }
  #find_password_btn{
 	text-decoration: none;
 	padding:10px 60px;
 	border-radius: 5px;
 	background-color: #621ae5;
 	color:white;
 	cursor: pointer;
 }
 #find_password_btn:hover{
 	background-color: #777777;
 }
</style>
<body>

	<main>
	<div id="head">
        <div>
          <p class="center" style="margin: 0 auto;">
            <a href="${cp }/main">
              <img src="${cp}/resources/images/dogather_logo.png" alt="" width="350px" />
            </a>
          </p>
        </div>
      </div>
		<div id="main">
			<div id="cont">
				<div id="wrapper">
					<div>
						<h2><span class="purple">비밀번호</span><span> 찾기</span></h2>
					</div>
					<form id="find_password_form" action="${cp }/user/find_password_cert.us" method="post">
						<table>
							<thead>
								<tr>
									<td colspan="2">
										
									</td>
								</tr>
							<tbody>
								<tr>
									<th>이메일</th>
									<td><input type="text" id="user_email" name="user_email"></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" id="user_name" name="user_name"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" id="user_phone" name="user_phone"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div><a id="find_password_btn">비밀번호 찾기</a></div>
				</div>
			</div>
		</div>
	</main>
    <%@include file="/footer.jsp" %>
</body>
<script>
$('#find_password_btn').on('click',function(){
	if($('#user_email').val()==''){
		alert('이메일을 입력하세요');
		$('#user_email').focus();
		return false;
	}
	if($('#user_name').val()==''){
		alert('이름을 입력하세요');
		$('#user_name').focus();
		return false;
	}
	if($('#user_phone').val()==''){
		alert('전화번호를 입력하세요');
		$('#user_phone').focus();
		return false;
	}
	$('#find_password_form').submit();
});
</script>
</html>