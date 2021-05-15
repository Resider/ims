<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
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
                <a href="/doc/">文档</a>
            </li>
            <li class="layui-nav-item layui-this">
                <a href="/demo/">示例</a>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <!--<span class="layui-badge-dot" style="left:0; right: auto; margin: -4px 0 0 5px;"></span>-->
                    周边
                </a>
                <dl class="layui-nav-child layui-nav-child-c">
                    <dd class="layui-hide-sm layui-show-xs" lay-unselect>
                        <a href="https://gitee.com/sentsin/layui/issues" target="_self" rel="nofollow">问题反馈</a>
                        <hr>
                    </dd>

                    <dd lay-unselect><a href="/alone.html" target="_blank" lay-unselect>独立组件</a></dd>
                    <dd lay-unselect><a href="//fly.layui.com/extend/" target="_blank">扩展组件</a></dd>


                    <!--
                    <dd lay-unselect>
                      <a href="https://fly.layui.com/jump/txyhot/" target="_blank" id="layui-spm-event-aliyun">
                        腾讯云特惠
                        <span class="layui-badge-dot" style="margin-top: -5px;"></span>
                      </a>
                    </dd>
                    -->
                </dl>
            </li>

            <li class="layui-nav-item layui-hide-xs">
                <a href="//gitee.com/sentsin/layui/issues" target="_blank" rel="nofollow">反馈</a>
            </li>

        </ul>
    </div>
</div>

<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">

        <ul class="layui-nav layui-nav-tree site-demo-nav">

            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">人员信息管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">新增用户</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">修改用户</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">变更密码</a>
                    </dd>
                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">货物管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">货物列表</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">新增货物</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">修改货物</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">供应商管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="<%=path%>/supplier/supplierList" target="_self">供应商列表</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">新增供应商</a>
                    </dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">修改供应商</a>
                    </dd>
                </dl>

            </li><li class="layui-nav-item layui-nav-itemed">
            <a class="javascript:;" href="javascript:;">库存管理</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">库存列表</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">入库</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">出库</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">统计</a>
                </dd>
            </dl>
            <dl class="layui-nav-child">
                <dd>
                    <a href="/demo/">出、入库记录</a>
                </dd>
            </dl>

        </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">系统管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">数据字典</a>
                    </dd>
                </dl>

            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="javascript:;" href="javascript:;">人员信息管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/demo/">新增用户</a>
                    </dd>
                </dl>

            </li>

            <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
        </ul>

    </div>
</div>
</div>
<!-- aaaaaaaaaaaaaaa -->
<div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <ul class="layui-tab-title site-demo-title">
        <li class="layui-this">预览</li>
        <li>查看代码</li>
        <li>帮助</li>
    </ul>
    <div id="body_div" class="layui-body layui-tab-content site-demo site-demo-body">
        <iframe name="body_iframe" id="body_iframe" scrolling="no" height="100%" width="100%"/>
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
