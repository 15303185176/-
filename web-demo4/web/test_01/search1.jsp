<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/26
  Time: 15:34
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
    if(data == ""){
        out.print("<script language='javaScript'> alert('您输入为空');window.history.back(-1);</script>");
    }
    else {
%>
<table border="1"style="text-align:center;">
    <tr>
        <td align="center" width=6%>姓名</td>
        <td align="center" width=3%>性别</td>
        <td align="center" width=10>民族</td>
        <td align="center" width=10%>教育程度</td>
    </tr>
<%
        Connection conn = util.getConnection();
        PreparedStatement preparedStatement =null;
        ResultSet rs = null;
        try{
            int i = 0;


            String sql = "select * from pucha where  姓名 like ? or 性别 like ? or 民族 like ? or 教育程度 like ? ";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,"%"+data+"%");
            preparedStatement.setString(2,"%"+data+"%");
            preparedStatement.setString(3,"%"+data+"%");
            preparedStatement.setString(4,"%"+data+"%");
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                    ++i;
 %>
    <tr>
        <td align="center"><a style="color:blue" href='search2.jsp?name=<%=rs.getObject(5) %>'><%=rs.getObject(5) %></a> </td>
        <td align="center"><%=rs.getObject(7) %></td>
        <td align="center"><%=rs.getObject(8) %></td>
        <td align="center"><%=rs.getObject(9) %></td>
    </tr>
        <%
        }
            if(i == 0){
             out.print("<script language='javaScript'> alert('未查询到相关信息');window.history.back(-1);</script>");
            }
            }
        catch (SQLException e){
            e.printStackTrace();
        }finally{
            util.close(conn);
            util.close(rs);
            util.close(preparedStatement);
        }
        }



%>
    <table/>
</body>
</html>
