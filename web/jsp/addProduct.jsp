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
            if ($("input[name='editProductName']").val() == '') {
                alert("product's name cannot be empty");
                return;
            }
            var params = {
                "id": $("input[name='id']").val(),
                "productName": $("input[name='editProductName']").val(),
                "productType": $("input[name='editProductType']").val(),
                "productDesc": $("input[name='editProductDesc']").val(),
                "productUnit": $("input[name='editProductUnit']").val(),
                "productQuantity": $("input[name='editProductQuantity']").val(),
                "productPrice": $("input[name='editProductPrice']").val(),
                "productSpec": $("input[name='editProductSpec']").val()
            }

            $.ajax({
                type: "POST",
                url: "<%=path%>/product/editProduct",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.msg("success!");
                        parent.layer.close(index);
                        parent.productListAjax();
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
                <label class="layui-form-label">Production's Name</label>
                <div class="layui-input-block">
                    <input type="hidden" name="id" value="${product.id}">
                    <input type="text" name="editProductName" required lay-verify="required" placeholder="" value="${product.productName}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's Type</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductType" required lay-anim="required" placeholder="" value="${product.productType}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's Description</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductDesc" required lay-anim="required" placeholder="" value="${product.productDesc}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's Unit</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductUnit" required lay-anim="required" placeholder="" value="${product.productUnit}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's Quantity</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductQuantity" required lay-anim="required" placeholder="" value="${product.productQuantity}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's Price</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductPrice" required lay-anim="required" placeholder="" value="${product.productPrice}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">Production's SPEC</label>
                <div class="layui-input-block">
                    <input type="text" name="editProductSpec" required lay-anim="required" placeholder="" value="${product.productSpec}"
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
