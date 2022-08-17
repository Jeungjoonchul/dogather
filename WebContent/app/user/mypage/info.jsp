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
    <link rel="shortcut icon" href="./img/favicon.png" />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/mypage.css" />
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
	<%@include file="../../../header.jsp"%>
<div id="mypage">
	<div id="mypage_container">
		<%@include file="../../../myPage_sideBar.jsp" %> 
		<div id="mypage_area">
        	<div id="top_meun">
                <table>
                  <tr>
                    <th id="changeprofile">
                      <a href="${cp}/app/user/porfile.jsp"> 내프로필 </a>
                    </th>
                    <th id="changepw">
                      <a href="${cp}/app/user/password.jsp"> 비밀번호변경 </a>
                    </th>
                    <th id="changeinfo" class="on">
                      <a href="${cp}/app/user/info.jsp"> 기본정보변경 </a>
                    </th>
                  </tr>
                </table>
              </div>

              <!-- 기본정보 변경 -->
              <div id="changeinfo_area">
                <form action="">
                  <div>
                    <h2>기본정보 변경</h2>
                  </div>
                  <table>
                    <tr>
                      <th>이메일</th>
                      <td>
                        <input
                          type="text"
                          name="user_email"
                          id="user_email"
                          value="user_email"
                          readonly
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>이름</th>
                      <td>
                        <input
                          type="text"
                          name="user_name"
                          id="user_name"
                          value="user_name"
                          readonly
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>생년월일</th>
                      <td>
                        <input
                          type="text"
                          name="user_birth_date"
                          id="user_birth_date"
                          value="user_birth_date"
                          readonly
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>성별</th>
                      <td>
                        <label
                          ><input
                            type="radio"
                            name="user_gender"
                            class="user_gender"
                            value="male"
                            checked
                            onclick="return false"
                          />남자</label
                        >
                        <label
                          ><input
                            type="radio"
                            name="user_gender"
                            class="user_gender"
                            value="female"
                            onclick="return false"
                          />여자</label
                        >
                      </td>
                    </tr>
                    <tr>
                      <th>닉네임</th>
                      <td>
                        <input
                          type="text"
                          name="user_nickname"
                          id="user_nickname"
                          value="user_nickname"
                          maxlength="10"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>휴대폰 번호</th>
                      <td>
                        <input
                          type="tel"
                          name="user_phone"
                          id="user_phone"
                          value="user_phone"
                          maxlength="13"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>우편번호</th>
                      <td>
                        <input
                          type="text"
                          name="zip_code"
                          id="zip_code"
                          readonly
                          onclick="daumPostcode()"
                          value="zipCode"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>주소</th>
                      <td>
                        <input
                          type="text"
                          name="address"
                          id="address"
                          readonly
                          onclick="daumPostcode()"
                          value="address"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>상세주소</th>
                      <td>
                        <input
                          type="text"
                          name="address_detail"
                          id="address_detail"
                          maxlength="300"
                          value="address_detail"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th>
                        <span style="display: none" class="status">null</span>
                      </th>
                      <td><span>&nbsp;</span></td>
                    </tr>
                  </table>
                  <br />
                  <input type="submit" value="변경완료" />
                  <input type="button" value="나가기" onclick="back()" />
                </form>
              </div>
    	</div>
	</div>
</div>
	<%@include file="../../../footer.jsp"%>
</body>
<script>
const info = '/dogather/app/user/mypage/info.jsp';
if("<%= request.getRequestURI() %>"==info){
	document.querySelector("#info").className = "on";
	
	
}
</script>
</html>