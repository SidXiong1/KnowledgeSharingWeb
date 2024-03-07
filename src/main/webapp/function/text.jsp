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


    <title>水一方-文献</title>
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
%>
<%--获取id对应文章--%>
<%

    String id = request.getParameter("id");
    if(id!=null){
        request.getSession().setAttribute("video_id",id);
    }
    Object video_id = session.getAttribute("video_id");

    String str = "select * from tb_passage where passage_id = ";
    str += video_id;

    String title;
    String content;
    ResultSet rs = stat.executeQuery(str);
    rs.next();
    title = rs.getString("title");
    content = rs.getString("content");
%>
<%--获取昵称和视频ID（因为直接复用了视频评论）--%>
<%
    video_id = session.getAttribute("video_id");

    Object user_id = session.getAttribute("user_id");
    str ="select * from tb_nickname where user_id =";
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
<%       //导入10篇文章
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
                            <img src="../assets/images/logo.png" alt="logo">
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
                            <li><a href="../main/home.jsp" >首页</a></li>
                            <li><a href="sum_text.jsp" class="active">文章</a></li>
                            <li><a href="sum_video.jsp">视频</a></li>
                            <li><a href="../home.jsp">讨论</a></li>
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
                    <div><h2><%=title%></h2></div>
                    <!-- ***** Banner Start ***** -->
                    <div class="most-popular">

                        <div class="document1">
                            <%=content%>
                        </div>

                    </div>
                    <!-- ***** Banner End ***** -->
                    <div class="most-popular">
                        <form class="UploadCenter" action="text.jsp" method="get" name="sub_comment">
                            <input type="text" placeholder="总座有何高见"  class="upload_Text" name="comment">
                            <input type="submit" value="发布" class="upload_Comments" >
                        </form>
                    </div>
                    <!-- ***** Most Popular Start ***** -->
                    <qwe><div class="most-popular">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="heading-section">
                                    <h4> <em>热门</em> 评论</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[0]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[0]%><br><span><%=time[0]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[1]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[1]%><br><span><%=time[1]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[2]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[2]%><br><span><%=time[2]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[3]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[3]%><br><span><%=time[3]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6">

                                        <div class="item">
                                            <div class="row">
                                                <div class="col-lg-6 col-sm-6">
                                                        <div class="item inner-item">
                                                            <comment>
                                                                <%=comment[4]%>
                                                            </comment>
                                                            <br>

                                                            <h4><%=nickname[4]%><br><span><%=time[4]%></span></h4>
                                                            <ul>
                                                                <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                                <li><i class="fa fa-eye"></i> 2.3M</li>
                                                            </ul>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-lg-6 col-sm-6">
                                                        <div class="item">
                                                            <comment>
                                                                <%=comment[5]%>
                                                            </comment>
                                                            <br>

                                                            <h4><%=nickname[5]%><br><span><%=time[5]%></span></h4>
                                                            <ul>
                                                                <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                                <li><i class="fa fa-eye"></i> 2.3M</li>
                                                            </ul>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[6]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[6]%><br><span><%=time[6]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-lg-3 col-sm-6">
                                            <div class="item">
                                                <comment>
                                                    <%=comment[7]%>
                                                </comment>
                                                <br>

                                                <h4><%=nickname[7]%><br><span><%=time[7]%></span></h4>
                                                <ul>
                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="main-button">
                                            <a href="details.html">更多评论</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- ***** Most Popular End ***** -->
                        <qwe><div class="most-popular">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="heading-section">
                                        <h4> <em>全部</em> 评论</h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[0]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[0]%><br><span><%=time[0]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[1]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[1]%><br><span><%=time[1]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[2]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[2]%><br><span><%=time[2]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[3]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[3]%><br><span><%=time[3]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-6">

                                            <div class="item">
                                                <div class="row">
                                                    <div class="col-lg-6 col-sm-6">
                                                            <div class="item inner-item">
                                                                <comment>
                                                                    <%=comment[4]%>
                                                                </comment>
                                                                <br>

                                                                <h4><%=nickname[4]%><br><span><%=time[4]%></span></h4>
                                                                <ul>
                                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                                </ul>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-6">
                                                            <div class="item">
                                                                <comment>
                                                                    <%=comment[5]%>
                                                                </comment>
                                                                <br>

                                                                <h4><%=nickname[5]%><br><span><%=time[5]%></span></h4>
                                                                <ul>
                                                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                                                </ul>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[6]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[6]%><br><span><%=time[6]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-3 col-sm-6">
                                                <div class="item">
                                                    <comment>
                                                        <%=comment[7]%>
                                                    </comment>
                                                    <br>

                                                    <h4><%=nickname[7]%><br><span><%=time[7]%></span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                        <li><i class="fa fa-eye"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="main-button">
                                                <a href="details.html">更多评论</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <!-- ***** Gaming Library Start ***** -->
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
                                                <li><img  src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
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
                                                <li><img  src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
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
