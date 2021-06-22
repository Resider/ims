<%@ page import="org.springframework.web.context.request.SessionScope" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<% if (request.getSession().getAttribute("user") == null) response.sendRedirect("/ims/login.jsp");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>IMS</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="static/layui/css/global.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-fluid">
            <a class="logo" href="static/image/home/logo.png">
                <img src="static/image/home/logo.png" alt="layui">
            </a>
            <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
            <ul class="layui-nav">
                <%--                <li class="layui-nav-item ">--%>
                <%--                    <a href="/doc/">doc</a>--%>
                <%--                </li>--%>
                <c:if test="${not empty sessionScope.user.username}">
                    <li class="layui-nav-item layui-this">
                        <a href="javascript:;">${sessionScope.user.username}</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="<%=path%>/user/logout">log out</a>
                    </li>
                </c:if>


                <%--                <li class="layui-nav-item layui-hide-xs">--%>
                <%--                    <a href="javascript:;" target="_blank" rel="nofollow">issues</a>--%>
                <%--                </li>--%>

            </ul>
        </div>
    </div>


    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree site-demo-nav">
                <c:if test="${not empty sessionScope.user.type}">
                    <c:if test="${sessionScope.user.type == 1}">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="javascript:;" href="javascript:;">User Manager</a>
                            <dl class="layui-nav-child">
                                <dd>
                                    <a href="jsp/userList.jsp" target="body_iframe">用户管理</a>
                                </dd>
                            </dl>
                        </li>
                    </c:if>
                </c:if>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">货物管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="jsp/productionList.jsp" target="body_iframe">货物列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">供应商管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="jsp/supplierList.jsp" target="body_iframe">供应商列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">仓库管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="jsp/warehouseList.jsp" target="body_iframe">仓库列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="javascript:;" href="javascript:;">库存管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="jsp/enterRecord.jsp" target="body_iframe">入库、出库</a>
                        </dd>
                    </dl>
                    <%--  <dl class="layui-nav-child">
                          <dd>
                              <a href="/demo/">统计</a>
                          </dd>
                      </dl>--%>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="jsp/RecordList.jsp" target="body_iframe">出、入库记录</a>
                        </dd>
                    </dl>

                </li>

                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>

        </div>
    </div>
</div>

<div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <ul class="layui-tab-title site-demo-title">
        <li></li>
    </ul>
    <div id="body_div" class="layui-body layui-tab-content site-demo site-demo-body">
        <iframe name="body_iframe" id="body_iframe" scrolling="no" height="875px" width="1300px"/>
    </div>
</div>
<script type="text/javascript">
    var divHeight = document.getElementById("body_div").style.height;
    var divWidth = document.getElementById("body_div").style.width;
    document.getElementById("body_iframe").style.height = divHeight;
    document.getElementById("body_iframe").style.width = divWidth;
</script>

</body>
</html>
