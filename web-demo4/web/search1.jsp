<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询页面</title>
</head>
<body>

<jsp:useBean id="util" class="test.Data" scope="page" />
<%
  String data = request.getParameter("data");
  session.setAttribute("data",data);

%>
<table border="1"style="text-align:center;">
  <tr>
    <td align="center" width=6%>主题</td>
    <td align="center" width=10%>时间</td>
    <td align="center" width=10%>类型</td>
    <td align="center" width=18%>对象</td>

  </tr>
  <%
    int i =0;
    Connection connection = util.getConnection();
    PreparedStatement preparedStatement=null;
    ResultSet rs=null;

    try {


      String sql = "select * from activity where 主题 like ? or 时间 like ? or 类型 like ? or 地点 like ?";
      preparedStatement=connection.prepareStatement(sql);
      preparedStatement.setString(1,"%"+data+"%");
      preparedStatement.setString(2,"%"+data+"%");
      preparedStatement.setString(3,"%"+data+"%");
      preparedStatement.setString(4,"%"+data+"%");
      rs=preparedStatement.executeQuery();
      while(rs.next()){
      ++i;
  %>
  <tr>
    <td align="center"><a style="color:blue" href='search2.jsp?'><%=rs.getObject(1) %></a> </td>


    <td align="center"><%=rs.getObject(4) %></td>
    <td align="center"><%=rs.getObject(3) %></td>
    <td align="center"><%=rs.getObject(6) %></td>


  </tr>
  <%
        }

    } catch (SQLException e) {
      e.printStackTrace();
    }finally{
      util.close(rs);
      util.close(preparedStatement);
      util.close(connection);
      if(i==0){
        out.print("<script language='javaScript'> alert('未查询到相关信息！');window.history.back(-1);</script>");

      }
    }

  %>
</table>
</body>
</html>
