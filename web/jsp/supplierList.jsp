<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <script type="text/javascript" src="../static/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        // jquery 开局执行的方法
        var pageIndex = 0;
        var pageCount = 0;
        var pageSum = 0;
        $(function () {
            firstLoad();
        });

        function loadPageTool() {
            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage, layer = layui.layer;
                laypage.render({
                    elem: 'layPage'
                    , count: (pageSum * 10)
                    , layout: ['count', 'prev', 'page', 'next',/* 'limit',*/ 'refresh', 'skip']
                    , jump: function (obj, first) {
                        if (!first) {
                            // alert(JSON.stringify(obj));
                            var pageIndex = obj.curr;
                            var pageSize = obj.limit;
                            supplierListAjax(pageIndex, pageSize);
                        }
                    }
                });
            });
        }

        function firstLoad() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/supplier/supplierListAjax",
                contentType: "application/json",
                dataType: "json",
                data: "{}",
                success: function (result) {
                    if (result != null && result.data != null) {
                        // 当前页数
                        pageIndex = result.pageIndex;
                        pageCount = result.pageCount;
                        pageSum = result.pageSum;
                        // // 总条数和总页数
                        // $("#pageCount").html(result.pageCount);
                        // $("#pageSum").html(result.pageSum);
                        loadPageTool();

                        $("#tbody").html("");
                        var content = "";
                        $.each(result.data, function (index, item) {
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.supplierName + "</td>" +
                                "<td>" + item.createTime + "</td>" +
                                "<td>" +
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>删除</button>" +
                                "&nbsp;<button type='button' onclick='update(" + JSON.stringify(item) + ")'>修改</button>" +
                                "</td></tr>";
                        });
                        $("#tbody").append(content);
                    }
                }
            });


        }

        function supplierListAjax(index, size) {
            var supplierName = $("input[name='supplierName']").val();
            var minCreateTime = $("input[name='minCreateTime']").val();
            var maxCreateTime = $("input[name='maxCreateTime']").val();
            var params = {
                "supplierName": supplierName,
                "minCreateTime": minCreateTime,
                "maxCreateTime": maxCreateTime,
                "pageIndex": index,
                "pageSize": size
            }
            $.ajax({
                type: "POST",
                url: "<%=path%>/supplier/supplierListAjax",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result.data != null) {
                        var oriPageSum = pageSum;
                        // 当前页数
                        pageIndex = result.pageIndex;
                        pageCount = result.pageCount;
                        pageSum = result.pageSum;
                        if (oriPageSum != result.pageSum) {
                            loadPageTool();
                        }

                        $("#tbody").html("");
                        var content = "";
                        $.each(result.data, function (index, item) {
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.supplierName + "</td>" +
                                "<td>" + item.createTime + "</td>" +
                                "<td>" +
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>删除</button>" +
                                "&nbsp;<button type='button' onclick='update(" + JSON.stringify(item) + ")'>修改</button>" +
                                "</td></tr>";
                        });
                        $("#tbody").append(content);
                    }
                }
            });
        }

        function search() {
            supplierListAjax();
            // loadPageTool();
        }

        function reflush() {
            $("#query input").val("");      // 将查询框里的查询条件清空
            supplierListAjax();
            // loadPageTool();
        }

        function update(item) {
            var id = item.id;
            var supplierName = item.supplierName;
            alert(id + supplierName);
            $("input[name='id']").val(id);
            $("input[name='editSupplierName']").val(supplierName);
        }

        function del(id) {
            if (confirm("确认删除id:" + id + "供应商吗")) {
                console.log(id);
                $.post("<%=path%>/supplier/del", {"id": id}, function (result) {
                    if (result) {
                        alert("删除成功");
                        supplierListAjax();
                        loadPageTool();
                    } else {
                        alert("删除失败");
                    }
                })
            }
        }

        function edit() {
            if ($("input[name='editSupplierName']").val() == '') {
                alert("供应商姓名不可为空");
                return;
            }
            var params = {
                "id": $("input[name='id']").val(),
                "supplierName": $("input[name='editSupplierName']").val()
            }
            alert($("input[name='id']").val() + $("input[name='editSupplierName']").val());
            $.ajax({
                type: "POST",
                url: "<%=path%>/supplier/editSupplier",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        supplierListAjax();
                        loadPageTool();
                    } else {
                        alert("新增或修改供应商信息失败");
                    }
                }
            });
        }

    </script>
</head>
<body>
<div class="layui-layout layui-layout-admin">

    <div class="layui-body layui-tab-content site-demo site-demo-body" style="position: relative;left: 30px;">
        <div class="layui-tab-item layui-show">
            <div class="layui-main">
                <div id="LAY_preview">
                    <%----%>
                    <div class="layui-form-item" id="query">
                        <div class="layui-inline">
                            <label class="layui-form-label">供应商名称</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="supplierName"
                                       value="${query.supplierName}">
                            </div>
                            <label class="layui-form-label">登记日期</label>
                            <div class="layui-input-inline">
                                <input name="minCreateTime" type="date" class="layui-input"
                                       value="${query.minCreateTime}"/>
                            </div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline">
                                <input name="maxCreateTime" type="date" class="layui-input"
                                       value="${query. maxCreateTime}"/>
                            </div>
                            <label class="layui-form-label"> </label>
                            <button type="button" class="layui-btn layui-btn-normal"
                                    onclick="search()">查询
                            </button>
                            <button type="button" class="layui-btn layui-btn-normal" onclick="reflush()">重置</button>
                            <button type="button" class="layui-btn layui-btn-normal" onclick="add()">新增</button>
                        </div>
                    </div>
                    <%----%>


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
                            <th>登记日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">

                        </tbody>
                        <tr>
                            <td colspan="4" align="center">
                                <div id="layPage"></div>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <script>
        window.global = {
            pageType: 'demo'
            , preview: function () {
                var preview = document.getElementById('LAY_preview');
                return preview ? preview.innerHTML : '';
            }()
        };

        function add() {
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


</body>
</html>
