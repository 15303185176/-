<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询信息</title>
</head>
<body>

<jsp:useBean id="util" class="test.Data" scope="page" />
<%
    String data = (String) session.getAttribute("data");

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

        try {


            String sql = "select * from activity where 主题 like ? or 时间 like ? or 类型 like ? or 地点 like ?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+data+"%");
            preparedStatement.setString(2,"%"+data+"%");
            preparedStatement.setString(3,"%"+data+"%");
            preparedStatement.setString(4,"%"+data+"%");
            rs=preparedStatement.executeQuery();
            while(rs.next()){

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
</body>
<a href="menu.jsp" target="_self">点我回到主菜单</a>
</html>
