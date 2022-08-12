<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<footer>
<div id="footer">
        <div class="web_container">
          
          <div class="copyright">
            <p>
              서울 강남구 테헤란로 146 <span class="footer_line"></span>전화문의
              010-5287-3610
            </p>
            <p>
              사업자 등록번호 101-86-76277
              <span class="footer_line"></span>(주)DGT 대표이사 양형모
            </p>

            <p>Copyright 2022 DGT Co., Ltd. All right Reserved</p>
            <div class="sns">
              <a
                href="https://www.facebook.com"
                target="_blank"
                class="facebook"
                ><img src="${cp}/resources/images/small_facebook.png" alt=""
              /></a>
              <a href="https://www.instagram.com" target="_blank" class="insta"
                ><img src="${cp}/resources/images/small_instagram.png" alt=""
              /></a>
            </div>
          </div>
          
          <div class="footer_menu">
            <ul>
              <li>
                <a>
                  <span>이용약관</span>
                </a>
              </li>
              <li>
                <a>
                  <span>개인정보취급방침</span>
                </a>
              </li>
              <li>
                <a>
                  <span>법적고지</span>
                </a>
              </li>
            </ul>
            <div class="footer_btn">
              <a>
                <span>인재채용</span>
              </a>
              <a>
                <span>가맹점모집</span>
              </a>
            </div>
          </div>
        </div>
      </div>
</footer>
  