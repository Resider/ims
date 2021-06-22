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
        $(function () {
            var typeVal = $("#typeVal").val();
            if (typeVal === "0") {
                $("#type_user").attr("checked", true);
            } else {
                $("type_manager").attr("checked", true);
            }
        });

        function edit() {
            if ($("input[name='type']").val() == '') {
                alert("type cannot be empty");
                return;
            }
            
            var params = {
                "id": $("input[name='id']").val(),
                "username": $("input[name='editUserName']").val(),
                "password": $("input[name='editPassword']").val(),
                "phone": $("input[name='editPhone']").val(),
                "email": $("input[name='editEmail']").val(),
                "type": $("input[name='type']:checked").val()
            }

            $.ajax({
                type: "POST",
                url: "<%=path%>/user/editUser",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.msg("success!");
                        parent.layer.close(index);
                        parent.userListAjax();
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
                <label class="layui-form-label">username</label>
                <div class="layui-input-block">
                    <input type="hidden" name="id" value="${userInfo.id}">
                    <input type="text" name="editUserName" required lay-verify="required" placeholder=""
                           value="${userInfo.username}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">password</label>
                <div class="layui-input-block">
                    <input type="password" name="editPassword" required lay-anim="required" placeholder="" value=""
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">phone</label>
                <div class="layui-input-block">
                    <input type="text" name="editPhone" required lay-anim="required" placeholder=""
                           value="${userInfo.phone}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">email</label>
                <div class="layui-input-block">
                    <input type="text" name="editEmail" required lay-anim="required" placeholder=""
                           value="${userInfo.email}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">user type</label>
                <div class="layui-input-block">
                    <input type="hidden" value="${userInfo.type}" id="typeVal">
                    <input type="radio" name="type" value="0" title="user" id="type_user">
                    <input type="radio" name="type" value="1" title="manager" id="type_manager">
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
