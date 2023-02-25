<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/28
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加页面</title>
</head>

<center><h1>校园社团活动管理系统</h1></center>




<form action="addjudge.jsp" method="post">
    <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
    <br/>
    活动主题<br/>
    <input type="text" name="topic"><br/>
    活动目的<br/>
    <input type="text" name="purpose"><br/>
    活动类型<br/>
    <input type="radio" name="type" value="社团竞赛">社团竞赛
    <input type="radio" name="type" value="野外采风">野外采风
    <input type="radio" name="type" value="校内集会">校内集会
    <input type="radio" name="type" value="社团纳新">社团纳新<br/>
    <br/>
    活动时间<br/>
    <input type="text" name="time"><br/>
    活动地点<br/>
    <input type="text" name="place"><br/>
    活动对象<br/>
    <input type="checkbox" name="a1" value="社团成员">社团成员<br />
    <input type="checkbox" name="a2" value="全体学生">全体学生<br/>
    活动内容<br>
    <textarea rows="10" cols="30" name="neirong"></textarea><br/>
<%--    <input type="text" name="neirong"><br/>--%>
    活动日程安排<br>
    <textarea rows="10" cols="30" name="schedule"></textarea>
    <br/>
<%--    <input type="text" name="schedule"><br/>--%>
    <input type="submit" value="提交"><br/>
</p>
</form>

</body>
</html>
