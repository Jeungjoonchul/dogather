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
  .purple {
  color: #621ae5;
}
	main{
		width: 100%;
		min-height:600px;
	}
	main *{
		box-sizing: border-box;
	}
	#main{
		width: 80%;
		margin: 0 auto;
	}
	#dg_user_target{
		width: 500px;
		height: 200px;
		resize: none;
	}
				#counter{
			display: block;
			color:#aaa;
			}
</style>
<body>
 	<!-- 로그인 후 이용해야할 때 사용 -->
	<%@include file="/loginCheck.jsp" %>
	<%@include file="/header.jsp" %>
	<main>
		<div id="main">
		<form method=post name="join_dg" action="${cp }/dg/join_ok.dg">
			<table>
				<thead>
					<tr>
						<td colspan="2"><h2><span class="purple">두개더</span><span> 가입하기</span></h2></td>
					</tr>
				</thead>
				<tbody>

				
					<tr><th>두개더 목표</th><td><textarea spellcheck="false" name="dg_user_target" id="dg_user_target" maxlength="300"></textarea><span id="counter">(0 / 최대 300자)</span></td></tr>
					<tr><th>목표 달성 날짜</th><td><input type="date" name="dg_user_target_date" id="dg_user_target_date"/></td></tr>
					
					<tr style="display: none;"><td colspan="2">
					<input type="hidden" name="dg_index" value="${dg_index }"/>
					<input type="hidden" name="dg_user_join_record" value="${dg_user_join_record }"/>
					</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2"><input type="submit"/></td></tr>
				</tfoot>
			</table>
		</form>
		</div>
	</main>
    <%@include file="/footer.jsp" %>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>