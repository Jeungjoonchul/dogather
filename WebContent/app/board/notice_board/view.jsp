<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="today" value="<%=new java.util.Date()%>"></c:set>
<c:set var="today">
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
</c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${cp }/resources/js/summernote.js"></script>

<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/boardView.css" />
</head>
<style>

}
</style>
<body>
<input type="hidden" id="totalPage" value="${totalPage}">
<input type="hidden" id="totalCnt" value="${totalCnt}">
<input type="hidden" id="startPage" value="${startPage}">
<input type="hidden" id="endPage" value="${endPage}">

<input type="hidden" id="loginUser_nickname" value="${loginUser.user_nickname }"/>
	<%@include file="../../../header.jsp"%>
	<main>
	<div id="main">
      <div id="post">
        <form>
          <div id="post_title">
            <h2>${b.b_title }</h2>
          </div>
          <div id="post_meta">
            <div id="meta_left">
              <span>${b.user_nickname } &#124;</span>
              <span>${b.b_subject } &#124;</span>
              <span
                >${b.b_reg_date}<c:if test="${b.b_reg_date!=b.b_update_date}"
                  >(수정됨 : <span>${b.b_update_date }</span>)</c:if
                ></span
              >
            </div>
            <div id="meta_right">
              <span>조회 ${b.b_hits } &#124;</span>
              <span>댓글 ${b.b_reply_cnt } &#124;</span>
              <span>좋아요 </span>
            </div>
          </div>
          <div id="post_contents_area">
            <div id="summernote">${b.b_contents }</div>
          </div>
          <div id="like_up"><button>좋아요 up</button></div>
          <div id="post_button">

            <a href="${cp }/board/free_board/post_list.bo?page=${param.page}&keyword=${param.keyword }&subject=${param.subject}"
              >목록</a
            >
          </div>
        </form>
      </div>

    </div>
	</main>
	
	<%@include file="../../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/board.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote('destroy');			
	});
</script>
</html>