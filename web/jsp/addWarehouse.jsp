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
        function edit() {
            if ($("input[name='editWarehouseName']").val() == '') {
                alert("warehouse's name cannot be empty");
                return;
            }
            if ($("input[name='editWarehouseAddress']").val() == '') {
                alert("the address cannot be empty");
                return;
            }
            var params = {
                "id": $("input[name='id']").val(),
                "warehouseName": $("input[name='editWarehouseName']").val(),
                "address": $("input[name='editWarehouseAddress']").val(),
            }

            $.ajax({
                type: "POST",
                url: "<%=path%>/warehouse/editWarehouse",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.msg("success!");
                        parent.layer.close(index);
                        parent.warehouseListAjax();
                    } else {
                        layer.msg("failure!");
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="layui-form-item">
    <label class="layui-form-label"></label>
    <div class="layui-input-block">
        <form class="layui-form" action="javascript:;">
            <div class="layui-form-item">
                <label class="layui-form-label">warehouse's Name</label>
                <div class="layui-input-block">
                    <input type="hidden" name="id"  value="${warehouse.id}">
                    <input type="text" name="editWarehouseName" required lay-verify="required" placeholder="" value="${warehouse.warehouseName}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">warehouse's Address</label>
                <div class="layui-input-block">
                    <input type="text" name="editWarehouseAddress" required lay-anim="required" placeholder=""  value="${warehouse.address}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" type="button" onclick="edit()">submit</button>
                    <button type="reset" class="layui-btn layui-btn-primary">reset</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
