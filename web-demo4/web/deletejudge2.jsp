<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.Data" scope="page" />
<%
  String topic = request.getParameter("topic");
  util.deleteData(topic);
  out.print("<script language='javaScript'> alert('删除成功');</script>");
  response.setHeader("refresh", "0;url=show.jsp");
%>
</body>
</html>
