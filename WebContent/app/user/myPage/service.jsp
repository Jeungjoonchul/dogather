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
        	<form action="">
                <div id="myservice_area">
                  <div id="service">
                    <h2>문의 내역</h2>
                    <table>
                      <tr>
                       <th><input type="checkbox" name="qna" id="qna"
                          value="selectall"
                          onclick="selectAll_qna(this)"/></th>
                      <th>상태</th>
                      <th>제목</th>
                        <th>날짜</th>
                    </tr>
                    <tr>
                    <td><input type="checkbox" name="qna" value=""> </td>
                      <td>처리중</td>
                      <td>처리해주세요</td>
                      <td>2222.22.22</td>
                    </tr>
                    </table>
                  </div>
                  </div>
                </form>
              </div>
              
    	</div>
	</div>

	<%@include file="../../../footer.jsp"%>
</body>
<script>
const service = '/dogather/app/user/mypage/service.jsp';
if("<%= request.getRequestURI() %>"==service){
	document.querySelector("#service").className = "on";
	
	
}
function selectAll_qna(selectAll) {
	  const qna = document.getElementsByName("qna");

	  qna.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  });
	}
</script>
</html>