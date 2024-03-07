<%--
  Created by IntelliJ IDEA.
  User: 26409
  Date: 2023/5/11
  Time: 下午 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<%
    request.setCharacterEncoding("UTF-8");
    Object user_id = session.getAttribute("user_id");
    String nickname = request.getParameter("nickname");
    if(nickname!=null&&nickname!=""){
        str = "update tb_nickname set user_nickname = '";
        str += nickname;
        str += "' where user_id = ";
        str += user_id;
        stat.executeUpdate(str);
        str = "update user set username = '";
        str += nickname;
        str += "' where id = ";
        str += user_id;
        stat.executeUpdate(str);
        response.sendRedirect("../main/user.jsp");
    }
%>
<%
    stat.close();
    conn.close();
%>
<body>
    <form action="../function/set_nickname.jsp" method="post">
        <input type="text" name="nickname">
        <input type="submit" value="设置">
    </form>
</body>
</html>
