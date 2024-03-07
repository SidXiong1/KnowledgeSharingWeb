<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>水一方-首页</title>
    <link rel="shortcut icon" href="../assets/images/logo.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">

</head>
<%--    连接数据库--%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/db02";
    String name = "root";
    String password = "123456";
    Connection conn = DriverManager.getConnection(url, name, password);
    Statement stat = conn.createStatement();
%>
<%--展示首页视频--%>
<%
    String picture[] = new String[10];
    String title[] = new String[10];
    String id[] = new String[10];
    int i = 0;
    String str2 = "select * from tb_video";    //获取全部
    ResultSet rs = stat.executeQuery(str2);  //执行查询
    while (rs.next()) {
        picture[i] = rs.getString("picture");
        title[i] = rs.getString("title");
        id[i] = rs.getString("video_id");  //获得了视频动态信息
        i++;
    }
%>
<%--展示首页文章--%>
<%
    String biaoti[] = new String[10];
    String neirong[] = new String[10];
    String biaohao[] = new String[10];
    i = 0;
    str2 = "select * from tb_passage";
    rs = stat.executeQuery(str2);
    while (rs.next()) {
        biaoti[i] = rs.getString("title");
        neirong[i] = rs.getString("content");
        biaohao[i] = rs.getString("passage_id");   //获得了文章动态信息
        i++;
    }
%>
<%--登录状态标识--%>
<%
    String on_off = "登录";
%>
<%
    Object off = session.getAttribute("off");
    if (off != null) {
        if (off.equals("yes")) {
%>
<script>alert("退出成功")</script>
<%
            request.getSession().setAttribute("off", "no");// getsession()作用为获取session，如果session不存在就新建一个
        }
    }
%>
<%
    Object on = session.getAttribute("on");
    if (on != null) {
        if (on.equals("yes")) {
            on_off = "空间";
%>
<script>alert("登录成功")</script>
<%
            request.getSession().setAttribute("on", "yes2");   //为了防止一直弹窗
        } else if (on.equals("yes2")) {
                on_off = "空间";
        }
    }
%>

<%
    stat.close();
    conn.close();     //断开服务器连接
%>
<body>
<!-- ***** Preloader Start   预加载动画***** -->
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
<!-- ***** Preloader End ***** -->

    <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start 顶部导航栏***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="../main/home.jsp" class="logo">
                            <img  src="../assets/images/logo.png" alt="logo">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Search End ***** -->
                        <div class="search-input">
                            <form id="search" action="#">
                                <input type="text" placeholder="搜一搜" id='searchText' name="searchKeyword"
                                       onkeypress="handle"/>
                                <i class="fa fa-search"></i>
                            </form>
                        </div>
                        <!-- ***** Search End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="../main/home.jsp" class="active">首页</a></li>
                            <li><a href="../function/sum_text.jsp">文章</a></li>
                            <li><a href="../function/sum_video.jsp">视频</a></li>
                            <li><a href="../home.jsp">讨论</a></li>
                            <li><a href="jump.jsp"><%=on_off%><img src="../assets/images/profile-header.jpg" alt=""></a>
                            </li>
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

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-content">

                    <!-- ***** Banner Start 封面图片***** -->
                    <div class="main-banner">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="header-text">
                                    <h6>欢迎来到水一方</h6>
                                    <h4>在这里<em>聚焦</em> 水资源动向</h4>
                                    <div class="main-button">
                                        <a href="../function/sum_video.jsp">开始关注</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ***** Banner End ***** -->

                    <!-- ***** Most Popular Start 视频排行***** -->
                    <div class="most-popular">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="heading-section">
                                    <h4><em>排行榜</em> 视频</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[0]%>" alt=""></button>
                                                <h4><%=title[0]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[0]%>">
<%--                                            通过hidden传递视频号--%>
                                        </form>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[1]%>" alt=""></button>
                                                <h4><%=title[1]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[1]%>">
                                        </form>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[2]%>" alt=""></button>
                                                <h4><%=title[2]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[2]%>">
                                        </form>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[3]%>" alt=""></button>
                                                <h4><%=title[3]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[3]%>">
                                        </form>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="item">
                                            <div class="row">
                                                <div class="col-lg-6 col-sm-6">
                                                    <form action="../function/video.jsp">
                                                        <div class="item" onclick="">
                                                            <button class="video_hidden"><img class="same_image_size" src="<%=picture[4]%>" alt=""></button>
                                                            <h4><%=title[4]%><br><span>Sandbox</span></h4>
                                                            <ul>
                                                                <li><i class="fa fa-star"></i> 4.8</li>
                                                                <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                            </ul>
                                                        </div>
                                                        <input type="hidden" name="id" value="<%=id[4]%>">
                                                    </form>
                                                </div>
                                                <div class="col-lg-6 col-sm-6">
                                                    <form action="../function/video.jsp">
                                                        <div class="item" onclick="">
                                                            <button class="video_hidden"><img class="same_image_size" src="<%=picture[5]%>" alt=""></button>
                                                            <h4><%=title[5]%><br><span>Sandbox</span></h4>
                                                            <ul>
                                                                <li><i class="fa fa-star"></i> 4.8</li>
                                                                <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                            </ul>
                                                        </div>
                                                        <input type="hidden" name="id" value="<%=id[5]%>">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[6]%>" alt=""></button>
                                                <h4><%=title[6]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[6]%>">
                                        </form>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                        <form action="../function/video.jsp">
                                            <div class="item" onclick="">
                                                <button class="video_hidden"><img class="same_image_size" src="<%=picture[7]%>" alt=""></button>
                                                <h4><%=title[7]%><br><span>Sandbox</span></h4>
                                                <ul>
                                                    <li><i class="fa fa-star"></i> 4.8</li>
                                                    <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id[7]%>">
                                        </form>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="main-button">
                                            <a href="details.html">更多视频</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ***** Most Popular End ***** -->

                    <!-- ***** Gaming Library Start 文章排行 ***** -->
                    <div class="gaming-library">
                        <div class="col-lg-12">
                            <div class="heading-section">
                                <h4><em>热度榜</em> 文章</h4>
                            </div>
                            <div class="item">
                                <form action="../function/text.jsp">
                                        <ul>
                                            <li><img  src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                                            <li><h4><%=biaoti[0]%></h4><span>Sandbox</span></li>
                                            <li><h4>发布日期</h4><span>24/08/2036</span></li>
                                            <li><h4>点赞量</h4><span>63k</span></li>
                                            <li><h4>浏览量</h4><span>77w</span></li>
                                            <button class="video_hidden">
                                            <li>
                                                <div class="main-border-button"><a>查看全文</a></div>
                                            </li>
                                            </button>
                                        </ul>
                                    <input type="hidden" name="id" value="<%=biaohao[0]%>">
                                </form>
                            </div>
                            <div class="item">
                                <form action="../function/text.jsp">
                                    <ul>
                                        <li><img  src="../assets/images/game-02.jpg" alt="" class="templatemo-item"></li>
                                        <li><h4><%=biaoti[1]%></h4><span>Sandbox</span></li>
                                        <li><h4>发布日期</h4><span>24/08/2036</span></li>
                                        <li><h4>点赞量</h4><span>63k</span></li>
                                        <li><h4>浏览量</h4><span>77w</span></li>
                                        <button class="video_hidden">
                                            <li>
                                                <div class="main-border-button"><a>查看全文</a></div>
                                            </li>
                                        </button>
                                    </ul>
                                    <input type="hidden" name="id" value="<%=biaohao[1]%>">
                                </form>
                            </div>
                            <div class="item last-item">
                                <form action="../function/text.jsp">
                                    <ul>
                                        <li><img  src="../assets/images/game-03.jpg" alt="" class="templatemo-item"></li>
                                        <li><h4><%=biaoti[2]%></h4><span>Sandbox</span></li>
                                        <li><h4>发布日期</h4><span>24/08/2036</span></li>
                                        <li><h4>点赞量</h4><span>63k</span></li>
                                        <li><h4>浏览量</h4><span>77w</span></li>
                                        <button class="video_hidden">
                                            <li>
                                                <div class="main-border-button"><a>查看全文</a></div>
                                            </li>
                                        </button>
                                    </ul>
                                    <input type="hidden" name="id" value="<%=biaohao[2]%>">
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="browse.html">更多好文</a>
                            </div>
                        </div>
                    </div>
                    <!-- ***** Gaming Library End ***** -->
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
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="../assets/js/isotope.min.js"></script>
    <script src="../assets/js/owl-carousel.js"></script>
    <script src="../assets/js/tabs.js"></script>
    <script src="../assets/js/popup.js"></script>
    <script src="../assets/js/custom.js"></script>


</body>

</html>
