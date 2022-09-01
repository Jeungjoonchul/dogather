<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${cp}/resources/js/cp.js"></script>
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/join.css" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id=main>
		<div id="head">

			<p class="center">
				<a href="${cp }/main"> <img
					src="${cp}/resources/images/dogather_logo.png" alt="" width="350px">
				</a>
			</p>

		</div>
		<div id="body">

			<div id="join">
				<div id="joinMain">
					<div id="join_header">
						<h2 id="bg_area">회원가입</h2>
						<ol id="join_step">
							<li id="join_step1" style="color: blue;">1 가입하기</li>
							<li id="join_step2">2 약관동의</li>
							<li id="join_step3">3 정보입력</li>
							<li id="join_step4">4 가입완료</li>
						</ol>
					</div>
					<div id="join1">
						<div>
							<!-- <input type="button" value="개인회원">
          <input type="button" value="기업회원"> -->

							<h1>DoGather에 오신 것을 환영합니다.</h1>
							<br>
							<button class="joinstart" type="button" onclick="next()">
								가입하기</button>
							<h5>지금 회원 가입하신 후 두게더의 다양한 서비스를 만나보세요.</h5>
						</div>
					</div>
					<form name="joinForm" method="post" action="${cp}/user/join_ok.us" onsubmit="return sendit()">
						<div id="join2" style="display: none">
	
							<c:forEach var="terms" items="${terms_list}">

								<div>
									<div class="terms_${terms.terms_index}_${terms.terms_type}">
										<div class="terms_title">
											<span>${terms.terms_title}</span>
											<c:choose>
												<c:when test="${terms.terms_type eq 'essential'}">
													<span>(필수)</span>
												</c:when>
												<c:otherwise>
													<span>(선택)</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="terms_contents">${terms.terms_contents}</div>
										<div>
											<input type="checkbox"
												name="user_terms_type${terms.terms_index}" id="user_terms_type${terms.terms_index}" value="true"><span>동의합니다</span>
										</div>
									</div>
								</div>
							</c:forEach>
							<BR> <input type="button" value="Next" onclick="next1()">
							<input type="button" value="Back" onclick="back1()">
						</div>

						<div id="join3" style="display: none">

							<span>회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</span>

							<table class="jointable">
								<tr>
									<td colspan="2"><h4>필수 입력 사항</h4></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" name="user_email" id="user_email" placeholder='이메일을 입력해주세요'></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>닉네임</th>
									<td><input type="text" name="user_nickname" id="user_nickname" placeholder='닉네임을 입력해주세요' maxlength="10"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>


								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="user_password"
										id="user_password" placeholder='비밀번호를 입력해주세요' maxlength="24"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" name="user_password_re"
										id="user_password_re" placeholder='비밀번호 확인' maxlength="24"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>이름</th>
									<td><input type="text" name="user_name" id="user_name"
										placeholder='이름을 입력해주세요' maxlength="17"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>휴대폰</th>
									<td><input type="tel" name="user_phone" id="user_phone"
										placeholder='휴대전화번호를 입력해주세요' maxlength="13"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>성별</th>
									<td><label><input type="radio" name="user_gender"
											class="user_gender" value="male" checked>남자</label> <label><input
											type="radio" name="user_gender" class="user_gender"
											value="female">여자</label></td>
								</tr>

								<tr>
									<th>생년월일</th>
									<td><input type="text" name="user_birth_date"
										id="user_birth_date" placeholder="생년월일 8자리를 입력해주세요"
										maxlength="10"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>

								<tr>
									<th>우편번호</th>
									<td><input type="text" name="zip_code" id="zip_code"
										readonly onclick="daumPostcode()" placeholder="우편 번호를 입력해주세요"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="address_default" id="address_default"
										readonly onclick="daumPostcode()" placeholder="주소를 입력해주세요"></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input type="text" name="address_detail"
										id="address_detail" placeholder="상세 주소를 입력해주세요" maxlength="300"></td>
								</tr>
								<tr>
									<th><span style="display: none;" class="status">null</span></th>
									<td><span>&nbsp;</span></td>
								</tr>
								<tr>
									<th>참고항목</th>
									<td><input type="text" name="address_extra"
										id="address_extra" readonly></td>
								</tr>
								<tr>
									<td colspan="2"><h4>선택 입력 사항</h4></td>
								</tr>
								<tr>
									<th>관심사</th><td>&nbsp;</td>
									
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
									<label><input type="checkbox" name="user_interest" class="user_interest" value="1">건강</label>
									<label><input type="checkbox" name="user_interest" class="user_interest" value="2">학습</label> 
									<label><input type="checkbox" name="user_interest" class="user_interest" value="3">교양</label> 
									<label><input type="checkbox" name="user_interest" class="user_interest" value="4">습관</label>
									<label><input type="checkbox" name="user_interest" class="user_interest" value="5">경제</label> 
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
									<label>기타<input
											type="text" name="user_interest_etc" id="user_interest_etc"
											placeholder='그 외 관심사를 입력해주세요(ex: 코딩)'></label>
											</td>
								</tr>
								<tr>
									<th>자기소개</th>
									<td><textarea rows="15" cols="60" name="user_intro"
											id="user_intro" style="resize: none;"
											placeholder="자기소개를 입력해주세요"></textarea></td>
								</tr>
							</table>
							<br> <input type="submit" value="가입 완료" onclick="sendit()"> <input
								type="button" value="나가기" onclick="back()">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="web_container">
			<div class="copyright">
				<p>
					서울 강남구 테헤란로 146 <span class="footer_line"></span>전화문의 010-5287-3610
				</p>
				<p>
					사업자 등록번호 101-86-76277 <span class="footer_line"></span>(주)DGT 대표이사
					양형모
				</p>

				<p>Copyright 2022 DGT Co., Ltd. All right Reserved</p>
				<div class="sns">
					<a href="https://www.facebook.com" target="_blank" class="facebook"><img
						src="${cp }/resources/images/small_facebook.png" alt="" /></a> <a
						href="https://www.instagram.com" target="_blank" class="insta"><img
						src="${cp }/resources/images/small_instagram.png" alt="" /></a>
				</div>
			</div>
		
			<div class="footer_menu">
				<ul>
					<li><a> <span>이용약관</span>
					</a></li>
					<li><a> <span>개인정보취급방침</span>
					</a></li>
					<li><a> <span>법적고지</span>
					</a></li>
				</ul>
				<div class="footer_btn">
					<a> <span>인재채용</span>
					</a> <a> <span>가맹점모집</span>
					</a>
				</div>
			</div>

			
		</div>
	</div>
</body>
	<script src="${cp }/resources/js/join.js"></script>
</html>