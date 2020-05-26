<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/21
  Time: 14:32
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
        <strong style="font-size: 18px;">下载中心</strong>
    </div>
    <div class="card-body px-0 pb-0">

        <div class="card-title">
            <form class="form-inline" id="select" action="${pageContext.request.contextPath}/download/showCondition"
                  method="post">
                <input type="hidden" name="page" value="1">
                <div class="form-group ml-4 mr-2">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#Modal">添加文件</button>
                </div>
                <div class="form-group mx-1">
                    <label for="id">搜索：</label>
                    <input class="form-control" id="id" type="text" name="name" value="${name}" placeholder="请输入标题"
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
                    <th scope="col">标题</th>
                    <th scope="col">创建时间</th>
                    <th scope="col">创建人</th>
                    <th scope="col">描述</th>
                    <th scope="col">操作</th>
                    <th scope="col">下载</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${downloadList }" var="download" varStatus="i">
                    <tr>
                        <th scope="row">${i.count}</th>
                        <td>${download.name }</td>
                        <td>${download.time }</td>
                        <td>${download.account.name }</td>
                        <td>${download.description }</td>
                        <td>
                            <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#Modal" id="${download.id}" onclick="update(this)">修改
                            </button>
                            <a href="${pageContext.request.contextPath}/download/delete?id=${download.id }">
                                <button type="button" class="btn btn-outline-danger">删除</button>
                            </a>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/download/download?id=${download.id }"><i
                                class="fa fa-download fa-lg"></i></a></td>
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
                <h5 class="modal-title">添加文件</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-md-8 order-md-1">
                        <form class="needs-validation" id="form"
                              action="${pageContext.request.contextPath}/download/add"
                              method="post" novalidate>
                            <input type="hidden" class="id" name="id">
                            <input type="hidden" name="accountId" value="${admin.id}">
                            <div class="mb-3">
                                <label for="name">标题</label>
                                <input type="text" class="form-control name" name="name" id="name" required>
                                <div class="invalid-feedback">
                                    标题不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="description">描述</label>
                                <input type="text" class="form-control description" name="description" id="description"
                                       required>
                                <div class="invalid-feedback">
                                    描述不能为空
                                </div>
                            </div>
                            <hr class="mb-4">

                            <div class="mb-3">
                                <label for="file">文件上传</label>
                                <input type="file" class="form-control" id="file" name="file" onchange="upload(this)">
                                <input type="hidden" class="form-control location" name="location" id="location"
                                       required>
                                <div class="invalid-feedback">
                                    文件不能为空
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
        $(".modal-title").text("新增文件");
        $("#form").attr("action", "${pageContext.request.contextPath}/download/add")
    }

    function update(e) {
        $(".modal-title").text("修改文件");
        var data = $(e).attr("id");
        $.post("${pageContext.request.contextPath}/download/toUpdate", {"id": data}, function (result) {
            $(".id").attr("value", result.id)
            $(".state").attr("value", result.state)
            $(".name").attr("value", result.name)
            $(".description").attr("value", result.description)
            $(".location").attr("value", result.location)
            $("#form").attr("action", "${pageContext.request.contextPath}/download/update")
        });
    }

    //条件查询+分页
    function select(e) {
        $("[name ='page']").val(e);
        $("#select").submit();
    }

    //文件上传
    function upload(e) {
        var formData = new FormData();
        formData.append("file", e.files[0])
        $.ajax({
            url: "/download/upload",
            type: "POST",
            data: formData,
            processData: false,//不去处理发送的数据
            contentType: false,//不去设置Content-Type请求头
            success: function (result) {	//请求成功后要执行的代码
                $("#location").val(result)
            }
        });
    }
</script>
</body>
</html>