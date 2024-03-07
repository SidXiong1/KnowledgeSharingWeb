<%--
  Created by IntelliJ IDEA.
  User: 26409
  Date: 2023/5/10
  Time: 下午 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.getSession().setAttribute("off","yes");
    request.getSession().removeAttribute("on");
    request.getSession().removeAttribute("jump");
    request.getSession().removeAttribute("user_id");
    response.sendRedirect("home.jsp");
%>
</body>
</html>
