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


    <title>水一方-comment</title>
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
    //    System.out.println("ok");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/db02";
    String name = "root";
    String password = "123456";
    Connection conn = DriverManager.getConnection(url, name, password);
    Statement stat = conn.createStatement();
    ResultSet rs;
    String str;
%>
<%--获取昵称和视频ID--%>
<%
    Object video_id = session.getAttribute("video_id");

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
    String id = request.getParameter("id");
    if(id!=null){
        request.getSession().setAttribute("video_id",id);
    }
    str = "select * from tb_vi_comment where video_id =";
    str += video_id;
//    System.out.println("str="+str);
    rs = stat.executeQuery(str);
    int i = -1;
    String comment[] = new String[8];     //8个评论内容
    String nickname[] = new String[8];
    String time[] = new String[8];
    while (rs.next()){
        i++;                                 //读取到数据库中有i+1行元组数据
    }
    rs = stat.executeQuery(str);
    while (i>7){
        rs.next();                 //将rs.next移动回第8条数据
        i--;
    }
    while (rs.next()){
        comment[i] = rs.getString("comment");
        nickname[i] = rs.getString("user_nickname");
        time[i] = rs.getString("time");                  //逆序读8条
        i--;
    }
%>
<%
    stat.close();
    conn.close();
%>
<body  >
                               <%--评论--%>

    <div class="most-popular">
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
                    </div>
                    <div class="col-lg-3 col-sm-6">
                            <div class="item">
                                <comment>
                                    <%=comment[1]%>
                                </comment>
                                <br><h4><%=nickname[1]%><br><span><%=time[1]%></span></h4>
                                <ul>
                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                </ul>
                            </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                            <div class="item">
                                <comment>
                                    <%=comment[2]%>
                                </comment>
                                <br><h4><%=nickname[2]%><br><span><%=time[2]%></span></h4>
                                <ul>
                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                </ul>
                            </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                            <div class="item">
                                <comment>
                                    <%=comment[3]%>
                                </comment>
                                <br><h4><%=nickname[3]%><br><span><%=time[3]%></span></h4>
                                <ul>
                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                </ul>
                            </div>
                    </div>
                    <div class="col-lg-6">

                        <div class="item">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                        <div class="item inner-item">
                                            <comment>
                                                <%=comment[4]%>
                                            </comment>
                                            <br><h4><%=nickname[4]%><br><span><%=time[4]%></span></h4>
                                            <ul>
                                                <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                <li><i class="fa fa-eye"></i> 2.3M</li>
                                            </ul>
                                        </div>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                        <div class="item">
                                            <comment>
                                                <%=comment[5]%>
                                            </comment>
                                            <br><h4><%=nickname[5]%><br><span><%=time[5]%></span></h4>
                                            <ul>
                                                <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                                <li><i class="fa fa-eye"></i> 2.3M</li>
                                            </ul>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                            <div class="item">
                                <comment>
                                    <%=comment[6]%>
                                </comment>
                                <br><h4><%=nickname[6]%><br><span><%=time[6]%></span></h4>
                                <ul>
                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                </ul>
                            </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                            <div class="item">
                                <comment>
                                    <%=comment[7]%>
                                </comment>
                                <br><h4><%=nickname[7]%><br><span><%=time[7]%></span></h4>
                                <ul>
                                    <li><i class="fa fa-thumbs-up"></i> 4.8</li>
                                    <li><i class="fa fa-eye"></i> 2.3M</li>
                                </ul>
                            </div>
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
