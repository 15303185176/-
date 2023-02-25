<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/26
  Time: 15:45
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
    String name = request.getParameter("name");
    Connection conn = util.getConnection();
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;
    try{
        String sql = "select * from pucha where 姓名 like ?";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1,name);
        rs = preparedStatement.executeQuery();
        while (rs.next()){
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
    </tr>
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

        } catch (SQLException  e) {
        e.printStackTrace();
        }finally{
        util.close(rs);
        util.close(preparedStatement);
        util.close(conn);
        }
    %>
</table>
   <a href="menu.jsp" style="color: pink">点我跳转到主菜单</a>
</body>
</html>
