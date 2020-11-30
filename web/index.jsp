<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/19
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="fonts/iconfont.css">
    <meta name="viewport" content="width=device-width,initial-scale">
    <title>学生管理系统</title>
  </head>
  <style type="text/css">
    * {
      margin: 0;
      padding: 0;
    }


    body {
      background-color: #171D29;
      background-image: url("https://cloudcache.tencent-cloud.com/open_proj/proj_qcloud_v2/platform/src/projects/guide/pages/Home/css/img/banner.png");
      position:fixed;
      top: 0;
      left: 0;
      width:100%;
      height:100%;
      z-index:-10;
      zoom: 1;
      background-size: 100%

    }
    h2 {
      display: block;
      font-size: 60px;
      color: transparent;
      margin-top: 30px;
      margin-left: 30px;
      -webkit-text-stroke: 2px #0DD2EF;
    }

    .box {
      width: 300px;
      height: 400px;
      margin-top: 50px;
      margin-left: 130px;
      background-color: rgba(9, 9, 8, 0.3);
      box-shadow:-1px 4px 28px 0px #000; ;
    }
    .box:hover{
      box-shadow:-8px 10px 36px 10px #000; ;
    }
    .box a button {
      display: inline-block;
      width: 120px;
      height: 40px;
      color: #ffffff;
      margin-top: -40px;
      margin-left: 20px;
      background-color: deepskyblue;
    }
    .box a button:hover {
      color: red;
    }
    .inp2 {
      display: inline-block;
      margin-top: 50px;
      margin-left: 160px;
      width: 120px;
      height: 40px;
      color: #ffffff;
      background-color: deepskyblue;
    }
    .inp2:hover {
      color: red;
    }
    .box header {
      color: white;
      font-size: 33px;
      font-weight: 600;
      margin-left: 34px;
      margin-bottom: 30px;
      font-family: 'Montserrat',sans-serif;
    }
    .field{
      position: relative;
      height: 45px;
      width: 100%;
      display: flex;
      background: rgba(255,255,255,0.94);
    }
    .field span{
      color: #222;
      width: 40px;
      line-height: 45px;
      text-align: center;
    }
    .field input{
      height: 100%;
      width: 100%;
      background: transparent;
      border: none;
      outline: none;
      color: #222;
      font-size: 16px;
      font-family: 'Poppins',sans-serif;
    }
    .space{
      margin-top: 24px;
    }
    .demo  {
      width: 500px;
      position: fixed;
      left: 30px;
      bottom: 0px;
      color: #807c89;

    }
    .demo a {
      text-decoration: none;
      float: left;
    }
    .demo h6 {
      font-size: 16px;
    }

  </style>
  <script type="text/javascript" src="text.js"></script>
  <body>
  <h2>欢迎使用学生管理系统</h2>
<%--   <h3><a href="StudentListServlet">显示所有学生列表</a></h3>--%>
<%--   <h3><a href="StudentListPageServlet?currentPage=1">分页显示所有学生列表</a></h3>--%>
<div class="box">
  <form action="LoginServlet" method="post">
    <header>LOGIN FROM</header>
    <div class="field">
    <span class="iconfont icon-user-fill"></span>
    <input type="text" required  placeholder=" Username"  name="username"/>
    </div>
    <div class="field space">
    <span class="iconfont  icon-lock-fill "></span>
    <input type="password"   required placeholder=" Password" name="password"/>
    </div>
    <input type="submit" class="inp2" value="LOGIN">
  </form>
  <a href="addUser.jsp"><button>JOIN</button></a>
</div>
  <div class="demo">
    <a href="http://beian.miit.gov.cn/" style="color: deepskyblue;">赣ICP备2020010924号-1</a>
    <h6>&copy;2020 潇七. All rights reserved</h6>
  </div>
  </body>
</html>
