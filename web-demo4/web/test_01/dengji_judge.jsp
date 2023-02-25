<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="util" class="test.data1" scope="page" />
<%
    String hubie = request.getParameter("hubie");
    String type = request.getParameter("type");
    String square = request.getParameter("square");
    String number = request.getParameter("number");
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String sex = request.getParameter("sex");
    String minzu = request.getParameter("minzu");
    String edu = request.getParameter("edu");
    if(hubie==""||type==""||square==""||number==""||name==""||id==""||sex==""||minzu==""||edu==""){
        out.print("<script language='javaScript'> alert('输入为空');window.history.back(-1);</script>");
    }
    else if(!util.ifInteger(square)){
        out.print("<script language='javaScript'> alert('住房面积应为整数');window.history.back(-1);</script>");
    }
    else if(!util.ifInteger(number)){
        out.print("<script language='javaScript'> alert('房间数应为整数');window.history.back(-1);</script>");
    }
    else if(!util.ifIdRight(id)){
        out.print("<script language='javaScript'> alert('身份证号输入有误！');window.history.back(-1);</script>");
    }else if(util.ifNameRepeat(name)){
        out.print("<script language='javaScript'> alert('姓名已经存在！');window.history.back(-1);</script>");

    }
    else if(util.ifNameRepeat(id)){
        out.print("<script language='javaScript'> alert('身份证号已经存在！');window.history.back(-1);</script>");

    }
    else {
    util.adddata(hubie, type, square, number, name, id, sex, minzu, edu);
    out.print("<script language='javaScript'> alert('添加成功');</script>");
    response.setHeader("refresh", "0;url=show.jsp");}

%>
</body>
</html>
