<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>测试页面</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<table>
    <c:forEach var="a" items="${list}">
        <tr>
            <td>${a.id}</td>
            <td>${a.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
