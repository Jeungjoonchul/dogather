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
                    <th id="myboard" class="on">
                      <a href="${cp}/app/user/mypage/community.jsp">
                        내 게시글
                      </a>
                    </th>
                    <th id="friendslist" class="off">
<a href="${cp}/app/user/mypage/friends.jsp"> 친구목록
</a>
                    </th>
                    <th id="notebox" class="off">
                      <a href="${cp}/app/user/mypage/notebox.jsp">쪽지함
                      </a> 
                    </th>
                  </tr>
                </table>
              </div>
              <!-- 내 게시글 -->
              <div id="myboard_area">
                <form action="">
                  <div id="board_list">
                    <h2>게시글 목록</h2>
                    <table class="list">
                      <tr>
                        <th class="num">번호</th>
                        <th class="tit">제목</th>
                        <th class="com">댓글</th>
                        <th class="date">작성일</th>
                        <th class="rew">조회수</th>
                        <th class="like">좋아요</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href="">제목dddddddddddddddddddddd</a></td>
                        <td>1</td>
                        <td>18:18:18
                        </td>
                        <td>100</td>
                        <td>100</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href="">제목</a></td>
                        <td>1</td>
                        <td>22-22-22
                        </td>
                        <td>100</td>
                        <td>100</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href="">제목</a></td>
                        <td>1</td>
                        <td>22-02-22
                        </td>
                        <td>100</td>
                        <td>100</td>
                      </tr>
                    </table>
                  </div>
                  <div id="comment_list">
                    <h2>내 댓글 목록</h2>
                    <table>
                      <tr>
                        <th class="num">번호</th>
                        <th class="tit">글 제목</th>
                        <th class="com">댓글 내용</th>
                        <th class="date">댓글 작성일</th>
                        <th class="like">좋아요</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href="">어쩌고저쩌고 </a>
                        </td>
                        <td>
                         <a href=""> ㅇㅇ</a>
                        </td>
                        <td>22-22-22</td>
                        <td>10</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href=""> 어쩌고저쩌고sssssssssssssssssssss
                        </a>
                        </td>
                        <td>
                         <a href="">sadasdasdasdasdasdassdsdfsdfsdfsfsdafsdfsdfsdfsddsadasdasdassa
                         </a>
                        </td>
                        <td>22-22-22</td>
                        <td>10</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td><a href="">어쩌고저쩌고
                        </a>
                        </td>
                        <td>
                         <a href="">ㅇㅇ
                         </a>
                        </td>
                        <td>22-22-22</td>
                        <td>10</td>
                      </tr>
                    </table>
                  </div>
                </form>
              </div>
              </div>
    	</div>
	</div>
	<%@include file="../../../footer.jsp"%>
</body>
<script>
const community = '/dogather/app/user/mypage/community.jsp';
if("<%= request.getRequestURI() %>"==community){
	document.querySelector("#community").className = "on";
	
	
}
</script>
</html>