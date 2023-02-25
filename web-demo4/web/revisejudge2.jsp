<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.Data" scope="page" />
<%
  String topic = (String) session.getAttribute("topic");
  String purpose = request.getParameter("purpose");
  String type = request.getParameter("type");
  String time = request.getParameter("time");
  String place = request.getParameter("place");
  String a1,a2;
  if(request.getParameter("a1")!=null){
    a1=request.getParameter("a1");
  }else {
    a1="";
  }
  if(request.getParameter("a2")!=null){
    a2=request.getParameter("a2");
  }else{
    a2="";
  }

  String duixiang = a1+a2;

  String neirong = request.getParameter("neirong");
  String schedule = request.getParameter("schedule");
  if(purpose==""||type==""||time==""||place==""||duixiang==""||neirong==""||schedule==""){
    out.print("<script language='javaScript'> alert('输入为空');window.history.back(-1);</script>");
  }else{
    util.reviseData(topic,purpose,type,time,place,duixiang,neirong,schedule);
    out.print("<script language='javaScript'> alert('修改成功');</script>");
    response.setHeader("refresh", "0;url=show.jsp");

  }
%>
</body>
</html>
