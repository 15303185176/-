<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<form action="revisejudge1.jsp" method="get">
    <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <br> 输入要修改的活动主题 <input type="text" name="topic" /><br>

    <br><input type="submit" value="提交" />
    <input type="reset" value="重置" />  <br>
    <br> <input type="button" value="返回菜单" onclick="location.href='menu.jsp'" /> <br>
    </p>
</form>
</body>
</html>
