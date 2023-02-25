<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.data1" scope="page" />
<%
  //String id=(String)request.getParameter("id");
  //String name = request.getParameter("name");
  String name = (String) session.getAttribute("name1");
  util.deleteData(name);
  out.print("<script language='javaScript'> alert('删除成功');</script>");
  response.setHeader("refresh", "0;url=show.jsp");
%>
</body>
</html>
