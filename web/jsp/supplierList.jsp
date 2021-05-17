<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/layui/css/global.css" media="all">
    <script type="text/javascript" src="../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo" summer>
        <div class="layui-fluid">
            <a class="logo" href="../static/image/home/logo.png">
                <img src="../static/image/home/logo.png" alt="layui">
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
                            <a href="https://gitee.com/sentsin/layui/issues"  rel="nofollow">问题反馈</a>
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


                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>

        </div>
    </div>
<!-- aaaaaaaaaaaaaaa -->
<div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <%--<ul class="layui-tab-title site-demo-title">
        <li class="layui-this">预览</li>
        <li>查看代码</li>
        <li>帮助</li>
    </ul>--%>
    <div class="layui-body layui-tab-content site-demo site-demo-body">
        <div class="layui-tab-item layui-show">
            <div class="layui-main">
                <div id="LAY_preview">
                    <button type="button" class="layui-btn layui-btn-normal" onclick="add()">新增</button>
                    <table class="layui-table" aria-colspan="3">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>供应商名称</th>
                                <th>登录日期</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="s" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${s.supplierName}</td>
                                    <td>${s.createTime}</td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    window.global = {
        pageType: 'demo'
        ,preview: function(){
            var preview = document.getElementById('LAY_preview');
            return preview ? preview.innerHTML : '';
        }()
    };

    function add(){
        layer.open({
            type: 2,
            title: '很多时候，我们想最大化看，比如像这个页面。',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: '../jsp/addSupplier.jsp'
        });
    }
</script>
</div>

<%--<div id="addSupplier">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">输入框</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择框</label>
            <div class="layui-input-block">
                <select name="city" lay-verify="required">
                    <option value=""></option>
                    <option value="0">北京</option>
                    <option value="1">上海</option>
                    <option value="2">广州</option>
                    <option value="3">深圳</option>
                    <option value="4">杭州</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">复选框</label>
            <div class="layui-input-block">
                <input type="checkbox" name="like[write]" title="写作">
                <input type="checkbox" name="like[read]" title="阅读" checked>
                <input type="checkbox" name="like[dai]" title="发呆">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开关</label>
            <div class="layui-input-block">
                <input type="checkbox" name="switch" lay-skin="switch">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文本域</label>
            <div class="layui-input-block">
                <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
    </script>
</div>--%>
</body>
</html>
