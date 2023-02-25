<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/26
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.data1" scope="page" />
<%
  String id = request.getParameter("id");
  String sex = request.getParameter("sex");
  String edu = request.getParameter("edu");
  String minzu = request.getParameter("minzu");
  String name = (String) session.getAttribute("name1");
  if(!util.ifIdRight(id)){
    out.print("<script language='javaScript'> alert('身份证有误');window.history.back(-1);</script>");
  }else if(sex == ""){
    out.print("<script language='javaScript'> alert('未输入性别');window.history.back(-1);</script>");
  }else if(edu == ""){
    out.print("<script language='javaScript'> alert('选择教育程度有误');window.history.back(-1);</script>");
  }else {
util.updateData(name,id,sex,minzu,edu);
    out.print("<script language='javaScript'> alert('修改成功');</script>");
    response.setHeader("refresh", "0;url=show.jsp");

  }
%>
</body>
</html>
