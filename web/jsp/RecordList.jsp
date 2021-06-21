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
                            recordPage(pageIndex, pageSize);
                        }
                    }
                });
            });
        }

        function firstLoad() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/record/recordPage",
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
                            var typeStr = "";
                            if (item.type === 1) {
                                typeStr = "入库";
                            }
                            if (item.type === 2) {
                                typeStr = "出库";
                            }
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.warehouse.warehouseName + "</td>" +
                                "<td>" + item.supplier.supplierName + "</td>" +
                                "<td>" + item.product.productName + "</td>" +
                                "<td>" + item.quantity + "</td>" +
                                "<td>" + typeStr + "</td>" +
                                "<td>" + item.product.productQuantity + "</td>" +
                                "<td>" + item.product.productUnit + "</td>" +
                                "<td>" + item.operator + "</td>" +
                                "<td>" + item.createTime + "</td></tr>"
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>delete</button>" +
                                "&nbsp;<button type='button' onclick='update(" + JSON.stringify(item) + ")'>update</button>" +
                                "</td></tr>";
                        });
                        $("#tbody").append(content);
                    }
                }
            });


        }

        function recordPage(index, size) {

            var params = {
                "pageIndex": index,
                "pageSize": size
            }
            $.ajax({
                type: "POST",
                url: "<%=path%>/record/recordPage",
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
                            var typeStr = "";
                            if (item.type === 1) {
                                typeStr = "入库";
                            }
                            if (item.type === 2) {
                                typeStr = "出库";
                            }
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.warehouse.warehouseName + "</td>" +
                                "<td>" + item.supplier.supplierName + "</td>" +
                                "<td>" + item.product.productName + "</td>" +
                                "<td>" + item.quantity + "</td>" +
                                "<td>" + typeStr + "</td>" +
                                "<td>" + item.product.productQuantity + "</td>" +
                                "<td>" + item.product.productUnit + "</td>" +
                                "<td>" + item.operator + "</td>" +
                                "<td>" + item.createTime + "</td></tr>"
                        });
                        $("#tbody").append(content);
                    }
                }
            });
        }

        function search() {
            recordPage();
        }

        function reset() {
            $("#query input").val("");
            recordPage();
        }

        function update(item) {
            var id = item.id;
            var productName = item.productName;
            alert(id + productName);
            $("input[name='id']").val(id);
            $("input[name='editProductName']").val(productName);
        }

        function del(id) {
            if (confirm("Are you sure to delete it")) {
                console.log(id);
                $.post("<%=path%>/product/del", {"id": id}, function (result) {
                    if (result) {
                        alert("success");
                        recordPage();
                        loadPageTool();
                    } else {
                        alert("failure");
                    }
                })
            }
        }

        function edit() {
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
                        recordPage();
                        loadPageTool();
                    } else {
                        alert("failure");
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

                    <table class="layui-table" aria-colspan="3">

                        <thead>
                        <tr>
                            <th>No</th>
                            <th>warehouse</th>
                            <th>supplier</th>
                            <th>product</th>
                            <th>quantity</th>
                            <th>type</th>
                            <th>product's quantity</th>
                            <th>product's unit</th>
                            <th>operator</th>
                            <th>create time</th>
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
    </script>
</div>

</body>
</html>
