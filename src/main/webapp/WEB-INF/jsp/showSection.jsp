<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/21
  Time: 17:38
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
        <strong style="font-size: 18px;">部门信息列表</strong>
    </div>
    <div class="card-body px-0 pb-0">

        <div class="card-title">
            <form class="form-inline" id="select" action="${pageContext.request.contextPath}/section/showCondition"
                  method="post">
                <input type="hidden" name="page" value="1">
                <div class="form-group ml-4 mr-2">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#Modal"
                            onclick="add(this)">添加部门
                    </button>
                </div>
                <div class="form-group mx-1">
                    <label>搜索：</label>
                    <input class="form-control" type="text" name="name" value="${section.name}" placeholder="请输入部门名称"/>
                </div>
                <div class="form-group"><input class="btn btn-primary" type="submit" value="搜索"/></div>
            </form>
        </div>

        <div class="card-text">
            <table class="table table-hover text-center my-0">
                <thead>
                <tr>
                    <th scope="col">序号</th>
                    <th scope="col">部门名称</th>
                    <th scope="col">详细信息</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sectionList }" var="section" varStatus="i">
                    <tr>
                        <th scope="row">${i.count}</th>
                        <td>${section.name }</td>
                        <td>${section.details }</td>
                        <td>
                            <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#Modal" id="${section.id}" onclick="update(this)">修改
                            </button>
                            <a href="${pageContext.request.contextPath}/section/delete?id=${section.id }">
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
                <h5 class="modal-title">添加部门</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-md-8 order-md-1">
                        <form class="needs-validation" id="form" action="${pageContext.request.contextPath}/section/add"
                              method="section" novalidate>
                            <input type="hidden" class="id" name="id">
                            <div class="mb-3">
                                <label for="name">部门名称</label>
                                <input type="text" class="form-control name" name="name" id="name" required>
                                <div class="invalid-feedback">
                                    部门不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="details">详细信息</label>
                                <input type="text" class="form-control details" name="details" id="details" required>
                                <div class="invalid-feedback">
                                    信息不能为空
                                </div>
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
    function add(e) {
        $(".modal-title").text("添加部门");
        $("#form").attr("action", "${pageContext.request.contextPath}/section/add")
    }

    function update(e) {
        $(".modal-title").text("修改部门");
        var data = $(e).attr("id");
        $.post("${pageContext.request.contextPath}/section/toUpdate", {"id": data}, function (result) {
            $(".id").attr("value", result.id)
            $(".name").attr("value", result.name)
            $(".details").attr("value", result.details)
            $("#form").attr("action", "${pageContext.request.contextPath}/section/update")
        });
    }

    //条件查询+分页
    function select(e) {
        $("[name ='page']").val(e);
        $("#select").submit();
    }
</script>
</body>
</html>