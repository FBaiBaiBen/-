<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/17
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>About · Bootstrap</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>
    <link href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/docs.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.7.0/css/font-awesome.css"/>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?fc4ecdb3b7e797fdd7347e29dbec6802";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

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
<a class="skippy sr-only sr-only-focusable" href="#content">
    <span class="skippy-text">Skip to main content</span>
</a>

<header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar bg-dark">
    <a class="" href="/" aria-label="Bootstrap"><img src="${pageContext.request.contextPath}/bootstrap/img/2.png"
                                                     width="50" height="50"
                                                     class="d-block"></a>
    <h5 class="text-white mx-3 my-2">后台管理系统</h5>
    <div class="navbar-nav-scroll">
        <ul class="navbar-nav bd-navbar-nav flex-row">
            <li class="nav-item">
                <a class="nav-link" href="">首页</a>
            </li>
    </div>
    <ul class="navbar-nav ml-md-auto">
        <li class="nav-item dropdown">
            <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                设置
            </a>
            <div class="dropdown-menu dropdown-menu-md-right" aria-labelledby="bd-versions">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/" data-toggle="modal"
                   data-target="#Modal" onclick="update(this)">修改信息</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/login.jsp">切换用户</a>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link p-2" href="https://github.com/twbs/bootstrap" target="_blank" rel="noopener"
               aria-label="GitHub">
                <svg
                        xmlns="http://www.w3.org/2000/svg" class="navbar-nav-svg" viewBox="0 0 512 499.36" role="img"
                        focusable="false">
                    <title>GitHub</title>
                    <path fill="currentColor" fill-rule="evenodd"
                          d="M256 0C114.64 0 0 114.61 0 256c0 113.09 73.34 209 175.08 242.9 12.8 2.35 17.47-5.56 17.47-12.34 0-6.08-.22-22.18-.35-43.54-71.2 15.49-86.2-34.34-86.2-34.34-11.64-29.57-28.42-37.45-28.42-37.45-23.27-15.84 1.73-15.55 1.73-15.55 25.69 1.81 39.21 26.38 39.21 26.38 22.84 39.12 59.92 27.82 74.5 21.27 2.33-16.54 8.94-27.82 16.25-34.22-56.84-6.43-116.6-28.43-116.6-126.49 0-27.95 10-50.8 26.35-68.69-2.63-6.48-11.42-32.5 2.51-67.75 0 0 21.49-6.88 70.4 26.24a242.65 242.65 0 0 1 128.18 0c48.87-33.13 70.33-26.24 70.33-26.24 14 35.25 5.18 61.27 2.55 67.75 16.41 17.9 26.31 40.75 26.31 68.69 0 98.35-59.85 120-116.88 126.32 9.19 7.9 17.38 23.53 17.38 47.41 0 34.22-.31 61.83-.31 70.23 0 6.85 4.61 14.81 17.6 12.31C438.72 464.97 512 369.08 512 256.02 512 114.62 397.37 0 256 0z"/>
                </svg>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link p-2" href="https://twitter.com/getbootstrap" target="_blank" rel="noopener"
               aria-label="Twitter">
                <svg
                        xmlns="http://www.w3.org/2000/svg" class="navbar-nav-svg" viewBox="0 0 512 416.32" role="img"
                        focusable="false">
                    <title>Twitter</title>
                    <path fill="currentColor"
                          d="M160.83 416.32c193.2 0 298.92-160.22 298.92-298.92 0-4.51 0-9-.2-13.52A214 214 0 0 0 512 49.38a212.93 212.93 0 0 1-60.44 16.6 105.7 105.7 0 0 0 46.3-58.19 209 209 0 0 1-66.79 25.37 105.09 105.09 0 0 0-181.73 71.91 116.12 116.12 0 0 0 2.66 24c-87.28-4.3-164.73-46.3-216.56-109.82A105.48 105.48 0 0 0 68 159.6a106.27 106.27 0 0 1-47.53-13.11v1.43a105.28 105.28 0 0 0 84.21 103.06 105.67 105.67 0 0 1-47.33 1.84 105.06 105.06 0 0 0 98.14 72.94A210.72 210.72 0 0 1 25 370.84a202.17 202.17 0 0 1-25-1.43 298.85 298.85 0 0 0 160.83 46.92"/>
                </svg>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link p-2" href="https://bootstrap-slack.herokuapp.com/" target="_blank" rel="noopener"
               aria-label="Slack">
                <svg
                        xmlns="http://www.w3.org/2000/svg" class="navbar-nav-svg" viewBox="0 0 512 512" role="img"
                        focusable="false">
                    <title>Slack</title>
                    <path fill="currentColor" d="M210.787 234.832l68.31-22.883 22.1 65.977-68.309 22.882z"/>
                    <path fill="currentColor"
                          d="M490.54 185.6C437.7 9.59 361.6-31.34 185.6 21.46S-31.3 150.4 21.46 326.4 150.4 543.3 326.4 490.54 543.34 361.6 490.54 185.6zM401.7 299.8l-33.15 11.05 11.46 34.38c4.5 13.92-2.87 29.06-16.78 33.56-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18l-11.46-34.38-68.36 22.92 11.46 34.38c4.5 13.92-2.87 29.06-16.78 33.56-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18l-11.46-34.43-33.15 11.05c-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18c-4.5-13.92 2.87-29.06 16.78-33.56l33.12-11.03-22.1-65.9-33.15 11.05c-2.87.82-6.14 1.64-9 1.23a27.32 27.32 0 0 1-24.56-18c-4.48-13.93 2.89-29.07 16.81-33.58l33.15-11.05-11.46-34.38c-4.5-13.92 2.87-29.06 16.78-33.56s29.06 2.87 33.56 16.78l11.46 34.38 68.36-22.92-11.46-34.38c-4.5-13.92 2.87-29.06 16.78-33.56s29.06 2.87 33.56 16.78l11.47 34.42 33.15-11.05c13.92-4.5 29.06 2.87 33.56 16.78s-2.87 29.06-16.78 33.56L329.7 194.6l22.1 65.9 33.15-11.05c13.92-4.5 29.06 2.87 33.56 16.78s-2.88 29.07-16.81 33.57z"/>
                </svg>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link p-2" href="https://opencollective.com/bootstrap/" target="_blank" rel="noopener"
               aria-label="Open Collective">
                <svg
                        xmlns="http://www.w3.org/2000/svg" fill="currentColor" fill-rule="evenodd"
                        class="navbar-nav-svg" viewBox="0 0 40 41"
                        role="img" focusable="false">
                    <title>Open Collective</title>
                    <path fill-opacity=".4"
                          d="M32.8 21c0 2.4-.8 4.9-2 6.9l5.1 5.1c2.5-3.4 4.1-7.6 4.1-12 0-4.6-1.6-8.8-4-12.2L30.7 14c1.2 2 2 4.3 2 7z"/>
                    <path d="M20 33.7a12.8 12.8 0 0 1 0-25.6c2.6 0 5 .7 7 2.1L32 5a20 20 0 1 0 .1 31.9l-5-5.2a13 13 0 0 1-7 2z"/>
                </svg>
            </a>
        </li>
    </ul>

    <a class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
       href="${pageContext.request.contextPath}/logout">退出</a>
</header>

<div class="container-fluid">
    <div class="row flex-xl-nowrap">
        <div class="col-md-3 col-xl-2 bd-sidebar bg-light">
            <form role="search" class="bd-search d-flex align-items-center">
                <input type="search" class="form-control" id="search-input" placeholder="搜索" aria-label="Search for..."
                       autocomplete="off" data-docs-version="4.4">
                <button class="btn btn-link bd-search-docs-toggle d-md-none p-0 ml-3" type="button"
                        data-toggle="collapse"
                        data-target="#bd-docs-nav" aria-controls="bd-docs-nav" aria-expanded="false"
                        aria-label="Toggle docs navigation">
                    <svg
                            xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" role="img"
                            focusable="false">
                        <title>Menu</title>
                        <path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"
                              d="M4 7h22M4 15h22M4 23h22"/>
                    </svg>
                </button>
            </form>

            <nav class="collapse bd-links card py-0 border-0" id="bd-docs-nav" aria-label="Main navigation">
                <div class="bd-toc-item">
                    <c:forEach items="${parentList}" var="parent">
                        <div class="card-header d-flex justify-content-between" data-toggle="collapse"
                             href="#parent${parent.id}">
                                ${parent.name}
                            <img src="${pageContext.request.contextPath}/icons-1.0.0-alpha3/icons/caret-right-fill.svg"/>
                        </div>
                        <ul class="nav list-group list-group-item collapse" id="parent${parent.id}">
                            <c:forEach items="${menuList}" var="menu">
                                <c:if test="${menu.parentId==parent.id}">
                                    <li><a href="${pageContext.request.contextPath}/${menu.location}?page=1"
                                           target="mainpael">${menu.name}</a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <main class="col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content border" role="main">
            <iframe name="mainpael" src="${pageContext.request.contextPath}/chart.jsp" width="100%" frameborder="0" height="100%" scrolling="auto"></iframe>
        </main>
    </div>
</div>

<div class="modal fade" id="Modal" data-backdrop="static">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改用户</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-md-8 order-md-1">
                        <form class="needs-validation" id="form" action="${pageContext.request.contextPath}/account/update"
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

<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>
<script>
    $('.bd-toc-item>ul').on('show.bs.collapse', function () {
        $(this).prev().children("img").attr("src", "${pageContext.request.contextPath}/icons-1.0.0-alpha3/icons/caret-down-fill.svg");
    });
    $('.bd-toc-item>ul').on('hide.bs.collapse', function () {
        $(this).prev().children("img").attr("src", "${pageContext.request.contextPath}/icons-1.0.0-alpha3/icons/caret-right-fill.svg");
    });

    function update(e) {
        $.post("${pageContext.request.contextPath}/account/toUpdate", {"id": ${admin.id}}, function (result) {
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
        });
    }
</script>
</body>
</html>
