<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
pageContext.request.contextPath 获取上下文路径
--%>
<html>
<head>
    <title>水一方论坛</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">

    <script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>水一方-讨论</title>
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

<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>

<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="./main/home.jsp" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                        <form id="search" action="#">
                            <input type="text" placeholder="搜一搜" id='searchText' name="searchKeyword" onkeypress="handle" />
                            <i class="fa fa-search"></i>
                        </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="./main/home.jsp" >首页</a></li>
                        <li><a href="./function/sum_text.jsp">文章</a></li>
                        <li><a href="./function/sum_video.jsp">视频</a></li>
                        <li><a href="home.jsp" class="active">讨论</a></li>
                        <c:forEach items="${categoryList}" var="category">
                            <li>
                                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}"> ${category.name}</a>
                            </li>
                        </c:forEach>

<c:choose>
    <c:when test="${empty loginUser}">

        <li style="float: right"> <a href="${pageContext.request.contextPath}/user/register.jsp"> 注册</a> </li>

    </c:when>

    <c:otherwise>


        <li style="float: right"> <a href="#">${loginUser.username}</a> </li>

<%--        <li style="float: right">--%>
<%--            <img src="${loginUser.img}" class="img-circle" width="25px" height="25px" style="margin-top: 8.5px">--%>
<%--        </li>--%>

        <li style="float: right"> <a href="${pageContext.request.contextPath}/publish.jsp">发布主题</a> </li>
    </c:otherwise>
</c:choose>




                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>




























<div class="container">


<%--    顶部显示论坛分类  --%>
<%--    <ul class="nav nav-tabs">--%>
<%--        <c:forEach items="${categoryList}" var="category">--%>
<%--            <li>--%>
<%--                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}"> ${category.name}</a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>


<%--  顶部显示用户信息 --%>



    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-content">

                    <!-- ***** Featured Games Start ***** -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="featured-games header-text">
                                <div class="heading-section">
                                    <h4><em>为你</em> 推荐</h4>
                                </div>
                                <div class="owl-features owl-carousel">
<c:forEach items="${topicPage.list}" var="topic">
    <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}" >
                                    <div class="item">
                                        <div class="thumb">
                                            <img src="${topic.img}" alt="">
                                            <div class="hover-effect">
                                                <h6>${topic.pv}浏览</h6>
                                            </div>
                                        </div>
                                        <h4>${topic.title} <br><span>${topic.username}</span></h4>
                                        <ul>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                            <li> ${topic.createTime}</li>

                                        </ul>
                                    </div>
    </a>
</c:forEach>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="top-streamers">
                                <div class="heading-section">
                                    <h4><em>我在</em> 顶楼</h4>
                                </div>
                                <ul> <c:forEach items="${topicPage.list}" var="topic">
                                    <li>

                                        <img src="${topic.userImg}" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i> ${topic.username}</h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                </c:forEach>
                                </ul>
                            </div>
                        </div>
<%--                        <div class="col-lg-4">--%>
<%--                            <div class="top-streamers">--%>
<%--                                <div class="heading-section">--%>
<%--                                    <h4><em>作者</em> 周榜</h4>--%>
<%--                                </div>--%>
<%--                                <ul>--%>
<%--                                    <li>--%>
<%--                                        <span>01</span>--%>
<%--                                        <img src="assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">--%>
<%--                                        <h6><i class="fa fa-check"></i> LahutaM</h6>--%>
<%--                                        <div class="main-button">--%>
<%--                                            <a href="#">关注</a>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span>02</span>--%>
<%--                                        <img src="assets/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">--%>
<%--                                        <h6><i class="fa fa-check"></i> Kengan</h6>--%>
<%--                                        <div class="main-button">--%>
<%--                                            <a href="#">关注</a>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span>03</span>--%>
<%--                                        <img src="assets/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">--%>
<%--                                        <h6><i class="fa fa-check"></i> Areluwa</h6>--%>
<%--                                        <div class="main-button">--%>
<%--                                            <a href="#">关注</a>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span>04</span>--%>
<%--                                        <img src="assets/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">--%>
<%--                                        <h6><i class="fa fa-check"></i> Omeg</h6>--%>
<%--                                        <div class="main-button">--%>
<%--                                            <a href="#">关注</a>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <span>05</span>--%>
<%--                                        <img src="assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">--%>
<%--                                        <h6><i class="fa fa-check"></i> GangTeam</h6>--%>
<%--                                        <div class="main-button">--%>
<%--                                            <a href="#">关注</a>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                    <!-- ***** Featured Games End ***** -->

                    <!-- ***** Live Stream Start ***** -->
                    <div class="live-stream">
                        <div class="col-lg-12">
                            <div class="heading-section">
                                <h4><em>最热</em>话题</h4>
                            </div>
                        </div>
                        <div class="row">
<c:forEach items="${topicPage.list}" var="topic">
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="${topic.img}" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">${topic.createTime}</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> ${topic.pv}</a></li>
<%--                                                    <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="${topic.userImg}" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> ${topic.username}</span>
                                        <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}" >
                                        <h4>${topic.title}</h4>
                                        </a>
                                    </div>
                                </div>
                            </div>
</c:forEach>



                            <div class="col-lg-12">
                                <div class="main-button">


                                    <a href="#">&laquo;</a>

                                    <c:if test="${topicPage.totalPage>0}">

                                        <c:forEach var="i" begin="0" end="${topicPage.totalPage-1}" step="1">


                                            <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i+1}">${i+1} </a>

                                        </c:forEach>

                                    </c:if>

                                    <a href="#">&raquo;</a>



                                </div>
                            </div>


                 <br><br>

                            <div class="col-lg-12">
                                <div class="main-button">
                                    <a href="#">更多话题</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ***** Live Stream End ***** -->

                </div>
            </div>
        </div>
    </div>















</div>


<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © 2023 <a href="#">子栋的小组</a> Company. All rights reserved.
            </div>
        </div>
    </div>
</footer>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>


</body>
</html>
