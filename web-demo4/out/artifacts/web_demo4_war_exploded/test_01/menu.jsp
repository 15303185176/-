<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <title>登记主菜单</title>
  <style>
    body{
      background-size: 100% ;
    }
  </style>
</head>
<body background="AngelBeats.jpg">
<p style="text-align:center;color:black;font-family:宋体; font-size:20px">
  人口普查登记系统
</p>
<input type="button" value="信息登记" onclick="location.href='dengji.jsp'">
<input type="button" value="信息删除" onclick="location.href='delete.jsp'" />
<input type="button" value="信息修改" onclick="location.href='revise.jsp'" />
<input type="button" value="查询信息" onclick="location.href='search.jsp'" />
<input type="button" value="浏览信息" onclick="location.href='show.jsp'" />
</body>
</html>
