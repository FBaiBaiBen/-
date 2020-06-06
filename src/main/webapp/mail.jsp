<!--
Created by IntelliJ IDEA.
User: 驱傩
Date: 2020/5/25
Time: 11:44
To change this template use File | Settings | File Templates.
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.7.0/css/font-awesome.css"/>
    <title></title>
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

        ul {
            list-style: none;
        }

        li:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="row justify-content-center">
    <div class="col-md-8 order-md-1">
        <h4 class="mb-3">发送邮件</h4>
        <form class="needs-validation" action="${pageContext.request.contextPath}/staff/mail" method="post"
              novalidate>
            <input type="hidden" name="mailbox" value="<%=request.getParameter("mailbox")%>">

            <div class="mb-3">
                <label for="name">标题</label>
                <input type="text" class="form-control" name="name" id="name" required>
                <div class="invalid-feedback">
                    标题不能为空
                </div>
            </div>

            <div class="mb-3">
                <label for="content">内容</label>
<%--                <input type="text" class="form-control" name="content" id="content" required>--%>
                <textarea class="form-control" name="content" id="content" rows="7" required></textarea>
                <div class="invalid-feedback">
                    内容不能为空
                </div>
            </div>
            <hr class="mb-4">

            <button class="btn btn-primary btn-lg btn-block mb-3" type="submit">提交</button>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/bootstrap/js/formverify.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js" type="text/javascript"
        charset="utf-8"></script>
</body>
</html>
