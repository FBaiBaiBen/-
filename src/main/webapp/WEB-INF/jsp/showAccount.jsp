<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/18
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.7.0/css/font-awesome.css"/>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/formverify.js" type="text/javascript"
            charset="utf-8"></script>
    <style type="text/css">
        ul {
            list-style: none;
        }

        li:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <strong style="font-size: 18px;">用户信息列表</strong>
    </div>
    <div class="card-body px-0 pb-0">

        <div class="card-title">
            <form class="form-inline" id="select" action="${pageContext.request.contextPath}/account/showCondition"
                  method="post">
                <input type="hidden" name="page" value="1">
                <div class="form-group ml-4 mr-2">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#Modal"
                            onclick="add()">添加用户
                    </button>
                </div>
                <div class="form-group mx-1">
                    <label for="id">搜索：</label>
                    <input class="form-control" id="id" type="text" name="name" value="${name}" placeholder="请输入用户名"
                           required/>
                </div>
                <div class="form-group"><input class="btn btn-primary" type="submit" value="搜索"/></div>
            </form>
        </div>

        <div class="card-text">
            <table class="table table-hover text-center my-0">
                <thead>
                <tr>
                    <th scope="col">序号</th>
                    <th scope="col">登录名</th>
                    <th scope="col">密码</th>
                    <th scope="col">用户名</th>
                    <th scope="col">创建时间</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${accountList }" var="account" varStatus="i">
                    <tr>
                        <th scope="row">${i.count}</th>
                        <td>${account.loginName }</td>
                        <td>${account.password }</td>
                        <td>${account.name }</td>
                        <td>${account.time }</td>
                        <td>
                            <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#Modal" id="${account.id}" onclick="update(this)">修改
                            </button>
                            <a href="${pageContext.request.contextPath}/account/delete?id=${account.id }">
                                <button type="button" class="btn btn-outline-danger">删除</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="card-footer text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:choose>
                        <c:when test="${page.prev }">
                            <li class="page-item">
                                <a class="page-link"
                                   onclick="select(${page.num-1})"><span>&laquo;</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link" href="#"><span>&laquo;</span></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.num==1 }">
                            <c:forEach begin="1" end="3" varStatus="status">
                                <c:if test="${status.first}">
                                    <li class="page-item active"><a class="page-link"
                                                                    onclick="select(${status.count})">${status.count}</a>
                                    </li>
                                </c:if>
                                <c:if test="${status.count < page.sum && status.count>1}">
                                    <li class="page-item"><a class="page-link"
                                                             onclick="select(${status.count})">${status.count}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:when test="${page.num>=2 && page.num<=sum-1 }">
                            <li class="page-item"><a class="page-link"
                                                     onclick="select(${page.num-1 })">${page.num-1 }</a>
                            </li>
                            <li class="page-item active"><a class="page-link"
                                                            onclick="select(${page.num })">${page.num }</a>
                            </li>
                            <li class="page-item"><a class="page-link"
                                                     onclick="select(${page.num+1 })">${page.num+1 }</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${page.sum==2}">
                                    <li class="page-item"><a class="page-link"
                                                             onclick="select(1)">1</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link"
                                                                    onclick="select(2)">2</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                                             onclick="select(${page.sum-2})">${page.sum-2}</a>
                                    </li>
                                    <li class="page-item"><a class="page-link"
                                                             onclick="select(${page.sum-1})">${page.sum-1}</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link"
                                                                    onclick="select(${page.sum})">${page.sum}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page.next }">
                            <li class="page-item">
                                <a class="page-link"
                                   onclick="select(${page.num+1})"><span>&raquo;</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link" href="#"><span>&raquo;</span></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </div>
</div>

<div class="modal fade" id="Modal" data-backdrop="static">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加用户</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-md-8 order-md-1">
                        <form class="needs-validation" id="form" action="${pageContext.request.contextPath}/account/add"
                              method="post" novalidate>
                            <input type="hidden" class="id" name="id">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="loginName">登录名</label>
                                    <input type="text" class="form-control loginName" name="loginName" id="loginName"
                                           placeholder="" value=""
                                           required>
                                    <div class="invalid-feedback">
                                        名字不能为空
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="password">密码</label>
                                    <input type="password" class="form-control password" name="password" id="password"
                                           placeholder="" value=""
                                           required>
                                    <div class="invalid-feedback">
                                        密码不能为空
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="name">用户名</label>
                                <input type="text" class="form-control name" name="name" id="name" required>
                                <div class="invalid-feedback">
                                    用户名不能为空
                                </div>
                            </div>
                            <hr class="mb-4">

                            <div class="tree well">
                                <label>权限设置</label>
                                <ul class="list-unstyled">
                                    <c:forEach items="${parentList}" var="parent">
                                        <li>
                                        <span>
                                            <i class="fa fa-minus-square-o fa-lg mx-2"></i>
                                            <div class="custom-control custom-checkbox"
                                                 style="display: inline-block;">
                                                <input type="checkbox" class="custom-control-input parent"
                                                       id="parent${parent.id}" name="menuId" value="${parent.id}">
                                                <label class="custom-control-label" for="parent${parent.id}"></label>
                                            </div>
                                            ${parent.name}
                                        </span>
                                            <ul>
                                                <c:forEach items="${meunList}" var="menu">
                                                    <c:if test="${menu.parentId==parent.id}">
                                                        <li>
                                                <span>
                                                    <div class="custom-control custom-checkbox ml-3"
                                                         style="display: inline-block;">
                                                        <input type="checkbox" class="custom-control-input"
                                                               id="menu${menu.id}" name="menuId" value="${menu.id}">
                                                        <label class="custom-control-label"
                                                               for="menu${menu.id}"></label>
                                                    </div>
                                                    ${menu.name}
                                                </span>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <hr class="mb-4">

                            <button class="btn btn-primary btn-lg btn-block mb-3" type="submit">提交</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function add() {
        $(".modal-title").text("添加用户");
        $.post("${pageContext.request.contextPath}/account/toAdd", function (result) {
            var menu = "";
            for (let i = 0; i < result.parentList.length; i++) {
                menu = menu + '<li data-toggle="collapse" href="#menu' + result.parentList[i].id + '" onclick="img(this)"><span><i class="fa fa-minus-square-o fa-lg mx-2"></i>' +
                    '<div class="custom-control custom-checkbox" onclick="stop(event)" style="display: inline-block;">' +
                    '<input type="checkbox" class="custom-control-input parent" onchange="a(this)" id="parent';
                menu = menu + result.parentList[i].id + '" name="menuId" value="' + result.parentList[i].id;
                menu = menu + '"><label class="custom-control-label" for="parent' + result.parentList[i].id + '"></label></div>' + result.parentList[i].name + '</span><ul>';
                for (let j = 0; j < result.menuList.length; j++) {
                    if (result.parentList[i].id == result.menuList[j].parentId) {
                        menu = menu + '<li class="collapse show" id="menu' + result.parentList[i].id + '"><span><div class="custom-control custom-checkbox ml-3" onclick="stop(event)" style="display: inline-block;">' +
                            '<input type="checkbox" class="custom-control-input" onchange="b(this)" id="menu' + result.menuList[j].id;
                        menu = menu + '" name="menuId" value="' + result.menuList[j].id + '"><label class="custom-control-label"for="menu' + result.menuList[j].id;
                        menu = menu + '"></label></div>' + result.menuList[j].name + '</span></li>';
                    }
                }
                menu = menu + '</ul></li>';
            }
            $(".list-unstyled").html(menu);
            $("#form").attr("action", "${pageContext.request.contextPath}/account/add")
        });
    }

    function update(e) {
        $(".modal-title").text("修改用户");
        var data = $(e).attr("id");
        $.post("${pageContext.request.contextPath}/account/toUpdate", {"id": data}, function (result) {
            var menu = "";
            for (let i = 0; i < result.parentList.length; i++) {
                var p = true;
                for (let n = 0; n < result.jurisdictionList.length; n++) {
                    if (result.parentList[i].id == result.jurisdictionList[n].menuId) {
                        menu = menu + '<li data-toggle="collapse" href="#menu' + result.parentList[i].id + '" onclick="img(this)"><span><i class="fa fa-minus-square-o fa-lg mx-2"></i>' +
                            '<div class="custom-control custom-checkbox" onclick="stop(event)" style="display: inline-block;">' +
                            '<input type="checkbox" class="custom-control-input parent" checked onchange="a(this)" id="parent';
                        p = false;
                        break;
                    }
                }
                if (p) {
                    menu = menu + '<li data-toggle="collapse" href="#menu' + result.parentList[i].id + '" onclick="img(this)"><span><i class="fa fa-minus-square-o fa-lg mx-2"></i>' +
                        '<div class="custom-control custom-checkbox" onclick="stop(event)" style="display: inline-block;">' +
                        '<input type="checkbox" class="custom-control-input parent" onchange="a(this)" id="parent';
                }
                menu = menu + result.parentList[i].id + '" name="menuId" value="' + result.parentList[i].id;
                menu = menu + '"><label class="custom-control-label" for="parent' + result.parentList[i].id + '"></label></div>' + result.parentList[i].name + '</span><ul>';
                for (let j = 0; j < result.menuList.length; j++) {
                    if (result.parentList[i].id == result.menuList[j].parentId) {
                        var p = true;
                        for (let n = 0; n < result.jurisdictionList.length; n++) {
                            if (result.menuList[j].id == result.jurisdictionList[n].menuId) {
                                menu = menu + '<li class="collapse show" id="menu' + result.parentList[i].id + '"><span><div class="custom-control custom-checkbox ml-3" onclick="stop(event)" style="display: inline-block;">' +
                                    '<input type="checkbox" class="custom-control-input" checked onchange="b(this)" id="menu' + result.menuList[j].id;
                                p = false;
                                break;
                            }
                        }
                        if (p) {
                            menu = menu + '<li class="collapse show" id="menu' + result.parentList[i].id + '"><span><div class="custom-control custom-checkbox ml-3" onclick="stop(event)" style="display: inline-block;">' +
                                '<input type="checkbox" class="custom-control-input" onchange="b(this)" id="menu' + result.menuList[j].id;
                        }
                        menu = menu + '" name="menuId" value="' + result.menuList[j].id + '"><label class="custom-control-label"for="menu' + result.menuList[j].id;
                        menu = menu + '"></label></div>' + result.menuList[j].name + '</span></li>';
                    }
                }
                menu = menu + '</ul></li>';
            }
            $(".list-unstyled").html(menu);
            $(".id").attr("value", result.account.id)
            $(".loginName").attr("value", result.account.loginName)
            $(".password").attr("value", result.account.password)
            $(".name").attr("value", result.account.name)
            $("#form").attr("action", "${pageContext.request.contextPath}/account/update")
        });
    }

    //全选
    function a(e) {
        if ($(e).prop("checked")) {
            $(e).parent().parent().next().find("input").prop("checked", true);
        } else {
            $(e).parent().parent().next().find("input").prop("checked", false);
        }
    }

    //勾选子选项,父选项也被勾选
    function b(e) {
        var a = false;
        $(e).parent().parent().parent().parent().find("input").each(function () {
            if ($(e).prop("checked")) {
                a = true;
            }
        })
        $(e).parent().parent().parent().parent().prev().find("input").prop("checked", a);
    }

    function stop(event) {
        event.stopPropagation(); //  阻止事件冒泡
    }

    //点击切换图标
    function img(e) {
        if ($(e).find('i').attr("class") == "fa fa-plus-square-o fa-lg mx-2") {
            $(e).find('i').attr('class', 'fa fa-minus-square-o fa-lg mx-2');
        } else {
            $(e).find('i').attr('class', 'fa fa-plus-square-o fa-lg mx-2');
        }
    }

    //条件查询+分页
    function select(e) {
        $("[name ='page']").val(e);
        $("#select").submit();
    }
</script>
</body>
</html>
