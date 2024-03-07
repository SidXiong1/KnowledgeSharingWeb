<%--
  Created by IntelliJ IDEA.
  User: xdclass
  Date: 2020/6/3
  Time: 下午9:45
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=gbk" language="java" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>水一方论坛</title>
</head>
<body>


<%--<jsp:forward page="/topic?method=list&c_id=1"></jsp:forward>--%>
<%
//    Object phone = session.getAttribute("zhanghu");
//    Object pwd = session.getAttribute("mima");
    String phonea ="1111";
    String pwdb ="1111";

%>
    <jsp:forward page="/user?method=login"></jsp:forward>
<%--    <jsp:forward page="/user?method=login&phone"+'phonea'+'&pwd='+'pwdb'></jsp:forward>--%>
<%--    <jsp:forward page="/user?method=login&phone=1111&pwd=1111"></jsp:forward>--%>

</body>
</html>
