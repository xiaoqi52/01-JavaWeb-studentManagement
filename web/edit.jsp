<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/19
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>修改学生信息</title>
</head>
<meta name="viewport" content="width=device-width,initial-scale">
<script type="text/javascript" src="text.js"></script>
<style>
    *{
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
    table{
        width: 500px;

        margin: 100px auto;
    }

    table tr th {
        background-color: #3d9541;
        width: 100px;
        font-weight: 400;
    }
    .inp1 {
        width: 300px;
        height: 30px;
    }
    .inp2 {
        background-color: #539554;
        height: 30px;
        width: 60px;
        font-size: 14px;
        color: white;
        margin-left: 180px;
    }
    .inp2:hover{
        color: deepskyblue;
    }

</style>

<body>
<div class="head">
    <span>修改学生信息</span>
</div>

<form method="post" action="UpdateServlet">
    <input type="hidden" name="sid" value="${stu.sid }">
    <table border="1" width="600">
        <tr>
            <th>姓名</th>
            <td><input type="text" name="sname"  class="inp1" value="${stu.sname }"></td>
        </tr>
        <tr>
            <th>性别</th>
            <td>
                <!-- 如果性别是男的，  可以在男的性别 input标签里面， 出现checked ,
                如果性别是男的，  可以在女的性别 input标签里面，出现checked -->
                <input type="radio" name="gender" value="男" <c:if test="${stu.gender == '男'}">checked</c:if>>男
                <input type="radio" name="gender" value="女" <c:if test="${stu.gender == '女'}">checked</c:if>>女
            </td>
        </tr>
        <tr>
            <th>电话</th>
            <td><input type="text" name="phone" class="inp1" value="${stu.phone }"></td>
        </tr>
        <tr>
            <th>生日</th>
            <td><input type="text" name="birthday"class="inp1" value="${stu.birthday }"></td>
        </tr>
        <tr>
            <th>爱好</th>


            <td>
                <!-- 爱好： 篮球 ， 足球 ， 看书
                因为爱好有很多个，  里面存在包含的关系 -->
                <input type="checkbox" name="hobby" value="游泳" <c:if test="${fn:contains(stu.hobby,'游泳') }">checked</c:if>>游泳
                <input type="checkbox" name="hobby" value="篮球" <c:if test="${fn:contains(stu.hobby,'篮球') }">checked</c:if>>篮球
                <input type="checkbox" name="hobby" value="足球" <c:if test="${fn:contains(stu.hobby,'足球') }">checked</c:if>>足球
                <input type="checkbox" name="hobby" value="看书" <c:if test="${fn:contains(stu.hobby,'看书') }">checked</c:if>>看书
                <input type="checkbox" name="hobby" value="写字" <c:if test="${fn:contains(stu.hobby,'写字') }">checked</c:if>>写字

            </td>
        </tr>
        <tr>
            <th>简介</th>
            <td><textarea name="info" rows="3" cols="20" class="inp1">${stu.info }</textarea></td>
        </tr>
        <tr>
            <td colspan="2"> <input type="submit" value="确定" class="inp2"> </td>
        </tr>
    </table>
</form>

</body>
</html>
