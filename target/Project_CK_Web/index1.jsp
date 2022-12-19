<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" href="">

</head>
<body>

<% Account auth= (Account) session.getAttribute("auth"); %>
<% if(auth==null){%>
<p>Bạn chưa đăng nhập</p>
<% }else{ %>
<p>Chào bạn: <%= auth.getUsername() + " " + auth.getPassword()%> </p>
<% } %>

<%--<%@include file="layout/header.jsp" %>--%>

<%-- Main content --%>

<%--<c:set var="auth" value="${sessionScope.auth}"/>--%>
<%--<c:if test="${auth == null}">--%>
<%--    <p>Vui lòng đăng nhập</p>--%>
<%--</c:if>--%>
<%--<c:if test="${auth != null}">--%>
<%--    <p>Xin chào bạn ${auth.fullName}</p>--%>
<%--    &lt;%&ndash;    <c:if test="${auth.role>=1}">&ndash;%&gt;--%>
<%--    &lt;%&ndash;        <p> Vào trang quản trị</p>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    </c:if>&ndash;%&gt;--%>
<%--</c:if>--%>

<%--<c:set var="loginMes" value="${sessionScope.login}"></c:set>--%>
<%--<p class="alert alert-primary"> ${loginMes}</p>--%>

<%----%>
<%--<%@include file="layout/menu.jsp" %>--%>
<%--<%@include file="layout/footer.jsp" %>--%>
</body>
</html>
