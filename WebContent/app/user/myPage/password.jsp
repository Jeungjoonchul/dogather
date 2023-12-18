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
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
	<script src="${cp}/resources/js/cp.js"></script>
    <link rel="shortcut icon" href="./img/favicon.png" />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/myPage.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<style>

#mypage {
  width: 80%;
  margin-top: 160px;
}
#mypage_container {
  box-sizing: border-box;
  width: 1202px;
  height: 800px;
  margin: 0 auto;
  margin-bottom: 50px;
}

</style>
<body>
<c:if test="${empty myInfor}">
    <script>
            location.replace("${cp}/user/myPage.us");
    </script>
</c:if>
		<c:if test="${loginUser == null }">
			<script>
				let cp = "${pageContext.request.contextPath}";
				alert("로그인 후 이용하세요!");
				location.replace("${cp}/user/login.us");
			</script>
		</c:if>
		<c:if test="${myInfor == null }">
			<script>
				let cp = "${pageContext.request.contextPath}";
				location.replace("{cp}/user/myPage.us");
			</script>
		</c:if>
	<%@include file="../../../header.jsp"%>
<div id="mypage">
	<div id="mypage_container">
		<%@include file="../../../myPage_sideBar.jsp" %> 
		<div id="mypage_area">
        	<div id="top_meun">
                <table>
                  <tr>
                    <th id="changeprofile" >
                      <a href="${cp}/app/user/porfile.jsp"> 내프로필 </a>
                    </th>
                    <th id="changepw" class="on">
                      <a href="${cp}/user/pw.us"> 비밀번호변경 </a>
                    </th>
                    <th id="changeinfo" class="off">
                      <a href="${cp}/user/info.us"> 기본정보변경 </a>
                    </th>
                  </tr>
                </table>
              </div>
                <!--비밀번호 변경 -->
                <div id="changpw_area">
                  <h2>비밀번호 변경</h2>
                  <div id="pw_area">
                        <form action="${cp}/user/modifyPw_ok.us" onsubmit="return pwSubmitValidCheck()">
                    <table>
                       <tr>
                       <input type="hidden" name="user_email" id="user_email" value="${loginUser.user_email}">
                        <td>변경할 비밀번호</td>
                        <td><input type="password" name="user_password"
							id="user_password" placeholder='새로운 비밀번호를 입력해주세요' maxlength="24"></td>
                    </tr>
                    <tr>
						<th><span style="display: none;" class="status">null</span></th>
						<td><span>&nbsp;</span></td>
					</tr>
                      <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" name="user_password_re"
							id="user_password_re" placeholder='비밀번호 확인' maxlength="24"></td>
                    </tr>
                    <tr>
						<th><span style="display: none;" class="status">null</span></th>
						<td><span>&nbsp;</span></td>
					</tr>
						
                </table>
                <div id="pw_notice">
                  <p>주의사항</p>
                  <ul>
                    <li>
                      비밀번호는 8~16 자의 영문 대소문자,숫자,특수문자를 조합하여 설정해주세요.
                    </li>
                    <li> 다른사이트에서 사용하는 것과 동일하거나 쉬운 비밀번호는 사용하지 마세요.</li>
                    <li>안전한 계정 사용을 위해 비밀번호는 주기적으로 변경해주세요.</li>
                  </ul>
                </div>
                  <div id="pw_button">
					<input type="submit" value="변경하기" id="modifyPw"/>
                </div>
        </form>
            </div>
        </div>
    	</div>
	</div>
</div>
	<%@include file="../../../footer.jsp"%>
<script src="${cp }/resources/js/myPage.js"></script>
</body>
<script>
const info = '/dogather/app/user/mypage/info.jsp';
if("<%= request.getRequestURI() %>"==info){
	document.querySelector("#info").className = "on";
}
</script>
</html>