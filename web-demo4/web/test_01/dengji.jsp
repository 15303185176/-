<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/10/25
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登记页面</title>
</head>
<body>
<form action="dengji_judge.jsp" method="post">
    <h1>登记页面</h1>
    <br/>
    <b>户别</b>
    <input type="radio" name = "hubie" value="家庭户"/>   1. 家庭户
    <input type="radio" name = "hubie" value="集体户"> 2. 集体户
    <br/>
    <b>住房类型</b>
    <input type="radio" name="type" value="家庭住宅">1.家庭住宅
    <input type="radio" name="type" value="集体住所">2.集体住所
    <input type="radio" name="type" value="工作地住所">3.工作地住所
    <input type="radio" name="type" value="其他住宅">4.其他住宅
    <input type="radio" name="type" value="无住宅">5.无住宅
    <br/>
    <b>住房面积</b>
    <input type="text" name = "square"><br>
    <b>现住房间数</b>
    <input type="text" name ="number"><br>
    <b>户主姓名</b>
    <input type="text" name = "name"><br>
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
    <input type="submit" value="提交">

</form>
</body>
</html>
