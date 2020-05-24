<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/4/24
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>后台登录</title>

    <link rel="canonical" href="https://v4.bootcss.com/docs/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>

    <meta name="theme-color" content="#563d7c">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<div class="container">
    <form class="form-signin" action="${pageContext.request.contextPath}/account/login" method="post">
        <img class="mb-4" src="${pageContext.request.contextPath}/bootstrap/img/2.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">后台登录</h1>
        <label for="inputAddress" class="sr-only">用户名</label>
        <input type="text" name="name" id="inputAddress" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> 记住密码
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
    </form>
</div>
</body>
</html>