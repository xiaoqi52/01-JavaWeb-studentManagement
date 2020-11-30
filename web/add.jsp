<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/19
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
</head>
<meta name="viewport" content="width=device-width,initial-scale">
<script type="text/javascript" src="text.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    /*h3 {*/
    /*    display: inline-block;*/
    /*    width: 100px;*/
    /*    height: 40px;*/
    /*    background-color: green;*/
    /*    color: white;*/
    /*    line-height: 40px;*/
    /*    text-align: center;*/
    /*    font-size: 16px;*/
    /*}*/
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
        width: 100px;
        background-color: #3d9541;
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
    .inp3 {
        background-color: #539554;
        height: 30px;
        width: 60px;
        font-size: 14px;
        color: white;
        margin-left: 20px;
    }
    .inp2:hover{
        color: deepskyblue;
    }
    .inp3:hover{
        color: deepskyblue;
    }
</style>
<body>
<div class="head">
    <span>添加学生信息</span>
</div>
<form method="post" action="AddServlet">
    <table border="1" width="600">
        <tr>
            <th>姓名</th>
            <td><input type="text" name="sname" class="inp1"></td>
        </tr>
        <tr>
            <th>性别</th>
            <td>
                <input type="radio" name="gender" value="男">男
                <input type="radio" name="gender" value="女">女
            </td>
        </tr>
        <tr>
            <th>电话</th>
            <td><input type="text" name="phone" class="inp1"></td>
        </tr>
        <tr>
            <th>生日</th>
            <td><input type="text" name="birthday" class="inp1"></td>
        </tr>
        <tr>
            <th>爱好</th>
            <td>
                <input type="checkbox" name="hobby" value="游泳">游泳
                <input type="checkbox" name="hobby" value="篮球">篮球
                <input type="checkbox" name="hobby" value="足球">足球
                <input type="checkbox" name="hobby" value="看书">看书
                <input type="checkbox" name="hobby" value="写字">写字

            </td>
        </tr>
        <tr>
            <th>简介</th>
            <td><textarea name="info" rows="3" cols="20" class="inp1"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="确定" class="inp2">
                <input type="reset" value="重置" class="inp3">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
