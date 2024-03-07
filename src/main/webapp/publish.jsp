<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>水一方论坛</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">

    <script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>




    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>水一方-回复</title>
    <link rel="shortcut icon" href="assets/images/logo.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">


</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">

<div style="margin-top: 100px">

    <form class="form-horizontal" role="form" action="/topic?method=addTopic" method="post">




        <div class="form-group">
            <label class="col-sm-2 control-label">标题</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" name="title" placeholder="标题">
            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label">分类</label>
            <div class="col-lg-3">

                <select class="form-control" name="c_id">

                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.id}">${category.name} </option>
                    </c:forEach>
                </select>


            </div>
        </div>



        <div class="form-group">
            <label class="col-sm-2 control-label">内容</label>
            <div class="col-lg-8">

                <textarea class="form-control" name="content" placeholder="请输入内容"></textarea>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">发布主题</button>
            </div>
        </div>



    </form>

</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
