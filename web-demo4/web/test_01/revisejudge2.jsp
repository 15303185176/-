<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/26
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<jsp:useBean id="util" class="test.data1" scope="page" />
<%
  String name = request.getParameter("name");
  session.setAttribute("name1",name);

%>


  <br/>
  请输入要修改的信息<br/>
  <form action="revisejudge3.jsp" method="post">
    <b>身份证号码</b>
    <input type="text" name = "id" size="40"><br/>
    <b>性别</b>
    <input type="radio" name = "sex" value="男">男
    <input type="radio" name = "sex" value="女">女<br/>
    <b>民族</b>
    <input type="text" name ="minzu"><br/>

    <b>受教育程度</b>
    <select name = "edu">
      <option selected="selected"></option>
      <option value = "研究生">研究生</option>
      <option value=  "大学本科">大学本科</option>
      <option value=  "大学专科">大学专科</option>
      <option value=  "高中">高中</option>
      <option value=  "初中">初中</option>
      <option value=  "小学">小学</option>
      <option value=  "未上过学">未上过学</option>


    </select>
    <br/>
    <input type="submit" value="提交"><br/>
  </form>

</table>
</body>
</html>
