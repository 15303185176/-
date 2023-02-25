<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>展示页面</title>
</head>
<body>

<jsp:useBean id="util" class="test.data1" scope="page" />
<table border="1"style="text-align:center;">
    <tr>
        <td align="center" width=6%>户别</td>
        <td align="center" width=8%>住房类型</td>
        <td align="center" width=10%>住房面积</td>
        <td align="center" width=10%>房间数</td>
        <td align="center" width=6%>姓名</td>
        <td align="center" width=18%>身份证号码</td>
        <td align="center" width=3%>性别</td>
        <td align="center" width=10>民族</td>
        <td align="center" width=10%>教育程度</td>
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
<p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <input type="button" value="返回菜单" onclick="location.href='menu.jsp'" /> <br>
</p>
</body>
</html>
