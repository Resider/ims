<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>homepage</title>
    <meta name="decorator" content="default"/>
</head>
<body>

<form action="<%=path%>/user/login" method="post">
    <input type="text" name="username"/>
    <input type="password" name="password"/>
    <button type="submit">提交</button>
</form>

</body>
</html>
