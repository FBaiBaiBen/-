<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/21
  Time: 17:52
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
        .mui-icon {
            font-family: Muiicons;
            font-size: 10px;
            font-weight: normal;
            font-style: normal;
            line-height: 1;
            display: inline-block;
            text-decoration: none;
            -webkit-font-smoothing: antialiased;
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
            <form class="form-inline" id="select" action="${pageContext.request.contextPath}/staff/showCondition"
                  method="post">
                <input type="hidden" name="page" value="1">
                <div class="row w-100">
                    <div class="form-group ml-4 mr-2">
                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#Modal"
                                onclick="add()">添加员工
                        </button>
                    </div>
                    <div class="form-group mx-1">
                        <label>搜索：</label>
                        <input class="form-control" type="text" name="name" value="${staff.name}" placeholder="请输入姓名"/>
                    </div>
                    <div class="form-group mx-1">
                        <input class="form-control" type="text" name="identity" value="${staff.identity}"
                               placeholder="请输入身份证号码"/>
                    </div>
                    <div class="form-group mx-1">
                        <input class="form-control" type="text" name="phone" value="${staff.phone}"
                               placeholder="请输入手机号码"/>
                    </div>
                    <div class="form-group mx-1">
                        <select class="custom-select d-block" name="sectionId" id="sectionId">
                            <option value="">请选择部门</option>
                            <c:forEach items="${sectionList}" var="section">
                                <c:choose>
                                    <c:when test="${section.id == staff.sectionId }">
                                        <option value="${section.id}" selected>${section.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${section.id}">${section.name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group mx-1">
                        <select class="custom-select d-block" name="postId" id="postId">
                            <option value="">请选择职位</option>
                            <c:forEach items="${postList}" var="post">
                                <c:choose>
                                    <c:when test="${post.id == staff.postId }">
                                        <option value="${post.id}" selected>${post.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${post.id}">${post.name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row w-100 my-2 ">
                    <div class="mx-5 px-3"></div>
                    <div class="form-group mx-2 ml-5">
                        <select class="custom-select d-block" name="sex" id="sex">
                            <option value="">请选择性别</option>
                            <c:choose>
                                <c:when test="${staff.sex=='男' }">
                                    <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </c:when>
                                <c:when test="${staff.sex=='女' }">
                                    <option value="男">男</option>
                                    <option value="女" selected>女</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                    <div class="form-group mr-1"><input class="btn btn-primary" type="submit" value="搜索"/></div>
                </div>
            </form>
        </div>

        <div class="card-text">
            <table class="table table-hover text-center my-0" style="table-layout:fixed;">
                <thead>
                <tr>
                    <th scope="col" style='width:5%;'>序号</th>
                    <th scope="col" style='width:5%;'>姓名</th>
                    <th scope="col" style='width:5%;'>性别</th>
                    <th scope="col" style='width:10%;'>手机号码</th>
                    <th scope="col" style='width:10%;'>邮箱</th>
                    <th scope="col" style='width:5%;'>职位</th>
                    <th scope="col" style='width:5%;'>学历</th>
                    <th scope="col" style='width:10%;'>身份证号码</th>
                    <th scope="col" style='width:5%;'>部门</th>
                    <th scope="col" style='width:10%;'>联系地址</th>
                    <th scope="col" style='width:10%;'>建档日期</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${staffList }" var="staff" varStatus="i">
                    <tr>
                        <th scope="row">${i.count}</th>
                        <td>${staff.name }</td>
                        <td>${staff.sex }</td>
                        <td>${staff.phone }</td>
                        <td>${staff.mailbox }</td>
                        <td>${staff.post.name }</td>
                        <td>${staff.education }</td>
                        <td>${staff.identity }</td>
                        <td>${staff.section.name }</td>
                        <td>${staff.site }</td>
                        <td>${staff.time }</td>
                        <td>
                            <button type="button" class="btn btn-outline-primary"><a href="${pageContext.request.contextPath}/mail.jsp?mailbox=${staff.mailbox}">发邮件</a></button>
                            <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#Modal" id="${staff.id}" onclick="update(this)">修改
                            </button>
                            <a href="${pageContext.request.contextPath}/staff/delete?id=${staff.id }">
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
                <h5 class="modal-title">添加员工</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-md-8 order-md-1">
                        <form class="needs-validation" id="form" action="${pageContext.request.contextPath}/staff/add"
                              method="staff" novalidate>
                            <input type="hidden" class="id" name="id">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name">姓名</label>
                                    <input type="text" class="form-control name" name="name" id="name"
                                           placeholder="" value=""
                                           required>
                                    <div class="invalid-feedback">
                                        姓名不能为空
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone">手机号码</label>
                                    <input type="text" class="form-control phone" name="phone" id="phone"
                                           placeholder="" value=""
                                           required>
                                    <div class="invalid-feedback">
                                        手机号码不能为空
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="identity">身份证号码</label>
                                <input type="text" class="form-control identity" name="identity" id="identity" required>
                                <div class="invalid-feedback">
                                    身份证号码不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="mailbox">邮箱</label>
                                <input type="text" class="form-control mailbox" name="mailbox" id="mailbox" required>
                                <div class="invalid-feedback">
                                    邮箱不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="education">学历</label>
                                <input type="text" class="form-control education" name="education" id="education"
                                       required>
                                <div class="invalid-feedback">
                                    学历不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="site">地址</label>
                                <input type="text" class="form-control site" name="site" id="site" required>
                                <div class="invalid-feedback">
                                    地址不能为空
                                </div>
                            </div>
                            <hr class="mb-4">

                            <div class="mb-3">
                                <label for="sex">性别</label>
                                <select class="custom-select d-block sex" name="sex" id="sex" required>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <div class="invalid-feedback">
                                    性别不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="sectionId">部门</label>
                                <select class="custom-select d-block sectionId" name="sectionId" id="sectionId"
                                        required>
                                </select>
                                <div class="invalid-feedback">
                                    部门不能为空
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="postId">职位</label>
                                <select class="custom-select d-block postId" name="postId" id="postId" required>
                                </select>
                                <div class="invalid-feedback">
                                    职位不能为空
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
    function add() {
        $(".modal-title").text("添加员工");
        $.post("${pageContext.request.contextPath}/staff/toAdd", function (result) {
            var list = "";
            for (let i = 0; i < result.sectionList.length; i++) {
                list += '<option value="' + result.sectionList[i].id + '">' + result.sectionList[i].name + '</option>';
            }
            $(".sectionId").html(list);
            list = "";
            for (let i = 0; i < result.postList.length; i++) {
                list += '<option value="' + result.postList[i].id + '">' + result.postList[i].name + '</option>';
            }
            $(".postId").html(list);
            $("#form").attr("action", "${pageContext.request.contextPath}/staff/add")
        });
    }

    function update(e) {
        $(".modal-title").text("修改员工");
        var data = $(e).attr("id");
        $.post("${pageContext.request.contextPath}/staff/toUpdate", {"id": data}, function (result) {
            var list = "";
            for (let i = 0; i < result.sectionList.length; i++) {
                if (result.sectionList[i].id == result.staff.sectionId) {
                    list += '<option value="' + result.sectionList[i].id + ' selected">' + result.sectionList[i].name + '</option>';
                } else {
                    list += '<option value="' + result.sectionList[i].id + '">' + result.sectionList[i].name + '</option>';
                }
            }
            $(".sectionId").html(list);
            list = "";
            for (let i = 0; i < result.postList.length; i++) {
                if (result.postList[i].id == result.staff.postId) {
                    list += '<option value="' + result.postList[i].id + ' selected">' + result.postList[i].name + '</option>';
                } else {
                    list += '<option value="' + result.postList[i].id + '">' + result.postList[i].name + '</option>';
                }
            }
            $(".postId").html(list);
            $(".id").attr("value", result.staff.id)
            $(".name").attr("value", result.staff.name)
            $(".phone").attr("value", result.staff.phone)
            $(".mailbox").attr("value", result.staff.mailbox)
            $(".education").attr("value", result.staff.education)
            $(".identity").attr("value", result.staff.identity)
            $(".site").attr("value", result.staff.site)
            $(".sex").find("[value ='" + result.staff.sex + "']").attr("selected", "selected")
            $("#form").attr("action", "${pageContext.request.contextPath}/staff/update")
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
