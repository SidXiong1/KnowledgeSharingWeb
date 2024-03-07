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


  <title>水一方-个人空间</title>
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
  String name = "root";
  String password = "123456";
  Connection conn = DriverManager.getConnection(url, name, password);
  Statement stat = conn.createStatement();
  ResultSet rs;
  String str;
%>
<%--获取昵称--%>
<%
  Object user_id = session.getAttribute("user_id");
  str ="select * from tb_nickname where user_id =";
  str +=user_id;
  rs = stat.executeQuery(str);
  rs.next();
  String nickname = rs.getString("user_nickname");
%>
<%--异步刷新--%>
<script language="JavaScript">
  var xmlHttp = false;
  function initAJAX(){
    if(window.XMLHttpRequest){
      xmlHttp = new XMLHttpRequest();
    }else if (window.ActiveXObject){
      try {
        xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
      }catch (e){
        try {
          xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
        }catch (e) {
          window.alert("该浏览器不支持AJAX");
        }
      }
    }
    xmlHttp.open("GET","../function/set_nickname.jsp",true)
    xmlHttp.onreadystatechange = function (){
      if(xmlHttp.readyState==4){
        infoDiv.innerHTML  = xmlHttp.responseText;
      }
    }
    xmlHttp.send();
  }
</script>
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
              <li><a href="../main/home.jsp" class="">首页</a></li>
              <li><a href="../function/sum_text.jsp">文章</a></li>
              <li><a href="../function/sum_video.jsp">视频</a></li>
              <li><a href="../home.jsp">讨论</a></li>
              <li><a href="jump.jsp" class="active"><img src="../assets/images/profile-header.jpg" alt=""></a>
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

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="../assets/images/profile.jpg" alt="" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text">
                      <a href="off.jsp" ><span>退出登录</span> </a>
                      <h4><%=nickname%></h4>

                      <div class="main-border-button" id="infoDiv">
                        <a onclick="initAJAX()">设置昵称</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <ul>
                      <li>收藏 <span>3</span></li>
                      <li>关注 <span>16</span></li>
                      <li>粉丝 <span>None</span></li>
                      <li>获赞 <span>29</span></li>
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="heading-section">
                            <h4><em>内容</em> 动态</h4>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="../assets/images/clip-01.jpg" alt="" style="border-radius: 23px;">
                              <a href="#" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>蔚蓝色</h4>
                              <span><i class="fa fa-eye"></i> 250</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="../assets/images/clip-02.jpg" alt="" style="border-radius: 23px;">
                              <a href="#" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>海洋污染</h4>
                              <span><i class="fa fa-eye"></i> 183</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="../assets/images/clip-03.jpg" alt="" style="border-radius: 23px;">
                              <a href="#" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>原油泄漏</h4>
                              <span><i class="fa fa-eye"></i> 141</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="../assets/images/clip-04.jpg" alt="" style="border-radius: 23px;">
                              <a href="#" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>海洋垃圾</h4>
                              <span><i class="fa fa-eye"></i> 91</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="main-button">
                            <a href="#">更多动态</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>投稿</em> 内容</h4>
              </div>
              <div class="item">
                <ul>
                  <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Dota 2</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>24/08/2036</span></li>
                  <li><h4>Hours Played</h4><span>634 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">查看投稿</a></div></li>
                </ul>
              </div>
              <div class="item">
                <ul>
                  <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Fortnite</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>22/06/2036</span></li>
                  <li><h4>Hours Played</h4><span>745 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">查看投稿</a></div></li>
                </ul>
              </div>
              <div class="item last-item">
                <ul>
                  <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>CS-GO</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>21/04/2022</span></li>
                  <li><h4>Hours Played</h4><span>632 H 46 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">查看投稿</a></div></li>
                </ul>
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
