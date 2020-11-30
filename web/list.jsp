<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/19
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生列表</title>
</head>
<script type="text/javascript">
        function d0Delete(sid) {
         var flag=confirm("是否确定删除？")
            if(flag){
                window.location.href="DeleteServlet?sid="+sid;
            }
        }
</script>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    body {
        background-color: rgba(9, 9, 8, 0.15);
    }
    .head {
        width: 100%;
        height: 100px;
        background-color: #222222;
    }
    .head span {
        color: white;
        margin-left: 10px;
        line-height: 100px;
        font-size: 30px;
    }
    table {
        margin: 50px auto;
    }
    table tr th {
        background-color: darkgrey;
        font-weight: 400;
    }
    .a1 {
        display: inline-block;
        float: left;
        font-size: 14px;
        /*width: 50px;*/
        background-color: #539554;
        color: white;
        margin-left: 10px;
        text-decoration: none;
        border: 1px solid #000;
    }
    .a2  {
        text-decoration: none;
        font-size: 14px;
        display: inline-block;
        /*width: 50px;*/
        background-color:red;
        color: white;
        margin-left: 5px;
        border: 1px solid #000;
    }

    .aa {
        background-color: rgba(202, 189, 35, 0.69);
        text-decoration: none;
        font-size: 18px;
        margin-left: 164px;
    }
    .aa a{
        text-decoration: none;
        color: #ef3031;
    }
    .aa:hover {
        color: #2f2bff;
    }
    .inp {
        background-color: deepskyblue;
        width: 110px;
        height: 30px;
        color: white;
    }
    .inp:hover{
        color: red;
    }
    .inp1 {
        width: 130px;
        height: 22px;
        font-size: 18px;
        margin-top: 6px;
    }
    .inp2 {
        display: inline-block;
        width: 80px;
        height: 24px;
        line-height: 24px;
    }
</style>
<script type="text/javascript" src="text.js"></script>
<body>
<div class="head">
    <span>学生管理后台</span>
</div>

<form method="post" action="SearchStudentServlet">
<table border="1" width="800">
    <tr>
        <td colspan="8">
            按姓名查询:<input type="text" name="sname" class="inp1"/>
            &nbsp;
            按性别查询:<select name="gender" class="inp2">
            <option value="">--请选择--
            <option value="男">男
            <option value="女">女
        </select>
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="查询" class="inp">
            &nbsp;&nbsp;&nbsp;
           <button class="aa"><a href="add.jsp" >添加学生</a></button>
        </td>
    </tr>
<tr align="center">
    <th>编号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>电话</th>
    <th>生日</th>
    <th>爱好</th>
    <th>简介</th>
    <th>操作</th>
</tr>
    <c:forEach items="${list}" var="stu">
<tr align="center">
    <td>${stu.sid}</td>
    <td>${stu.sname}</td>
    <td>${stu.gender}</td>
    <td>${stu.phone}</td>
    <td>${stu.birthday}</td>
    <td>${stu.hobby}</td>
    <td>${stu.info}</td>
    <td>
        <a href="EditServlet?sid=${stu.sid}" class="a1">更新</a>
        <a href="#" onclick="d0Delete(${stu.sid})" class="a2">删除</a>

    </td>
</tr>
    </c:forEach>
</table>
</form>
</body>
</html>
