<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>水一方-讨论</title>
    <link rel="shortcut icon" href="../assets/images/logo.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!--
    
    TemplateMo 579 Cyborg Gaming
    
    https://templatemo.com/tm-579-cyborg-gaming
    
    -->
</head>
<%--    连接数据库--%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/db02";
    String name="root";
    String password = "123456";
    Connection conn = DriverManager.getConnection(url,name,password);
    Statement stat = conn.createStatement();
    ResultSet rs;
%>
<%--获取视频--%>
<%

    String id = request.getParameter("id");
    if(id!=null){
        request.getSession().setAttribute("video_id",id);
    }
    Object video_id = session.getAttribute("video_id");

%>
<%--获取昵称和视频ID--%>
<%
    video_id = session.getAttribute("video_id");

    Object user_id = session.getAttribute("user_id");
     String str ="select * from tb_nickname where user_id =";
    str +=user_id;
    rs = stat.executeQuery(str);
    rs.next();
    String user_nickname = rs.getString("user_nickname");
%>
<%--录入评论信息--%>
<%
    String com = request.getParameter("comment");
    if(com!=null&&com!=""){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        str ="insert into tb_vi_comment values (";
        str += video_id;
        str +=",'";
        str +=user_nickname;
        str +="','";
        str += request.getParameter("comment");
        str +="','";
        str += format.format(new Date());
        str +="')";
//    System.out.println("str="+str);
        stat.executeUpdate(str);
    }
%>
<%--获取评论--%>
<%
    id = request.getParameter("id");
    if(id!=null){
        request.getSession().setAttribute("video_id",id);
    }
    str = "select * from tb_vi_comment where video_id =";
    str += video_id;
//    System.out.println("str="+str);
    rs = stat.executeQuery(str);
    int i = -1;
    String comment[] = new String[8];
    String nickname[] = new String[8];
    String time[] = new String[8];
    while (rs.next()){
        i++;
    }
    rs = stat.executeQuery(str);
    while (i>7){
        rs.next();
        i--;
    }
    while (rs.next()){
        comment[i] = rs.getString("comment");
        nickname[i] = rs.getString("user_nickname");
        time[i] = rs.getString("time");
        i--;
    }
%>
<%
    String biaoti[] = new String[10];
    String neirong[] = new String[10];
    String biaohao[] = new String[10];
    i = 0;
    String str2 = "select * from tb_passage";
    rs = stat.executeQuery(str2);
    while (rs.next()) {
        biaoti[i] = rs.getString("title");
        neirong[i] = rs.getString("content");
        biaohao[i] = rs.getString("passage_id");
        i++;
    }
%>
<%
    stat.close();
    conn.close();
%>
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
    <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="../main/home.jsp" class="logo">
                            <img src="../assets/images/logo.png" alt="">
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
                            <li><a href="../main/home.jsp">首页</a></li>
                            <li><a href="sum_text.jsp" class="active">文章</a></li>
                            <li><a href="sum_video.jsp">视频</a></li>
                            <li><a href="../home.jsp" >讨论</a></li>
                            <li><a href="../main/user.jsp">空间<img src="../assets/images/profile-header.jpg" alt=""></a></li>
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

                    <!-- ***** Featured Games Start ***** -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="featured-games header-text">
                                <div class="heading-section">
                                    <h4><em>为你</em> 推荐</h4>
                                </div>
                                <div class="owl-features owl-carousel">
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-01.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[0]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[0]%><br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-02.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[1]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[1]%><br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-03.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[2]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[2]%><br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-01.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[3]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[3]%>br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-02.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[4]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[4]%><br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <form action="../function/text.jsp">
                                                <div class="item" onclick="">
                                                    <button class="video_hidden"><img src="../assets/images/featured-03.jpg" alt=""></button>
                                                </div>
                                                <input type="hidden" name="id" value="<%=biaohao[5]%>">
                                            </form>
                                            <div class="hover-effect">
                                                <h6>2.4K 浏览</h6>
                                            </div>
                                        </div>
                                        <h4><%=biaoti[5]%><br><span>249K Downloads</span></h4>
                                        <ul>
                                            <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                            <li><i class="fa fa-comment-alt"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="top-streamers">
                                <div class="heading-section">
                                    <h4><em>作者</em> 周榜</h4>
                                </div>
                                <ul>
                                    <li>
                                        <span>01</span>
                                        <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i><%=nickname[0]%></h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                    <li>
                                        <span>02</span>
                                        <img src="../assets/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i><%=nickname[1]%></h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                    <li>
                                        <span>03</span>
                                        <img src="../assets/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i> <%=nickname[2]%></h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                    <li>
                                        <span>04</span>
                                        <img src="../assets/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i> <%=nickname[3]%></h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                    <li>
                                        <span>05</span>
                                        <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                                        <h6><i class="fa fa-check"></i> <%=nickname[4]%></h6>
                                        <div class="main-button">
                                            <a href="#">关注</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
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
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-05.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> Kengan Omeg</span>
                                        <h4><%=biaoti[0]%></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-06.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> LahutaMalc</span>
                                        <h4><%=biaoti[1]%></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-07.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> Areluwa</span>
                                        <h4><%=biaoti[2]%></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-08.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> NewGangTeam</span>
                                        <h4><%=biaoti[3]%></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-07.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> Kengan Omeg</span>
                                        <h4><%=biaoti[4]%>></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-08.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-02.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> LahutaMalc</span>
                                        <h4><%=biaoti[5]%>></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-05.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-03.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> Areluwa</span>
                                        <h4><%=biaoti[6]%>></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <div class="thumb">
                                        <img src="../assets/images/stream-06.jpg" alt="">
                                        <div class="hover-effect">
                                            <div class="content">
                                                <div class="live">
                                                    <a href="#">HOT</a>
                                                </div>
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
                                                    <li><a href="#"><i class="fa fa-thumbs-up"></i> 1k</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar">
                                            <img src="../assets/images/avatar-04.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                                        </div>
                                        <span><i class="fa fa-check"></i> NewGangTeam</span>
                                        <h4><%=biaoti[7]%></h4>
                                    </div>
                                </div>
                            </div>
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
