<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherWrite.css" />


</head>
<body>
	<%@include file="/loginCheck.jsp"%>
	<%@include file="/header.jsp"%>
	<main>
		<div id="main">
			<form name="dogather_post_on" action="${cp }/dg/post_on.dg"
				method="post" enctype="multipart/form-data">
				<div style="display: none">
					<input type="hidden" value="${param.dg_index }" name="dg_index">
				</div>
				<table>
					<thead>
						<tr>
							<td>
								<h2>
									<span class="purple">두게더</span><span> 새글 쓰기</span>
								</h2>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div>
									<c:choose>
										<c:when test="${param.dp_type eq 'feed' }">
											<label for="dp_type_feed">피드</label>
											<input type="radio" name="dp_type" value="feed"
												id="dp_type_feed" checked>
											<label for="dp_type_cert">인증</label>
											<input type="radio" name="dp_type" value="cert"
												id="dp_type_cert">
										</c:when>
										<c:otherwise>
											<label for="dp_type_feed">피드</label>
											<input type="radio" name="dp_type" value="feed"
												id="dp_type_feed">
											<label for="dp_type_cert">인증</label>
											<input type="radio" name="dp_type" value="cert"
												id="dp_type_cert" checked>
										</c:otherwise>
									</c:choose>
								</div>
							<td>
						</tr>
						<tr>
							<td>
								<h4>내용</h4> <textarea name="dp_contents" id="dp_contents"
									spellcheck="false" maxlength="400"></textarea> <span
								id="counter">(0 / 최대 400자)</span>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td><c:choose>
									<c:when test="${param.dp_type eq 'feed' }">
										<div id="cert_images" style="display: none;">
											<div class="cert_image">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image1" />
												</div>
												<div>
													<input type="file" name="dp_image1" id="dp_image1"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image1')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image1')" class="purple">삭제</a>
												</div>
											</div>
											<div class="cert_image" style="display: none;">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image2" />
												</div>
												<div>
													<input type="file" name="dp_image2" id="dp_image2"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image2')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image2')" class="purple">삭제</a>
												</div>
											</div>
											<div class="cert_image" style="display: none;">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image3" />
												</div>
												<div>
													<input type="file" name="dp_image3" id="dp_image3"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image3')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image3')" class="purple">삭제</a>
												</div>
											</div>

										</div>
									</c:when>
									<c:otherwise>
										<div id="cert_images">
											<div class="cert_image">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image1" />
												</div>
												<div>
													<input type="file" name="dp_image1" id="dp_image1"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image1')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image1')" class="purple">삭제</a>
												</div>
											</div>
											<div class="cert_image" style="display: none;">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image2" />
												</div>
												<div>
													<input type="file" name="dp_image2" id="dp_image2"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image2')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image2')" class="purple">삭제</a>
												</div>
											</div>
											<div class="cert_image" style="display: none;">
												<div>
													<img src="${cp }/resources/images/image_upload.png"
														id="cert_image3" />
												</div>
												<div>
													<input type="file" name="dp_image3" id="dp_image3"
														class="dp_image" style="display: none;" />
												</div>
												<div>
													<span>이미지가 없습니다</span>
												</div>
												<div>
													<a href="javascript:upload_image('dp_image3')"
														class="purple">사진 첨부</a><a
														href="javascript:delete_image('dp_image3')" class="purple">삭제</a>
												</div>
											</div>

										</div>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<td><input type="submit" value="작성하기"></td>
						</tr>
					</tfoot>
				</table>
				
			</form>
		</div>
	</main>
	<%@include file="/footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>