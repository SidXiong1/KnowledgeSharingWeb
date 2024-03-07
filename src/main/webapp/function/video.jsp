<%@ page import="java.sql.DriverManager" %>

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


  <title>水一方-播放页</title>
  <link rel="shortcut icon" href="../assets/images/logo.ico" type="image/x-icon">
  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="../assets/css/fontawesome.css">
  <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
  <link rel="stylesheet" href="../assets/css/owl.css">
  <link rel="stylesheet" href="../assets/css/animate.css">

</head>
<%--异步刷新--%>
<script language="JavaScript">
  var xmlHttp = false;
  function initAJAX(){
    var comment = document.sub_comment.comment.value;    //使用document访问表单元素，得到评论内容
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
    }                           //初始化，不同浏览器有不同的AJAX协议
    var url = "comment.jsp?comment="+comment;
    xmlHttp.open("GET",url,true)        //给comment小界面传值

    xmlHttp.onreadystatechange = function (){
      if(xmlHttp.readyState==4){
        infoDiv.innerHTML  = xmlHttp.responseText;   //替换infoDiv里面的代码
      }
    }
    xmlHttp.send();
  }
  initAJAX();        //执行一遍AJAX
</script>
<script language="JavaScript">
  var xmlHttp = false;
  function initAJAX2(){
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
    xmlHttp.open("GET","comment.jsp",true)
    xmlHttp.onreadystatechange = function (){
      if(xmlHttp.readyState==4){
        infoDiv.innerHTML  = xmlHttp.responseText;
      }
    }
    xmlHttp.send();
  }
  initAJAX2();
</script>
<%--    连接数据库--%>
<%
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/db02";
  String name="root";
  String password = "123456";
  Connection conn = DriverManager.getConnection(url,name,password);
  Statement stat = conn.createStatement();
%>
<%--获取视频--%>
<%

  String id = request.getParameter("id");       //?其他页面传来的隐藏参数id？
  if(id!=null){
    request.getSession().setAttribute("video_id",id);
  }
  Object video_id = session.getAttribute("video_id");

  String str = "select * from tb_video where video_id = ";
  str += video_id;

  String title;
  String path;
  ResultSet rs = stat.executeQuery(str);
  rs.next();
  title = rs.getString("title");
  path = rs.getString("path");
%>
<%--获取用户昵称--%>
<%
  Object user_id = session.getAttribute("user_id");
  str ="select * from tb_nickname where user_id =";
  str +=user_id;
  rs = stat.executeQuery(str);
  rs.next();
  String nickname = rs.getString("user_nickname");
%>




<%
  stat.close();
  conn.close();
%>
<body>

  <!-- ***** Preloader Start 可以使整个页面加载好后一起显示***** -->
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
              <li><a href="sum_text.jsp">文章</a></li>
              <li><a href="sum_video.jsp" class="active">视频</a></li>
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
          <h2><%=title%></h2>
          <!-- ***** Banner Start ***** -->
          <div class="most-popular">
            <video src="<%=path%>" controls >  </video>
          </div>
          <!-- ***** Banner End ***** -->
          <div class="most-popular">
            <form class="UploadCenter" action="video.jsp" method="get" name="sub_comment">
              <input type="text" placeholder="总座有何高见"  class="upload_Text" name="comment">
              <input type="button" value="发布" class="upload_Comments" onclick="initAJAX()">
            </form>
          </div>
          <div id="infoDiv"></div>
<%--          //异步刷新代码块--%>

            <!-- ***** Gaming Library Start ***** -->
            <div class="gaming-library">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>相关</em> 视频</h4>
                </div>
                <div class="item">
                  <ul>
                    <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                    <li><h4>Dota 2</h4><span>Sandbox</span></li>
                    <li><span>634 H 22 Mins</span></li>
                    <li><span>24/08/2036</span></li>
                    <li><span>describle</span></li>
                    <li><div class="main-border-button"><a href="#">查看全文</a></div></li>
                  </ul>
                </div>
                <div class="item">
                  <ul>
                    <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                    <li><h4>Dota 2</h4><span>Sandbox</span></li>
                    <li><span>634 H 22 Mins</span></li>
                    <li><span>24/08/2036</span></li>
                    <li><span>describle</span></li>
                    <li><div class="main-border-button"><a href="#">查看全文</a></div></li>
                  </ul>
                </div>
                <div class="item last-item">
                  <ul>
                    <li><img src="../assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                    <li><h4>Dota 2</h4><span>Sandbox</span></li>
                    <li><span>634 H 22 Mins</span></li>
                    <li><span>24/08/2036</span></li>
                    <li><span>describle</span></li>
                    <li><div class="main-border-button"><a href="#">查看全文</a></div></li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="browse.html">更多视频</a>
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
