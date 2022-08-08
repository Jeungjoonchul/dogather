<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="date1" value = "2022-08-08 10:28:32"/>
<c:set var="date2" value = "2022-08-07 10:28:32"/>
<c:set var="now" value="<%=new Date()%>"/>
<c:set var="now"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
<fmt:parseDate value="${date1}" var="date1" pattern="yyyy-MM-dd hh:mm:ss"/>
<c:set var="date1_date"><fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/></c:set>
<c:set var="date1_time"><fmt:formatDate value="${date1}" pattern="hh:mm"/></c:set>
<fmt:parseDate value="${date2}" var="date2" pattern="yyyy-MM-dd hh:mm:ss"/>
<c:set var="date2_date"><fmt:formatDate value="${date2}" pattern="yyyy-MM-dd"/></c:set>
<c:set var="date2_time"><fmt:formatDate value="${date2}" pattern="hh:mm"/></c:set>
${now } / ${date1_date}
${now.getClass() }
${date1_date.getClass() }
${now eq date1_date?date1_time:date1_date }
${now eq date2_date?date2_time:date2_date }

<%-- <c:choose>
	<c:when test="${now-date1p}">참</c:when>
	<c:otherwise>거짓</c:otherwise>
</c:choose> --%>

</body>
</html>