<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 19:58
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
String name = request.getParameter("name");
session.setAttribute("name1",name);
if(name == ""){
  out.print("<script language='javaScript'> alert('输入为空');window.history.back(-1);</script>");
}else if(!util.ifNameRepeat(name)){
  out.print("<script language='javaScript'> alert('姓名不存在');window.history.back(-1);</script>");
}else{
  %>
<table border="1"style="text-align:center;">
  <tr>
    <td align="center" width=6%>户别</td>
    <td align="center" width=8%>住房类型</td>
    <td align="center" width=10%>本户现住房面积</td>
    <td align="center" width=10%>本户现住房间数</td>
    <td align="center" width=6%>姓名</td>
    <td align="center" width=18%>身份证号码</td>
    <td align="center" width=3%>性别</td>
    <td align="center" width=10>民族</td>
    <td align="center" width=10%>受教育程度</td>
    <td align="center" width=3%>删除</td>
  </tr>
    <%
    Connection connection = util.getConnection();
    PreparedStatement preparedStatement=null;
    ResultSet rs=null;
    try {
      String sql = "select * from pucha";
      preparedStatement=connection.prepareStatement(sql);
      rs=preparedStatement.executeQuery();
      while(rs.next()){
        if(name.equals(rs.getObject(5)))
        {
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
    <td align="center"><%=rs.getObject(9) %></td>
    <td align="center"><a style="color:blue" href='deletejudge2.jsp?name=<%=rs.getObject(5) %>' onclick="javascript:return del()">删除</a> </td>
  </tr>
  <%
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }finally{
      util.close(rs);
      util.close(preparedStatement);
      util.close(connection);
    }
  %>
</table>
<%
  }
%>

<script>
  function del(){
    var r = confirm("确定要删除吗？")
    if (r == true) {
      return true;
    } else {
      return false;
    }
  }
</script>
</body>
</html>
