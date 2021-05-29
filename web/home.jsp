<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
            <li class="layui-nav-item ">
                <a href="/doc/">doc</a>
            </li>
            <li class="layui-nav-item layui-this">
                <a href="/demo/">demo</a>
            </li>

            <li class="layui-nav-item layui-hide-xs">
                <a href="javascript:;" target="_blank" rel="nofollow">issues</a>
            </li>

        </ul>
    </div>
</div>


<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">

        <ul class="layui-nav layui-nav-tree site-demo-nav">

            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">User Management</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Add User</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Edit User</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Change Password</a>
                    </dd>
                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">Product Management</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Product List</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Add Product</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Edit Product</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">Supplier Management</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="jsp/supplierList.jsp" target="body_iframe">Supplier List</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Add Supplier</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">Edit Supplier</a>
                    </dd>
                </dl>

            </li><li class="layui-nav-item layui-nav-itemed">
            <a class="javascript:;" href="javascript:;">Inventory Management</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">Inventory List</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">In</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">Out</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">Total</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">Record</a>
                </dd>
            </dl>

        </li>
<%--            <li class="layui-nav-item layui-nav-itemed">--%>
<%--                <a class="javascript:;" href="javascript:;">系统管理</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd>--%>
<%--                        <a href="/demo/">数据字典</a>--%>
<%--                    </dd>--%>
<%--                </dl>--%>

<%--            </li>--%>

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
