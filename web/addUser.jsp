<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2020/11/21
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册账号</title>
</head>
<link rel="stylesheet" href="fonts/iconfont.css">
<style>
    body{
        background-image: url("https://cdn.jsdelivr.net/gh/xuyikai1/xuyikai1.github.io/medias/featureimages/1.jpg");
        position:fixed;
        top: 0;
        left: 0;
        width:100%;
        height:100%;
        z-index:-10;
        zoom: 1;
        background-size: 100%
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
    .space {
        margin-top: 24px;
    }
    .box {
        width: 300px;
        height: 400px;
        margin: 100px auto;
        background-color: rgba(9, 9, 8, 0.3);
        box-shadow:-1px 4px 28px 0px #000; ;
    }
    .box:hover {
        box-shadow:-8px 10px 36px 10px #000; ;
    }
    .box header{
        color: white;
        font-size: 33px;
        font-weight: 600;
        margin-left: 87px;
        margin-bottom: 30px;
        font-family: 'Montserrat',sans-serif;
    }
    .inp {
        height: 40px;
        width: 100%;
        background-color: #0DD2EF;
        border: 1px solid;
        outline: none;
        color: #ffffff;
        margin-top: 30px;
        font-size: 30px;
        font-family: 'Poppins',sans-serif;
    }
    .inp:hover{
        color: red;
    }
</style>
<script type="text/javascript" src="text.js" ></script>
<body>
<form method="post" action="RegisterServlet">
<%--    <input type="text" name="username" placeholder="username"><br>--%>
<%--    <input type="password" name="password" placeholder="password"><br>--%>
<%--    <input type="submit" value="JOIN">--%>
    <div class="box">
        <header>Sign In</header>
    <div class="field">
        <span class="iconfont icon-user-fill"></span>
        <input type="text" required  placeholder=" Username"  name="username"/>
    </div>
    <div class="field space">
        <span class="iconfont  icon-lock-fill "></span>
        <input type="password"   required placeholder=" Password" name="password"/>
    </div>
    <input type="submit" class="inp" value="JOIN">
    </div>
</form>
</body>
</html>
