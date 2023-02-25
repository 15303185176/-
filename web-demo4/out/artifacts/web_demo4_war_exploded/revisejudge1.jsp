<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="test.Data" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息界面</title>
</head>
<body>

<jsp:useBean id="util" class="test.Data" scope="page" />
<%
  String topic = request.getParameter("topic");
  session.setAttribute("topic",topic);
  String s1="";
  String s2="";
  String s3="";
  String s4="";
  String s5="";
  String s6="";
  String s7="";
  String s8="";
  %>
<table border="1"style="text-align:center;">
  <tr>
    <td align="center" width=6%>主题</td>
    <td align="center" width=8%>目的</td>
    <td align="center" width=10%>类型</td>
    <td align="center" width=10%>时间</td>
    <td align="center" width=6%>地点</td>
    <td align="center" width=18%>对象</td>
    <td align="center" width=3%>内容</td>
    <td align="center" width=10>安排</td>

  </tr>
  <%
    Connection connection = util.getConnection();
    PreparedStatement preparedStatement=null;
    ResultSet rs=null;
    int i =0;
    try {

      String sql = "select * from activity";
      preparedStatement=connection.prepareStatement(sql);
      rs=preparedStatement.executeQuery();
      while(rs.next()){
        if(topic.equals(rs.getObject(1))){
          i++;
  %>
  <tr>
    <td align="center"><%=rs.getObject(1) %></td>
    <td align="center"><%=rs.getObject(2) %></td>
    <td align="center"><%=rs.getObject(3) %></td>
    <td align="center"><%=rs.getObject(4) %></td>
    <td align="center"><%=rs.getObject(5) %></td>
    <td align="center"><%=rs.getObject(6) %></td>
    <td align="center"><%=rs.getObject(7) %></td>
    <td align="center"><%=rs.getObject(8) %></td>

  </tr>
  <%
         s1=(String) rs.getObject(1);
         s2=(String) rs.getObject(2);
         s3=(String) rs.getObject(3);
         s4=(String) rs.getObject(4);
         s5=(String) rs.getObject(5);
         s6=(String) rs.getObject(6);
         s7=(String) rs.getObject(7);
         s8=(String) rs.getObject(8);
      }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }finally{
      util.close(rs);
      util.close(preparedStatement);
      util.close(connection);

      if(i==0){
        out.print("<script language='javaScript'> alert('您输入的活动主题不存在'); window.history.back(-1); </script>");

      }
    }

  %>
</table>
<br/>
<br/>
<form action="revisejudge2.jsp" method="post">
<%--  <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">--%>
  <h2>以下为您要修改的信息</h2><br/>



  活动目的<br/>
  <input type="text" name="purpose"value="<%=s1%>"><br/>
  活动类型<br/>
  <input type="radio" name="type" value="社团竞赛" >社团竞赛
  <input type="radio" name="type" value="野外采风" >野外采风
  <input type="radio" name="type" value="校内集会" >校内集会
  <input type="radio" name="type" value="社团纳新" >社团纳新<br/>
  <br/>
  活动时间<br/>
  <input type="text" name="time" value="<%=s4 %>"><br/>
  活动地点<br/>
  <input type="text" name="place" value="<%=s5 %>" ><br/>
  活动对象<br/>
  <input type="checkbox" name="a1" value="社团成员">社团成员<br />
  <input type="checkbox" name="a2" value="全体学生">全体学生<br/>
  活动内容<br>
  <input type="text" name="neirong" value="<%=s7 %>"><br/>
  活动日程安排<br>
  <input type="text" name="schedule" value="<%=s8 %>"><br/>
  <input type="submit" value="提交">


</form>


</body>
</html>
