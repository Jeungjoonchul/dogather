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
            #main table td{
    text-align: center;
}
#main h2{
    font-size:36px;
    width: 850px;
    margin: 20px auto;
    text-align: center;
}

#dp_contents {
    width: 539px;
    height: 206px;
    resize: none;
}

#counter {
    display: block;
    color: #aaa;
    width: 120px;
    margin-left: 65%;
}

#cert_images {
    display: flex;
    justify-content: flex-start;
}
#main table tr td textarea{
width: 500px;
height:200px;
background-color: #eee;
border-radius: 1px;
 border: none;
 overflow:auto;
}
#main table {
    border: 1px solid #eee;
    margin: 0 auto;
    width :850px;

}
#main table tfoot tr td{
 text-align: center;
}
#main table tfoot input[type="submit"]{
    padding: 10px 20px;
    border: none;
    color: #ffffff;
    border-radius: 3px;
    margin:10px;
    cursor: pointer;
      background-color: #621ae5;
}
#main table tfoot input[type="submit"]:hover{
background-color: #8757de;
}
#main table input[type="date"]{
 width: 200px;
 padding:5px;
 margin:10px 0;
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
						<td colspan="2"><h2><span class="purple">두게더</span><span> 가입하기</span></h2></td>
					</tr>
				</thead>
				<tbody>


                    <tr><td><h4>목표</h4><textarea spellcheck="false" name="dg_user_target" id="dg_user_target" maxlength="300"></textarea><span id="counter">(0 / 최대 300자)</span></td></tr>
                    <tr><td><h4>달성 날짜</h4><input type="date" name="dg_user_target_date" id="dg_user_target_date"/></td></tr>

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