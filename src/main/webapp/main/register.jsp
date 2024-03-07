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
    <script>
        function backToHomepage(){
            location.href="home.jsp"
        }
    </script>
</head>
<%--    连接数据库--%>
<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/db02";
    String name="root";
    String password = "123456";
    Connection conn = DriverManager.getConnection(url,name,password);
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
            char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
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
    Object first = session.getAttribute("register");
    if(first==null){
        request.getSession().setAttribute("register",1);
    }else {
        request.getSession().setAttribute("register",2);
    }
    first = session.getAttribute("register");
%>
<%--移除用户登录信息--%>
<%
    session.removeAttribute("login");
%>
<%--    注册账户--%>
<%
    boolean flag = true;
    String ac = request.getParameter("account" );
    String ps = request.getParameter("password" );
    if(ac == null||ps == null||ac.equals("")||ps.equals("")){
        if(first.equals(2)){
%>
<script>alert('用户名或者密码不能为空！')</script>
<%
        }
    }
    if(ac != null&&ps != null&&!ac.equals("")&&!ps.equals("")){
        String str2 = "select * from tb_password";
        ResultSet rs = stat.executeQuery(str2);
        while (rs.next()){
            if(ac.equals(rs.getString("user_account"))){
                flag = false;
            }
        }
        if(flag==true){
            Md5 md5 = new Md5();
//            本机账号密码录入
            String str = "insert into tb_password(user_account, user_password) values ('";
            str += ac;
            str += "','";
            str +=md5.md5(ps);
            str += "')";
            stat.executeUpdate(str);
//            论坛账号密码录入
            str = "insert into user(phone, pwd,username) values ('";
            str += ac;
            str += "','";
            str +=md5.md5(ps);
            str += "','";
            str += "新注册用户";
            str += "')";
            stat.executeUpdate(str);
//            获取新账户ID
            str = "select user_id from tb_password where user_account=";
            str += ac;
            rs = stat.executeQuery(str);
            rs.next();
            Object uid = rs.getString("user_id");
//            设置新账户默认昵称
            str = "insert into tb_nickname(user_id) values (";
            str += uid;
            str += ")";
            stat.executeUpdate(str);

            request.getSession().setAttribute("register","yes");
            response.sendRedirect("login.jsp");
        }else {
%>
<script>alert('很抱歉，该用户名已被使用，请换一个用户名试试')</script
<%
        }
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
<%--    <header class="header-area header-sticky">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-12">--%>
<%--                    <nav class="main-nav">--%>
<%--                        <!-- ***** Logo Start ***** -->--%>
<%--                        <a href="home.jsp" class="logo">--%>
<%--                            <img src="../assets/images/logo.png" alt="">--%>
<%--                        </a>--%>
<%--                        <!-- ***** Logo End ***** -->--%>
<%--                        <!-- ***** Search End ***** -->--%>
<%--                        <div class="search-input">--%>
<%--                            <form id="search" action="#">--%>
<%--                                <input type="text" placeholder="搜一搜" id='searchText' name="searchKeyword" onkeypress="handle" />--%>
<%--                                <i class="fa fa-search"></i>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                        <!-- ***** Search End ***** -->--%>
<%--                        <!-- ***** Menu Start ***** -->--%>
<%--                        <ul class="nav">--%>
<%--                            <li><a href="index.html">首页</a></li>--%>
<%--                            <li><a href="browse.html">文章</a></li>--%>
<%--                            <li><a href="details.html">视频</a></li>--%>
<%--                            <li><a href="streams.html">讨论</a></li>--%>
<%--                            <li><a href="profile.html" class="active">空间 <img src="../assets/images/profile-header.jpg" alt=""></a></li>--%>
<%--                        </ul>--%>
<%--                        <a class='menu-trigger'>--%>
<%--                            <span>Menu</span>--%>
<%--                        </a>--%>
<%--                        <!-- ***** Menu End ***** -->--%>
<%--                    </nav>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </header>--%>
    <!-- ***** Header Area End ***** -->
    <br>
    <br>
<h1>注册界面</h1>
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
                                                <ab><li><input type="text" name="account" value="" placeholder="请在此输入账号"><br></li></ab><br><br>
                                                <ab></ab><li><input type="password" name="password" value="" placeholder="请在此输入密码"><br><br></li></ab>
                                                <abc> <li><input type="submit" value="立即注册"><br><br></li></abc>
                                                <abc><li><input type="button" value="不想注册了，放我回首页" onclick="backToHomepage()"><br></li></abc>
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
