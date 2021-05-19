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
    <title>查询列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="../../static/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        // jquery 开局执行的方法
        var pageIndex = 0;
        $(function () {
            supplierListAjax();
        });

        function supplierListAjax(index) {
            var supplierName = $("input[name='supplierName']").val();
            var minCreateTime = $("input[name='minCreateTime']").val();
            var maxCreateTime = $("input[name='maxCreateTime']").val();
            var params = {
                "supplierName": supplierName,
                "minCreateTime": minCreateTime,
                "maxCreateTime": maxCreateTime,
                "pageIndex": index
            }
            $.ajax({
                type: "POST",
                url: "<%=path%>/supplier/supplierListAjax",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result.data != null) {
                        // 当前页数
                        pageIndex = result.pageIndex;
                        // 总条数和总页数
                        $("#pageCount").html(result.pageCount);
                        $("#pageSum").html(result.pageSum);

                        $("#tbody").html("");
                        var content = "";
                        $.each(result.data, function (index, item) {
                            content += "<tr><td>" + (index + 1) + "</td>" +
                                "<td>" + item.supplierName + "</td>" +
                                "<td>" + item.createTime + "</td>" +
                                "<td>" +
                                "<button type='button' onclick='del(" + JSON.stringify(item.id) + ")'>删除</button>" +
                                "&nbsp;<button type='button' onclick='update("+JSON.stringify(item)+")'>修改</button>" +
                                "</td></tr>";
                        });
                        $("#tbody").append(content);
                    }
                }
            });
        }

        function reflush() {
            $("#query input").val("");      // 将查询框里的查询条件清空
            supplierListAjax();
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
            alert( $("input[name='id']").val()+$("input[name='editSupplierName']").val());
            $.ajax({
                type: "POST",
                url: "<%=path%>/supplier/editSupplier",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(params),
                success: function (result) {
                    if (result != null && result) {
                        supplierListAjax();
                    } else {
                        alert("新增或修改供应商信息失败");
                    }
                }
            });
        }

        function clearEditForm() {
            $("#edit input").val("");
        }

        function prePage() {
            // 上一页的页码
            var index = pageIndex - 1;
            supplierListAjax(index);
        }

        function nextPage() {
            // 下一页的页码
            var index = pageIndex + 1;
            supplierListAjax(index);
        }
    </script>
</head>
<body>
<div>
    <div align="center" id="query">
        <p>查询</p>
        <input name="supplierName" type="text" value="${query.supplierName}"/>
        &nbsp;&nbsp;
        <input name="minCreateTime" type="date" value="${query.minCreateTime}"/>
        &nbsp;-&nbsp;
        <input name="maxCreateTime" type="date" value="${query. maxCreateTime}"/>
        <button type="button" onclick="supplierListAjax()">查询</button>
        <button type="button" onclick="reflush()">重置</button>
    </div>

    <br/>
    <table align="center">
        <thead>
        <tr>
            <th>编号</th>
            <th>供应商名称</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tbody">

        </tbody>
        <tr>
            <td><a href="javascript:;" onclick="prePage()">上一页</a></td>
            <td><a href="javascript:;" onclick="nextPage()">下一页</a></td>
            <td>共<span id="pageCount"></span>页</td>
            <td>共<span id="pageSum"></span>条</td>
        </tr>
    </table>
    <br/>
    <div align="center" id="edit">
        <p>新增、修改</p>
        <table>
            <tr>
                <td>id</td>
                <td><input name="id" type="text" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>供应商姓名</td>
                <td><input name="editSupplierName" type="text"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" onclick="edit()">提交</button>
                    &nbsp;
                    <button type="button" onclick="clearEditForm()">重置</button>
                </td>

            </tr>


        </table>
    </div>
</div>

</body>
</html>
