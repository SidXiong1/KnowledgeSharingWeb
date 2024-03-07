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


  <title>水一方-视频</title>
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
</head><%--    连接数据库--%>
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
  String str2 = "select * from tb_video";
  ResultSet rs = stat.executeQuery(str2);
  while (rs.next()) {
    picture[i] = rs.getString("picture");
    title[i] = rs.getString("title");
    id[i] = rs.getString("video_id");
    i++;
  }
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
              <li><a href="../main/home.jsp" >首页</a></li>
              <li><a href="../function/sum_text.jsp">文章</a></li>
              <li><a href="../function/sum_video.jsp" class="active">视频</a></li>
              <li><a href="../home.jsp">讨论</a></li>
              <li><a href="jump.jsp"><img src="../assets/images/profile-header.jpg" alt=""></a>
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

          <!-- ***** Featured Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="feature-banner header-text">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="../assets/videos/f59d2ac2685ebae6ad65b1ad53d7cac1.jpg" style="height: 350px;width: 350px" alt="" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-8">

                    <form action="../function/video.jsp">
                      <div class="item" onclick="">
                        <button class="video_hidden"><img class="same_image_size" style="width: 750px;height: 450px" src="../assets/videos/4.png" alt=""></button>
                        <h4><%=title[1]%><br><span>Sandbox</span></h4>
                        <ul>

                        </ul>
                      </div>
                      <input type="hidden" name="id" value="<%=id[1]%>">
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Featured End ***** -->

          <!-- ***** Details Start ***** -->
          <div class="game-details">
            <div class="row">
              <div class="col-lg-12">
                <h2>Chief Editor Recommendation</h2>
              </div>
              <div class="col-lg-12">
                <div class="content">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="left-info">
                        <div class="left">
                          <h4>Fortnite</h4>
                          <span>Sandbox</span>
                        </div>
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-tv-alt"></i> 2.3M</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="right-info">
                        <ul>
                          <li><i class="fa fa-star"></i> 4.8</li>
                          <li><i class="fa fa-eye"></i> 2.3M</li>
                          <li><i class="fa fa-comments"></i> 36</li>
                          <li><i class="fa fa-thumbs-up"></i> 50</li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-4">
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
                    <div class="col-lg-4">

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
                    <div class="col-lg-4">
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
                      </form>                    </div>
                    <div class="col-lg-12">
                      <p>水孕育了世界的生灵，它推动了我们在生命长河中的航行，是它让生命生生不息，水因此成了我们最宝贵的资源。水，让碧草变得更绿！水，让花儿竞相开放！水，让大树挺拔茁壮！水占人体的％，花要是饮水格外精神；孩子饮水格外活泼；老人饮水格外慈祥。水对人们多么重要。</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Details End ***** -->

          <!-- ***** Other Start ***** -->
          <div class="other-games">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>相关</em> 视频</h4>
                </div>
              </div>
              <div class="col-lg-6">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"> <img style="width: 100px;height:80px" src="<%=picture[0]%>" alt="" class="templatemo-item">
                      <h4><%=title[0]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[0]%>">
                  </form>
              </div>
              <div class="col-lg-6">
                <a href="#">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"><img style="width: 100px;height:80px" src="<%=picture[1]%>" alt="" class="templatemo-item">
                      <h4><%=title[1]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[1]%>">
                  </form>
                </a>
              </div>
              <div class="col-lg-6">
                <a href="#">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"><img style="width: 100px;height:80px" src="<%=picture[2]%>" alt="" class="templatemo-item">
                      <h4><%=title[2]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[2]%>">
                  </form>
                </a>
              </div>
              <div class="col-lg-6">
                <a href="#">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"><img style="width: 100px;height:80px" src="<%=picture[3]%>" alt="" class="templatemo-item">
                      <h4><%=title[3]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[3]%>">
                  </form>
                </a>
              </div>
              <div class="col-lg-6">
                <a href="#">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"><img style="width: 100px;height:80px" src="<%=picture[4]%>" alt="" class="templatemo-item">
                      <h4><%=title[4]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[4]%>">
                  </form>
                </a>
              </div>
              <div class="col-lg-6">
                <a href="#">
                  <form action="../function/video.jsp">
                    <div class="item">
                      <button class="video_hidden"><img style="width: 100px;height:80px" src="<%=picture[5]%>" alt="" class="templatemo-item">
                      <h4><%=title[5]%></h4><span>Sandbox</span>
                      <ul>
                        <li><i class="fa fa-tv-alt"></i> 4.8</li>
                        <li><i class="fa fa-star"></i> 2.3M</li>
                      </ul></button>
                    </div>
                    <input type="hidden" name="id" value="<%=id[5]%>">
                  </form>
                </a>
              </div>
            </div>
          </div>
          <!-- ***** Other End ***** -->

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
