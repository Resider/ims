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
        var pageIndex = 0;
        var pageCount = 0;
        var pageSum = 0;
        $(function () {
            firstLoad();
        });

        function loadDateTool() {
            layui.use('laydate', function () {
                var laydate = layui.laydate;
                laydate.render({
                    elem: '#test1-1'
                    , lang: 'en'
                });
                laydate.render({
                    elem: '#test1-2'
                    , lang: 'en'
                });
            })
        }

        function loadPageTool() {
            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage, layer = layui.layer;
                laypage.render({
                    elem: 'layPage'
                    , count: (pageCount)
                    , layout: ['count', 'prev', 'page', 'next',/* 'limit',*/ 'refresh', 'skip']
                    , jump: function (obj, first) {
                        if (!first) {
                            // alert(JSON.stringify(obj));
                            var pageIndex = obj.curr;
                            var pageSize = obj.limit;
                            productListAjax(pageIndex, pageSize);
                        }
                    }
                });
            });
        }

        function firstLoad() {
            loadDateTool();
            $.ajax({
                type: "POST",
                url: "<%=path%>/product/productListAjax",
                contentType: "application/json",
                dataType: "json",
                data: "{}",
                success: function (result) {
                    if (result != null && result.data != null) {

                        pageIndex = result.pageIndex;
                        pageCount = result.pageCount;
                        pageSum = result.pageSum;

                        loadPageTool();

                        $("#tbody").html("");
                        var content = "";
                        $.each(result.data, function (index, item) {
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.productName + "</td>" +
                                "<td>" + item.productType + "</td>" +
                                "<td>" + item.productDesc + "</td>" +
                                "<td>" + item.productQuantity + "</td>" +
                                "<td>" + item.productUnit + "</td>" +
                                "<td>" + item.productPrice + "</td>" +
                                "<td>" + item.productSpec + "</td>" +
                                // "<td>" + item.createTime + "</td>" +
                                "<td>" +
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>delete</button>" +
                                "&nbsp;<button type='button' onclick='update(" + JSON.stringify(item) + ")'>update</button>" +
                                "</td></tr>";
                        });
                        $("#tbody").append(content);
                    }
                }
            });


        }

        function productListAjax(index, size) {
            var productName = $("input[name='productName']").val();
            var minCreateTime = $("input[name='minCreateTime']").val();
            var maxCreateTime = $("input[name='maxCreateTime']").val();
            var productType = $("input[name='productType']").val();
            var params = {
                "productName": productName,
                "productType": productType,
                "minCreateTime": minCreateTime,
                "maxCreateTime": maxCreateTime,
                "pageIndex": index,
                "pageSize": size
            }
            $.ajax({
                type: "POST",
                url: "<%=path%>/product/productListAjax",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result.data != null) {
                        var oriPageSum = pageSum;
                        var oriPageCount = pageCount;

                        pageIndex = result.pageIndex;
                        pageCount = result.pageCount;
                        pageSum = result.pageSum;
                        if (oriPageCount != result.pageCount) {
                            loadPageTool();
                        }

                        $("#tbody").html("");
                        var content = "";
                        $.each(result.data, function (index, item) {
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.productName + "</td>" +
                                "<td>" + item.productType + "</td>" +
                                "<td>" + item.productDesc + "</td>" +
                                "<td>" + item.productQuantity + "</td>" +
                                "<td>" + item.productUnit + "</td>" +
                                "<td>" + item.productPrice + "</td>" +
                                "<td>" + item.productSpec + "</td>" +
                                // "<td>" + item.createTime + "</td>" +
                                "<td>" +
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>delete</button>" +
                                "&nbsp;<button type='button' onclick='update(" + JSON.stringify(item) + ")'>update</button>" +
                                "</td></tr>";

                        });
                        $("#tbody").append(content);
                    }
                }
            });
        }

        function search() {
            productListAjax();
        }

        function reset() {
            $("#query input").val("");
            productListAjax();
        }


        function del(id) {
            if (confirm("Are you sure to delete it")) {
                console.log(id);
                $.post("<%=path%>/product/del", {"id": id}, function (result) {
                    if (result) {
                        alert("success");
                        productListAjax();
                        loadPageTool();
                    } else {
                        alert("failure");
                    }
                })
            }
        }

       /* function edit() {
            if ($("input[name='editProductName']").val() == '') {
                alert("product's name cannot be empty");
                return;
            }
            var params = {
                "id": $("input[name='id']").val(),
                "productName": $("input[name='editProductName']").val()
            }
            alert($("input[name='id']").val() + $("input[name='editProductName']").val());
            $.ajax({
                type: "POST",
                url: "<%=path%>/product/editProduct",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        productListAjax();
                        loadPageTool();
                    } else {
                        alert("failure");
                    }
                }
            });
        }*/

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
                            <label class="layui-form-label">product's Name</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="productName"
                                       value="${query.productName}">
                            </div>
                            <label class="layui-form-label">product's Type</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="productType"
                                       value="${query.productType}">
                            </div>
                            <label class="layui-form-label">create date</label>
                            <div class="layui-input-inline">
                                <%--                                <input name="minCreateTime" type="date" class="layui-input"--%>
                                <%--                                       value="${query.minCreateTime}"/>--%>
                                <input type="text" class="layui-input" id="test1-1" name="minCreateTime"
                                       placeholder="yyyy-MM-dd"
                                       value="${query. minCreateTime}">
                            </div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline">
                                <%--                                <input name="maxCreateTime" type="date" class="layui-input"--%>
                                <%--                                       value="${query. maxCreateTime}"/>--%>
                                <input type="text" class="layui-input" id="test1-2" name="maxCreateTime"
                                       placeholder="yyyy-MM-dd"
                                       value="${query.maxCreateTime}">
                            </div>
                            <div>
                                <label class="layui-form-label"> </label>
                                <button type="button" class="layui-btn layui-btn-normal"
                                        onclick="search()">search
                                </button>
                                <button type="button" class="layui-btn layui-btn-normal" onclick="reset()">reset
                                </button>
                                <button type="button" class="layui-btn layui-btn-normal" onclick="add()">new</button>
                            </div>
                        </div>
                    </div>
                    <%----%>

                    <table class="layui-table" aria-colspan="3">
                  <%--      <colgroup>
                            <col width="200">
                            <col width="200">
                            <col>
                        </colgroup>--%>
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>product's name</th>
                            <th>product's type</th>
                            <th>product's desc</th>
                            <th>product's quantity</th>
                            <th>product's unit</th>
                            <th>product's price</th>
                            <th>product's spec</th>
<%--                            <th>create date</th>--%>
                            <th>operate</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">

                        </tbody>
                        <tr>
                            <td colspan="10" align="center">
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
                title: 'add',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['893px', '600px'],
                content: '../jsp/addProduct.jsp'
            });
        }

        function update(item) {
            var id = item.id;
            layer.open({
                type: 2,
                title: 'update',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['893px', '600px'],
                content: '<%=path%>/product/updateDetail?id='+id
            });
        }
    </script>

</div>


</body>
</html>
