<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.Data" scope="page" />
<%
    String topic = request.getParameter("topic");
    String purpose = request.getParameter("purpose");
    String type = request.getParameter("type");
    String time = request.getParameter("time");
    String place = request.getParameter("place");
    session.setAttribute("zhuti",topic);
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
    if(topic==""||purpose==""||type==""||time==""||place==""||duixiang==""||neirong==""||schedule==""){
        out.print("<script language='javaScript'> alert('输入为空');window.history.back(-1);</script>");
    }else if(topic.length()>20) {
        out.print("<script language='javaScript'> alert('活动主题不能超过20个汉字');window.history.back(-1);</script>");
    }
    else if(purpose.length()>50) {
        out.print("<script language='javaScript'> alert('活动目的不能超过50个汉字');window.history.back(-1);</script>");

    }else if(neirong.length()>500) {
        out.print("<script language='javaScript'> alert('活动内容不能超过500个汉字');window.history.back(-1);</script>");
    }else if(schedule.length()>500) {
        out.print("<script language='javaScript'> alert('活动日程不能超过500个汉字');window.history.back(-1);</script>");
    }else{
            util.addData(topic,purpose,type,time,place,duixiang,neirong,schedule);
            out.print("<script language='javaScript'> alert('提交成功');</script>");
            response.setHeader("refresh", "0;url=show2.jsp");


    }


%>
</body>
</html>
