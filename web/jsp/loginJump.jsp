<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>login page</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<p>${msg}</p>
<p>${user.username}</p>
<c:if test="${sessionScope.get('user') != null}">
    <a href="../home.jsp">返回首页</a>
</c:if>
</body>
</html>
