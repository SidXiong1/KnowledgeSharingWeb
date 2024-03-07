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


    <title>水一方-论坛页</title>
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

<!-- ***** Preloader Start ***** -->
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


<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="./main/home.jsp" class="logo">
                        <img src="assets/images/logo.png" alt="logo">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->

                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <c:forEach items="${categoryList}" var="category">
                            <li>
                                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}"> ${category.name}</a>
                            </li>
                        </c:forEach>


                        <c:choose>
                            <c:when test="${empty loginUser}">
                                <li style="float: right"><a href="${pageContext.request.contextPath}/user/register.jsp">
                                    注册</a></li>
                                <li style="float: right"><a href="${pageContext.request.contextPath}/user/login.jsp">
                                    登录</a></li>
                            </c:when>

                            <c:otherwise>


                                <li style="float: right"><a href="#">${loginUser.username}</a></li>



                                <li >
                                                                <img src="${loginUser.img}" class="img-circle" width="13" height="26px" border-radius="13px"
                                                                     style="margin-top: 8.5px">
                                                            </li>
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
<!-- ***** Header Area End ***** -->


<%--  导航栏  --%>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">
                ${topic.title}
                <!-- ***** Banner Start ***** -->

                <div class="most-popular">
                    <div>
                        <p>
                            <span>问题描述</span>
                            ${topic.content}
                        </p>


                    </div>

                </div>
                    <p>${topic.username}</p>
                    <p>${topic.createTime}</p>

                <!-- ***** Banner End ***** -->
                <zuo>
                    <div class="main-border-button">
                        <a
                                href="${pageContext.request.contextPath}/reply.jsp?topic_id=${param.topic_id}">总座有何高见</a>

                    </div>
                </zuo>

                <!-- ***** Most Popular Start ***** -->
                <qwe>
                    <div class="most-popular">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="heading-section">
                                    <h4><em>热门</em> 讨论</h4>
                                </div>
                                <div class="row">
                                    <c:forEach items="${replyPage.list}" var="reply">
                                        <a href="#" class="forumcom">
                                            <div class="item">
                                                <fudong1>
                                                    <img src=${reply.userImg} alt="">
                                                    <h4>${reply.username} <br>${reply.createTime}</h4>
                                                </fudong1>
                                                <div class="pingluntext"> ${reply.content}</div>

                                                <ul class="fudong3">
                                                    <li><i class="fa fa-flag-checkered"></i>第 ${reply.floor} 楼</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>

                                            </div>
                                        </a>

                                    </c:forEach>
                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext">  afdaefefdsfasdfadsfasdfasdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgresdgrtsdbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>
                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext">grdgsdfgdrbgrgbgrsedgrsdbsdbresgtresdgresdgrtsdbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>
                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext">  dgresgtresdbgrsedgrsdbsdbresgtresdgresdgrtsdbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>


                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext"> dbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>
                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext"> sdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgsgsdfgdsgdfgsrbgrgbgrsedgrsdbsdbresgtresdgresdgrtsdbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>
                                    <%--                                <a href="#" class="forumcom">--%>
                                    <%--                                    <div class="item">--%>
                                    <%--                                        <fudong1>--%>
                                    <%--                                            <img src="assets/images/popular-01.jpg" alt="">--%>
                                    <%--                                            <h4>Fortnite<br>Sandbox</h4>--%>
                                    <%--                                        </fudong1>--%>
                                    <%--                                        <div class="pingluntext">  adbsdbresgtresdgresdgrtsdbrtdsgstvdbgredrevs</div>--%>
                                    <%--                                        <fudong3><ul>--%>
                                    <%--                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>--%>
                                    <%--                                            <li><i class="fa fa-eye"></i> 2.3M</li>--%>
                                    <%--                                        </ul>--%>
                                    <%--                                        </fudong3>--%>
                                    <%--                                    </div>--%>
                                    <%--                                </a>--%>


                                    <div class="col-lg-12">
                                        <div class="main-button">


                                                <a href="#">&laquo;</a>

                                                <c:if test="${replyPage.totalPage>0}">

                                                    <c:forEach var="i" begin="0" end="${replyPage.totalPage-1}" step="1">

                                                            <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${param.topic_id}&page=${i+1}">${i+1} </a>

                                                    </c:forEach>

                                                </c:if>

                                                <a href="#">&raquo;</a>



                                        </div>
                                    </div>
                                </div>
                                </forum>
                            </div>
                        </div>
                    </div>


                    <!-- ***** Most Popular End ***** -->

                        <!-- ***** Gaming Library Start ***** -->


                        <!-- ***** Gaming Library End ***** -->
            </div>
        </div>
    </div>
</div>





<%-- 分页信息 --%>



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
