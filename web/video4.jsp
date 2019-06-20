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
    <link rel="stylesheet" href="css/video_ing_style.css">
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
            <div id="main_info">
                <p>当前位置：<span style="color: #999">课程视频 > 大数据 Hadoop 离线分布式系统入门</span></p><br><br>
                <h3>大数据 Hadoop 离线分布式系统入门</h3>
                <div id="videoING">
                    <video src="video/G.E.M.%20邓紫棋-光年之外%20(《太空旅客》电影中国区主题曲)(超清).mp4" controls="controls"></video>
                </div>
                <div id="class_introducing">
                    <h2>课程介绍</h2>
                    <hr>
                    <span style="font-size:16px;"><strong>课程简介</strong></span>
                    <p style="text-indent:32px">持久层框架是 Java 开发的重要部分，但是现在流行的 Hibernate 是一种比较重型的框架，MyBatis作用一种轻量化的开源持久层框架，可以提高开发效率，同时MyBatis也是一种方便掌握与使用的框架。MyBatis 最大的优点就是 SQL 与代码完全分离。提高 Java 开发的规范性与可扩展性。</p>
                    <br>
                    <p><strong>核心内容：</strong><br>1. MyBatis 历史<br>2. MyBatis 特点<br>3. MyBatis 环境搭建<br>4. MyBatis 配置文件<br></p>
                    <br>
                    <p><strong>软件环境：</strong>MyBatis3.2.8、eclipse-jee-luna、mysql5.6</p><br>
                    <p><strong>适合人群：</strong>已完成 Java JDBC、Java Web 课程、数据库基础课程的极客</p>
                </div>
                <div id="class_paltform">
                    <h2>课程介绍</h2>
                    <hr>
                    <p style="text-indent:32px">使用高校学习平台，您可以轻松地、体系化地进行IT技术学习，您可以在平台中在线学习您感兴趣的课程，也可以非常方便地一键下载所有配套的教学资源。高校学习平台也会按照学习轨迹帮助您完成老师布置的教学任务，包括预习任务、上课、随堂练习、课后作业以及考试。同时配备了问答系统问答精灵，随时随地解决您在IT学习过程中遇到的各类难题。
                    </p>
                </div>
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
