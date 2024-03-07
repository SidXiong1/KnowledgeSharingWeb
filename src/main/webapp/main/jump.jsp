<%--
  Created by IntelliJ IDEA.
  User: 26409
  Date: 2023/5/10
  Time: 下午 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%--    获取当前用户状态--%>
    <%
        Object first = session.getAttribute("jump");
        if (first == null) {
            request.getSession().setAttribute("jump", 1);
        }
        first = session.getAttribute("jump");
    %>
    <%
        if(first.equals(1)){
            response.sendRedirect("login.jsp");
        }else {
            response.sendRedirect("user.jsp");
        }
    %>
</body>
</html>
