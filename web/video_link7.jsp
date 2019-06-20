<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/5/17
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/视频资源</title>
    <link rel="stylesheet" href="css/video_link_style.css">
</head>
<body>
<div id="wrapper">
    <div id="header">
        <div id="main_title">
            <a href="main.html"><span style="color: green;font-size: 30px;">在线课程平台</span></a>
        </div>
        <div id="head">
            <ul>
                <li><a href="user_main_next.jsp">首页</a></li>
                <li><a href="userInfor.jsp">个人信息</a></li>
                <li><a href="video_resource.jsp">视频资源</a></li>
                <li><a href="user_Manage_Board.jsp">信息地带</a></li>
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
            <a href="userInfor.jsp"><img src="<%=session.getAttribute("image")%>"></a>

        </div>
    </div>
    <div id="main">
        <div id="main_content">
            <div id="main_video_title">
                <span>课程分类：</span>
                <ul class="listTilte">
                    <li><a href="video_resource.jsp">全部</a></li>
                    <li><a href="video_link1.jsp">等级考试</a></li>
                    <li><a href="video_link2.jsp">大数据</a></li>
                    <li><a href="video_link3.jsp">Java</a></li>
                    <li><a href="video_link4.jsp">Python</a></li>
                    <li><a href="video_link5.jsp">Web前端</a></li>
                    <li><a href="video_link6.jsp">PHP</a></li>
                    <li><a href="video_link7.jsp">UI设计</a></li>
                    <li><a href="video_link8.jsp">Android</a></li>
                    <li><a href="video_link9.jsp">iOS</a></li>
                    <li><a href="video_link10.jsp">C/C++</a></li>
                    <li><a href="video_link11.jsp">软件测试</a></li>
                    <li><a href="video_link12.jsp">智能机器人</a></li>
                </ul>
            </div>
            <div id="main_video">
                <ul>
                    <li>
                        <a href="video7.jsp">
                            <div class="courseBox" >
                                <div class="imgBox"><img src="img/f7.jpg" alt=""></div>
                                <div class="infoBox"><p>WebAPIS视频教程</p></div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
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
</body>
</html>
