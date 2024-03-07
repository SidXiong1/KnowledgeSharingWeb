<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>水一方-登录</title>
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
  <style>
    h1{
      text-align: center;
    }
  </style>
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
<%--    加密算法--%>
<%
  class Md5 {

    /**
     * md5加密
     * @param key
     *            输入的数据
     * @return 加密后的数据
     */
    String md5(String key) {
      char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
      try {
        byte[] btInput = key.getBytes();
        // 获得MD5摘要算法的 MessageDigest 对象
        MessageDigest mdInst = MessageDigest.getInstance("MD5");
        // 使用指定的字节更新摘要
        mdInst.update(btInput);
        // 获得密文
        byte[] md = mdInst.digest();
        // 把密文转换成十六进制的字符串形式
        int j = md.length;
        char str[] = new char[j * 2];
        int k = 0;
        for (int i = 0; i < j; i++) {
          byte byte0 = md[i];
          str[k++] = hexDigits[byte0 >>> 4 & 0xf];
          str[k++] = hexDigits[byte0 & 0xf];
        }
        return new String(str);
      } catch (Exception e) {
        return null;
      }
    }

  }


%>
<%--    标记用户第几次使用界面--%>
<%
  Object first = session.getAttribute("login");
  if (first == null) {
    request.getSession().setAttribute("login", 1);
  } else {
    request.getSession().setAttribute("login", 2);
  }
  first = session.getAttribute("login");
%>
<%--注册成功提示--%>
<%
  Object register = session.getAttribute("register");
  if (register != null) {
    if (register.equals("yes")) {
%>
<script>alert("注册成功")</script>
<%
      request.getSession().setAttribute("register", "no");
    }
  }
%>
<%--    自动填充与自动登录--%>
<%
  Cookie[] cookies = request.getCookies();
  String pass = "";
  String acc = "";

  if (cookies != null) {
    for (int j = 0; j < cookies.length; j++) {
      if (cookies[j].getName().equals("remember")) {
        if (cookies[j].getValue().equals("yes")) {
          for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("ps")) {
              pass = cookies[i].getValue();
            } else if (cookies[i].getName().equals("ac")) {
              acc = cookies[i].getValue();
            }
          }
        }
      }
    }
  }

  if (cookies != null) {
    for (int i = 0; i < cookies.length; i++) {
      if (cookies[i].getName().equals("auto")) {
        if (cookies[i].getValue().equals("yes")) {

          String ask = "select user_account,user_id from tb_password";
          ResultSet rs = stat.executeQuery(ask);
          String accc = "";
          for (int j = 0; j < cookies.length; j++) {
            if (cookies[j].getName().equals("ac")) {
              accc = cookies[j].getValue();
            }
          }
          while (rs.next()) {
            if (accc.equals(rs.getString("user_account"))) {
              ask = rs.getString("user_id");
              request.getSession().setAttribute("user_id",ask);
            }
          }

          request.getSession().setAttribute("on","yes");
          request.getSession().setAttribute("jump",2);
          request.getSession().removeAttribute("login");
          response.sendRedirect("home.jsp");

        }
      }
    }
  }
%>
<%--    设置自动登录与记住密码--%>
<%
  String[] ch = request.getParameterValues("choice");
  String ac = request.getParameter("account");
  String ps = request.getParameter("password");

  Cookie cookie;
  if (ac != null && ps != null) {
    cookie = new Cookie("remember", "no");
    cookie.setMaxAge(60);
    response.addCookie(cookie);
    cookie = new Cookie("auto", "no");
    cookie.setMaxAge(60);
    response.addCookie(cookie);
    cookie = new Cookie("ac", ac);
    cookie.setMaxAge(20);
    response.addCookie(cookie);
    cookie = new Cookie("ps", ps);
    cookie.setMaxAge(20);
    response.addCookie(cookie);
    if (ch != null) {
      for (int i = 0; i < ch.length; i++) {
        if (ch[i].equals("remember")) {
          cookie = new Cookie("remember", "yes");
          cookie.setMaxAge(20);
          response.addCookie(cookie);
        } else if (ch[i].equals("auto")) {
          cookie = new Cookie(ac, ps);
          cookie.setMaxAge(20);
          response.addCookie(cookie);
          cookie = new Cookie("auto", "yes");
          cookie.setMaxAge(20);
          response.addCookie(cookie);
        }
      }
    }
    boolean flag = false;
    String str2 = "select user_account,user_password,user_id from tb_password";
    ResultSet rs = stat.executeQuery(str2);
    Md5 md5 = new Md5();
    while (rs.next()) {
      String lock_password = md5.md5(ps);
      if (ac.equals(rs.getString("user_account")) && lock_password.equals(rs.getString("user_password"))) {
        flag = true;
        str2 = rs.getString("user_id");
      }
    }
    if (flag == true) {
      request.getSession().setAttribute("zhanghu",ac);
      request.getSession().setAttribute("mima",ps);
      request.getSession().setAttribute("user_id",str2);
      request.getSession().setAttribute("on","yes");
      request.getSession().setAttribute("jump",2);
      request.getSession().removeAttribute("login");
      response.sendRedirect("home.jsp");
    }
  }
%>
<%--    异常鉴定--%>
<%
  if (ac == null || ps == null || ac == "" || ps == "") {
    request.getSession().setAttribute("error", 1);
  } else {
    request.getSession().setAttribute("error", 2);
  }
  Object str = session.getAttribute("error");
  if (str != null && first.equals(2)) {
    if (str.equals(1)) {%>
<script>alert("用户名与密码都不允许为空，请输入")</script>
<%} else if (str.equals(2)) {%>
<script>alert("用户名或者密码不正确")</script>
<%
    }
  }
%>
<%
  stat.close();
  conn.close();
%>
<script>
  function goToRegisterpage() {
    location.href = "register.jsp"
  }
</script>
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

 <br><br><br>
<h1>登录界面</h1>
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

                  </div>
                  <div class="col-lg-4 align-self-center">
                    <ul>


                      <form>
                        <br><br>
                        <ab><li><input type="text" name="account" value="<%=acc%>" placeholder="请在此输入账号"><br></li></ab><br><br>
                        <ab></ab><li><input type="password" name="password" value="<%=pass%>" placeholder="请在此输入密码"></li></ab>
                        <code> <label><input type="checkbox" name="choice"
                                             value="remember">记住密码</label>
                          <label><input type="checkbox" name="choice"
                                        value="auto">自动登录</label></code><br><br>
                        <abc> <li><input type="submit" value="登录"><br><br></li></abc>
                        <abc><li><input type="button" value="没有账号？点我注册" onclick="goToRegisterpage()"><br></li></abc>
                      </form>



                    </ul>
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



          </div>
</body>

</html>
