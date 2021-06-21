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
            reloadSelect();
        });

        function reloadSelect() {
            var productList = "";
            var warehouseList = "";
            var supplierList = "";
            layui.use(['dropdown', 'util', 'layer', 'table'], function () {
                var dropdown = layui.dropdown
                    , util = layui.util
                    , layer = layui.layer
                    , table = layui.table
                    , $ = layui.jquery;

                $.ajax({
                    type: "POST",
                    url: "<%=path%>/product/selectList",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    data: "",
                    success: function (result) {
                        if (result != null && result) {
                            productList = result;
                        } else {
                            layer.msg("failure!");
                        }
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "<%=path%>/warehouse/selectList",
                    contentType: "application/jsono",
                    dataType: "json",
                    async: false,
                    data: "",
                    success: function (result) {
                        if (result != null && result) {
                            warehouseList = result;
                        } else {
                            layer.msg("failure！");
                        }
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "<%=path%>/supplier/selectList",
                    contentType: "application/jsono",
                    dataType: "json",
                    async: false,
                    data: "",
                    success: function (result) {
                        if (result != null && result) {
                            supplierList = result;
                        } else {
                            layer.msg("failure！");
                        }
                    }
                });

                // product
                dropdown.render({
                    elem: '#productSelect'
                    , data: productList
                    , click: function (obj) {
                        this.elem.val(obj.title);
                        $("#productId").val(obj.id);
                    }
                    , style: 'width: 235px;'
                });

                // warehouse
                dropdown.render({
                    elem: '#warehouseSelect'
                    , data: warehouseList
                    , click: function (obj) {
                        this.elem.val(obj.title);
                        $("#warehouseId").val(obj.id);
                    }
                    , style: 'width: 235px;'
                });

                // supplier
                dropdown.render({
                    elem: '#supplierSelect'
                    , data: supplierList
                    , click: function (obj) {
                        this.elem.val(obj.title);
                        $("#supplierId").val(obj.id);
                    }
                    , style: 'width: 235px;'
                });
            });
        }

        function add() {
            var productId = $("#productId").val();
            var warehouseId = $("input[name='warehouseId']").val();
            var supplierId = $("input[name='supplierId']").val();
            var quantity = $("input[name='quantity']").val();
            var operatorId = $("input[name='operatorId']").val();
            var type = $("input[name='type']:checked").val();
          
            if (productId == '') {
                alert("product cannot be empty");
                return;
            }
            if (warehouseId == '') {
                alert("warehouse cannot be empty");
                return;
            }
            if (supplierId == '') {
                alert("supplier cannot be empty");
                return;
            }
            if (quantity == '') {
                alert("quantity cannot be empty");
                return;
            }
            if (operatorId == '') {
                alert("operatorId cannot be empty");
                return;
            }
            if (type == '') {
                alert("type cannot be empty");
                return;
            }
            var params = {
                "productId": productId,
                "warehouseId": warehouseId,
                "supplierId": supplierId,
                "quantity": quantity,
                "operatorId": operatorId,
                "type": type
            }

            $.ajax({
                type: "POST",
                url: "<%=path%>/record/enter",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        layer.msg("success！");
                    } else {
                        layer.msg("failure！");
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
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <div class="layui-input-block">
                            <form class="layui-form" action="javascript:;">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">Product</label>
                                    <div class="layui-input-block">
                                        <div class="layui-inline" style="width: 235px;">
                                            <input name="productName" placeholder="在输入框提供一些常用的选项" class="layui-input"
                                                   readonly="readonly" id="productSelect">
                                            <input name="productId" type="hidden" id="productId"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">Warehouse</label>
                                    <div class="layui-input-block">
                                        <div class="layui-inline" style="width: 235px;">
                                            <input name="warehouseName" placeholder="在输入框提供一些常用的选项"
                                                   class="layui-input" readonly="readonly"
                                                   id="warehouseSelect">
                                            <input type="hidden" name="warehouseId" id="warehouseId"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">Supplier</label>
                                    <div class="layui-input-block">
                                        <div class="layui-inline" style="width: 235px;">
                                            <input name="supplierName" placeholder="在输入框提供一些常用的选项"
                                                   class="layui-input" readonly="readonly"
                                                   id="supplierSelect">
                                            <input type="hidden" name="supplierId" id="supplierId"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">Quantity</label>
                                    <div class="layui-input-block" style="width: 235px;">
                                        <input type="number" name="quantity" required lay-anim="required" placeholder=""
                                               autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">操作</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="type" value="1" title="入库">
                                        <input type="radio" name="type" value="2" title="出库">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">operator</label>
                                    <div class="layui-input-block" style="width: 235px;">
                                        <input type="text" name="operator" required lay-anim="required" placeholder=""
                                               autocomplete="off" class="layui-input" readonly="readonly"
                                               style="color: grey;"
                                               value="${sessionScope.user.username}">
                                        <input type="hidden" name="operatorId" id="operatorId"
                                               value="${sessionScope.user.id}"/>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" type="button" onclick="add()">submit</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">reset</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

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
            }
        };

    </script>

</div>


</body>
</html>
