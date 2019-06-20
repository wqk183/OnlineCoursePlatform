<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/5
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/用户管理</title>
    <link rel="stylesheet" href="css/user_management_style.css">
<%--    <script>
        window.onload=function () {
            var main_left=document.getElementById("main_left");
            var links=document.getElementsByTagName("a");
            for (var i=0;i<links.length;i++){
                links[i].onclick=function () {
                    links[i].style['color']='#35b558';
                    return true;
                    }

            }
        }
    </script>--%>
    <script>
        function setImg(obj) {
            var imageSrc = document.getElementById("image").value;
            document.getElementById("pic").src = imageSrc;
        }
    </script>
</head>
<body>
<div id="wrapper">
    <div id="header">
        <div id="main_title">
            <a href="main.html"><span style="color: green;font-size: 30px;">在线课程平台</span></a>
        </div>
        <div id="head">
            <ul>
                <li><a href="admin_main_next.jsp">首页</a></li>
                <li><a href="addManagement.jsp">用户管理</a></li>
                <li><a href="add_resourceManagement.jsp">资源管理</a></li>
                <li><a href="admin_Announce.jsp">信息管理</a></li>
            </ul>

        </div>
        <div id="search">
            <form action="searchServlet" method="post">
                <input type="text" name="searching" id="searching" placeholder="搜索课程" style="border: 1px solid gainsboro;">
                <!--<span style="border: 1px solid gainsboro;padding: 1px"><img src="img/search.png"></span>-->
                <input type="submit" value="搜索">
            </form>
        </div>
        <div id="other">
            <a href="adminInfo.jsp"><img src="<%=session.getAttribute("image")%>"></a>

        </div>
    </div>
    <div id="main">
        <div id="main_content">
                <nav id="main_left">
                    <ul>
                        <li><a href="addManagement.jsp">添加用户</a></li>
                        <li><a href="updateManagement.jsp">修改用户</a></li>
                        <li><a href="deleteManagement.jsp">删除用户</a></li>
                        <li><a href="searchManagement.jsp">查看用户</a></li>
                    </ul>
                </nav>
                <div id="main_right">
                    <h1>个人资料</h1>
                    <h2>基本信息</h2>
                    <form action="addServlet" method="post">
                        <ul>
                            <li style="margin-bottom: 20px;">
                                <label>用户名：</label>
                                <input type="text" name="account" >
                            </li>
                            <li style="margin-bottom: 20px;">
                                <label>密码：</label>
                                <input type="text" name="password" >
                            </li>
                            <li>
                                <label>性别：</label>
                                <select id="sex" name="sex" style="width: 164px;">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </li>
                            <li>
                                <label style="margin-top: 50px">头像：</label>
                                <select id="image" name="image" onchange="setImg(this)" style="width: 95px">
                                    <option value="img/1.jpg">头像一</option>
                                    <option value="img/2.jpg">头像二</option>
                                    <option value="img/3.jpg">头像三</option>
                                    <option value="img/4.jpg">头像四</option>
                                </select>
                                <img id="pic" src="img/1.jpg"  style="width: 70px;height: 70px;"/>
                            </li>
                            <hr>
                            <h2>身份信息</h2>
                            <label>身份:</label>
                            <select id="identity" name="identity" style="width: 164px;">
                                <option value="普通用户">普通用户</option>
                                <option value="管理员">管理员</option>
                            </select>
                        </ul>
                        <button type="submit">提交</button>
                    </form>
                </div>
        </div>
        <div id="footer" style="height: 100px;margin-top: 20px;padding-top: 15px">
            <div id="nav">
                <ul>
                    <a href="#" target="_blank">关于我们</a><i>|</i>
                    <a href="#" target="_blank">加入我们</a><i>|</i>
                    <a href="#" target="_blank">联系我们</a><i>|</i>
                    <a href="#">企业合作</a><i>|</i>
                    <a href="#" target="_blank">讲师合作</a><i>|</i>
                    <a href="#" target="_blank">帮助中心</a><i>|</i>
                    <a href="#" target="_blank">黑板报</a><i>|</i>
                    <a href="#" target="_blank">友情链接</a>
                </ul>
            </div>
            <div class="copyright">
                <p >Copyright © 2019 jikexueyuan.com All Rights Reserved. 京ICP备11018032号 京公网安备11010802013056</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
