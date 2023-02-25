<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除页面</title>
</head>
<body>

<jsp:useBean id="util" class="test.Data" scope="page" />
<%
    String topic= request.getParameter("topic");
    if(topic==""){
        out.print("<script language='javaScript'> alert('输入为空'); window.history.back(-1); </script>");
    }
    else if(!util.ifTopicSame(topic))
    {
        out.print("<script language='javaScript'> alert('该活动信息不存在'); window.history.back(-1); </script>");
    }
    else{
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
        <td align="center" width=3%>删除</td>
    </tr>
    <%
        Connection connection = util.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet rs=null;
        try {
            String sql = "select * from activity";
            preparedStatement=connection.prepareStatement(sql);
            rs=preparedStatement.executeQuery();
            while(rs.next()){
                if(topic.equals(rs.getObject(1)))
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
        <td align="center"><a style="color:blue" href='deletejudge2.jsp?topic=<%=rs.getObject(1) %>' onclick="javascript:return del()">删除</a> </td>
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
        var r = confirm("是否确认删除该活动信息？")
        if (r == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
<p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <br> <input type="button" value="返回菜单" onclick="location.href='menu.jsp'" /> <br>
</p>
</body>
</html>
