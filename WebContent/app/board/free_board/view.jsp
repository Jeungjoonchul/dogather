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

<title>게시글 보기</title>
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
            <h2>${fb.b_title }</h2>
          </div>
          <div id="post_meta">
            <div id="meta_left">
              <span>${fb.user_nickname } &#124;</span>
              <span>${fb.b_subject } &#124;</span>
              <span
                >${fb.b_reg_date}<c:if test="${fb.b_reg_date!=fb.b_update_date}"
                  >(수정됨 : <span>${fb.b_update_date }</span>)</c:if
                ></span
              >
            </div>
            <div id="meta_right">
              <span>조회 ${fb.b_hits } &#124;</span>
              <span>댓글 ${fb.b_reply_cnt } &#124;</span>
              <span>좋아요 </span>
            </div>
          </div>
          <div id="post_contents_area">
            <div id="summernote">${fb.b_contents }</div>
          </div>
          <div id="like_up"><button>좋아요 up</button></div>
          <div id="post_button">
            <c:if test="${loginUser.user_nickname==fb.user_nickname }">
              <a
                href="${cp}/board/free_board/post_update.bo?b_index=${fb.b_index}&page=${param.page}&keyword=${param.keyword }"
                >수정</a
              >
              <a href="javascript:delete_check(${fb.b_index},${param.page },'${param.keyword }');">삭제</a>
            </c:if>
            <a href="${cp }/board/free_board/post_list.bo?page=${param.page}&keyword=${param.keyword }"
              >목록</a
            >
          </div>
        </form>
      </div>

      <div id="reply">
      <c:choose>
      	<c:when test="${fb_replies==null or fb_replies.size()==0 }">
      	<div id="reply_list" style="text-indent: 40px">
      		작성된 댓글이 없습니다.
      	</div>
      	</c:when>
      	<c:otherwise>
        <div id="reply_list">
          
            <div id="reply_view">
              <img src="" alt="" />댓글[${fb.b_reply_cnt }]<input type="button" id="reply_area_toggle" value="접기" style="font-size: 12px;"/>
              
            </div>
            <div id="reply_area" style="display: block">
            <c:set var="i" value="0"/>
            <c:forEach var="reply" items="${fb_replies }">
            <fmt:parseDate var="dateTime" value="${reply.r_reg_date }" pattern="yyyy-MM-dd HH:mm:ss" />
			<c:set var="date"><fmt:formatDate value="${dateTime }" pattern="yyyy-MM-dd" /></c:set>
			<c:set var="time"><fmt:formatDate value="${dateTime }" pattern="HH:mm" /></c:set>
            <div class="reply_area">
                <div class="reply_header">
                  <div class="reply_header_left">${reply.user_nickname}</div>
                  <div class="reply_header_right">
                    <span>
                    	${today eq date ? time : date }
						<c:if test="${reply.r_reg_date!=reply.r_update_date}">(수정됨)</c:if>
					</span>
					<c:choose>
						<c:when test="${loginUser.user_index==reply.user_index }">
						<input type="button" class="reply_btns reply_update" value="수정"/>
						<input type="button" class="reply_btns reply_update_submit" value="수정 완료" style="display: none;"/>
						<input type="button" class="reply_btns reply_delete" value="삭제"/>
						
						</c:when>
						<c:otherwise>
						<input type="button" class="reply_btns reply_delete" value="신고"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" class="r_index" value="${reply.r_index}"/>
                  </div>
                </div>
                <div class="reply_content">
              		<textarea readonly spellcheck="false">${reply.r_contents}</textarea>
                </div>
              </div>
              <c:set var="i" value="${i+1}"></c:set>
            </c:forEach>
            <div id="reply_page_selector">
            	<c:if test="${startPage!=1 }">
            		<input type="button" class="reply_page_btn" value="&lt;"/>
            	</c:if>
            	<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${page==i }">
							<span class="nowPage">${i}</span>
						</c:when>
						<c:otherwise>
							<input type="button" class="reply_page_btn" value="${i }"/>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage!=totalPage }">
					<input type="button" class="reply_page_btn" value="&gt;"/>
				</c:if>
            </div>
            </div>
        </div>
      	</c:otherwise>
      </c:choose>
        <div id="reply_write_area">
          <form name="reply_write" id="reply_write">
            <input type="hidden" name="b_index" id="b_index" value="${fb.b_index }"/>
            <input type="hidden" id="r_name" name="r_name" value="t_fb_reply" />
            <input type="hidden" id="page" value="${page}">
            <div id="reply_write_input">
            <c:choose>
            	<c:when test="${fb.b_reply_cnt==0 }">
              <textarea name="r_contents" id="r_contents" rows="4" cols="30" style="resize: none" placeholder="첫번째 댓글의 주인공이 되어보세요"></textarea>
            	</c:when>
            	<c:otherwise>
              <textarea name="r_contents" id="r_contents" rows="4" cols="30" style="resize: none" placeholder="아름다운 댓글을 작성해주세요"></textarea>
            	</c:otherwise>
            </c:choose>
            </div>
            <a id="reply_on"
              href=""
              >댓글 쓰기</a>
          </form>
        </div>
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