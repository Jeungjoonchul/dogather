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
    <!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


    <title>Doːgather</title>
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="stylesheet" href="${cp }/resources/css/dogatherDetail.css" />
</head>
<body>
<%-- 	로그인 후 이용해야할 때 사용
	<%@include file="/loginCheck.jsp" %> --%>
	<%@include file="/header.jsp" %>
	<main>
        <div id="main">
        
        <div id="dg_community">
            <div id="dg_comm_category">
                
        
                    
                      <div class="dg_comm_photo">
                        <c:choose>
									<c:when test="${dg.dg_banner_sys eq null }">
										<c:choose>
											<c:when test="${dg.category_index eq 1 }"><img src="${cp}/resources/images/default_health.png"/></c:when>
											<c:when test="${dg.category_index eq 2 }"><img src="${cp}/resources/images/default_study.png"/></c:when>
											<c:when test="${dg.category_index eq 3 }"><img src="${cp}/resources/images/default_refinement.png"/></c:when>
											<c:when test="${dg.category_index eq 4 }"><img src="${cp}/resources/images/default_habit.png"/></c:when>
											<c:otherwise><img src="${cp}/resources/images/default_economy.png"/></c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
									<img src="${cp }/upload/images/dogather/banner/${dg.dg_banner_sys}"/>
									</c:otherwise>
								</c:choose>
                      </div>
                      
                      <div class="dg_comm_information">
                      
                        <span>${dg.dg_title }</span>
                        <br>
                        <span>만든 사람 : ${dg.user_nickname }</span>
                        <br>      
                        <span>시작일 : ${dg.dg_reg_date }
                        <c:if test="${dg.dg_expire!=null }">/ 종료일 : ${dg.dg_expire }</c:if> 
                        </span><br>
                        <br>
                        <p class="list_container_contents">
                          ${dg.dg_intro}
                        </p>
                        <br>
                        <br>
                        <c:set var="doneLoop" value="false"/>
                        <c:forEach items="${members }" var="member">
                        	<c:if test="${not doneLoop }">
                        		<c:if test="${member == loginUser.user_index}">
	                        		<nav>
	                     				<ul>
				                			<li><a href="#"><span class="purple">내정보</span> 보러가기</a></li>
				                			<li><a href="${cp }/dg/post_write.dg?dp_type=cert&dg_index=${dg.dg_index}"><span class="purple">인증글</span> 쓰러가기</a></li>
				                			<li><a href="${cp }/dg/post_write.dg?dp_type=feed&dg_index=${dg.dg_index}"><span class="purple">피드</span> 쓰러가기</a></li>
				                			<li><a href="javascript:quitDg(${loginUser.user_index },${dg.user_index },${dg.dg_index })" id="quit_dg_btn"><span class="purple">두게더</span> 그만두기</a></li>
	              						</ul>
	            					</nav>
                        			<c:set var="doneLoop" value="true"/>
                        		</c:if>
                        	</c:if>
                        </c:forEach>
                        <c:if test="${not doneLoop }">
                     <a class="joindg" href="${cp }/dg/join.dg?dg_index=${dg.dg_index}">두게더 신청하기</a>
                        </c:if>
					
                    </div>
                    </div>
               
            
            <div id="dg_comm_mould">
                <div class="dg_comm_header">
                  <ul>
                    <li><button >전체보기</button></li>
                    <li><button >피드</button></li>
                    <li><button >인증</button></li>
                    <li><button >좋아요</button></li>
                    <li><button >등록일</button></li>
                  </ul>

                </div>
                <div id="dg_comm_bulletin">
                <div class="dg_comm_feed">
                  <table class="테이블명설정해주세요">
                    <tr>
                    <th width="20%" class="comm_feed_user_nickname">제이콥123</th>
                    <th width="30%" class="comm_feed_title">여러분들은 어떻게 생각하시나요?(피드글)</th>
                    <th width="50%" class="comm_feed_date">2022-08-15 22:00</th>
                  </tr>
                  <tr>
                  <td width="100%" height="200px" class="comm_feed_contents" colspan="3">아 정말 이거 못해먹겠어요 ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜn역겨워 죽겠엉</td>
                  </tr>
                  <tr>
                  <td colspan="2">댓글</td>
                  <td>좋아요&nbsp;<span class="comm_feed_like">1</span></td>
                  </tr>
                  <tr>
                  <td class="comm_user_nickname" width="70px">제이콥</td>
                  <td width="70%">ㅋㅋㅋㅋㅋ그러게요</td>
                </tr>
                   
                  </table>
                </div>
                <div class="dg_comm_board" >
                  <table width="100%" class="테이블명설정해주세요">
                    <tr>
                    <th width="20%" class="comm_board_user_nickname">제이콥123</th>
                    <th width="30%" class="comm_board_title">인증1일차(인증글)</th>
                    <th width="50%" class="comm_board_date">2022-08-15 22:00</th>
                  </tr>
                  <tr>
                  <th width="100%" height="200px" class="comm_board_contents" colspan="3">인정 야무지게 때립니다(인증글)</th>
                  </tr>
                  <tr>
                  <td colspan="2">댓글</td>
                  <td>좋아요&nbsp;<span class="comm_board_like">1</span></td>
                  </tr>
                  <tr>
                  <td class="comm_user_nickname" width="70px">제이콥</td>
                  <td width="70%">ㅋㅋㅋㅋㅋ그러게요</td>
                </tr>
                   
                  </table>
                </div>
                <div class="dg_comm_feed">
                  <table width="100%" class="테이블명설정해주세요">
                  <tr>
                  <th width="20%" class="comm_feed_user_nickname">제이콥123</th>
                  <th width="30%" class="comm_feed_title">여러분들은 어떻게 생각하시나요?(피드글)</th>
                  <th width="50%" class="comm_feed_date">2022-08-15 22:00</th>
                </tr>
                <tr>
                <th width="100%" height="200px" class="comm_feed_contents" colspan="3">아 정말 이거 못해먹겠어요 ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜbbbbbbbb역겨워 죽겠엉</th>
                </tr>
                <tr>
                <td colspan="2">댓글</td>
                <td>좋아요&nbsp;<span class="comm_feed_like">1</span></td>
                </tr>
                <tr>
                <td class="comm_user_nickname" width="70px">제이콥</td>
                <td width="70%">ㅋㅋㅋㅋㅋ그러게요</td>
              </tr>
                 
                </table></div>
                <div class="dg_comm_board" > 
                  <table width="100%" class="테이블명설정해주세요">
                  <tr>
                  <th width="20%" class="comm_board_user_nickname">제이콥123</th>
                  <th width="30%" class="comm_board_title">인증1일차(인증글)</th>
                  <th width="50%" class="comm_board_date">2022-08-15 22:00</th>
                </tr>
                <tr>
                <th width="100%" height="200px" class="comm_board_contents" colspan="3">인정 야무지게 때립니다(인증글)</th>
                </tr>
                <tr>
                <td colspan="2">댓글</td>
                <td>좋아요&nbsp;<span class="comm_board_like">1</span></td>
                </tr>
                <tr>
                <td class="comm_user_nickname" width="70px">제이콥</td>
                <td width="70%">ㅋㅋㅋㅋㅋ그러게요</td>
              </tr>
                 
                </table></div>
                <div class="dg_comm_feed">피드영역</div>
                <div class="dg_comm_board">인증글 영역</div>
              </div>
            </div>
         
        </div>
        </div>
    </main>
    <%@include file="/footer.jsp" %>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>