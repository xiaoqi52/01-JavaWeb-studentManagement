<%--<jsp:useBean id="pageBean" scope="request" type="xhost.domain.PageStudentBean"/>--%>

<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/21
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生信息列表</title>
</head>
<script type="text/javascript">
    function doDelete(sid) {
        /* 如果这里弹出的对话框，用户点击的是确定，就马上去请求Servlet。
        如何知道用户点击的是确定。
        如何在js的方法中请求servlet。 */
        var flag = confirm("是否确定删除?");
        if(flag){
            //表明点了确定。 访问servlet。 在当前标签页上打开 超链接，
            //window.location.href="DeleteServlet?sid="+sid;
            location.href="DeleteServlet?sid="+sid;
        }
    }
</script>
<script type="text/javascript" src="text.js"></script>
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
        margin-left: 10px;
        /*width: 50px;*/
        background-color:red;
        color: white;
        border: 1px solid #000;
    }

    .aa  {
        background-color: rgba(202, 189, 35, 0.69);
        text-decoration: none;
        font-size: 18px;
        margin-left: 164px;
    }
    .aa a {
        text-decoration: none;
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
    .bum {
        background-color: rgba(156, 156, 156, 0.89);
    }
    .bum a {
        color: #e9f4ff;
        text-decoration: none;
    }
</style>
<body>
<div class="head">
    <span>学生管理后台</span>
</div>
<form action="SearchStudentServlet" method="post">
    <table border="1" width="800">
        <tr>
            <td colspan="8">
                按姓名查询:<input type="text" name="sname" class="inp1"/>
                &nbsp
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
        <c:forEach items="${pageBean.list }" var="stu">
            <tr align="center">
                <td>${stu.sid }</td>
                <td>${stu.sname }</td>
                <td>${stu.gender }</td>
                <td>${stu.phone }</td>
                <td>${stu.birthday }</td>
                <td>${stu.hobby }</td>
                <td>${stu.info }</td>
                <td>
                    <a href="EditServlet?sid=${stu.sid }"  class="a1">更新</a>
                    <a href="#" class="a2" onclick="doDelete(${stu.sid})">删除</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                第 ${pageBean.currentPage } / ${pageBean.totalPage }
                &nbsp;&nbsp;
                每页显示${pageBean.pageSize }条  &nbsp;&nbsp;&nbsp;
                总的记录数${pageBean.totalSize } &nbsp;&nbsp;&nbsp;
                <c:if test="${pageBean.currentPage !=1 }">
                   <button class="bum"> <a href="StudentListPageServlet?currentPage=1">首页</a></button>
                    | <button class="bum"><a href="StudentListPageServlet?currentPage=${pageBean.currentPage-1 }">上一页</a></button>
                </c:if>

                <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                    <c:if test="${pageBean.currentPage == i }">
                        ${i }
                    </c:if>
                    <c:if test="${pageBean.currentPage != i }">
                        <a href="StudentListPageServlet?currentPage=${i }">${i }</a>
                    </c:if>
                </c:forEach>

                <c:if test="${pageBean.currentPage !=pageBean.totalPage }">
                   <button class="bum"> <a href="StudentListPageServlet?currentPage=${pageBean.currentPage+1 }">下一页</a></button> |
                 <button class="bum">   <a href="StudentListPageServlet?currentPage=${pageBean.totalPage }">尾页</a></button>
                </c:if>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
