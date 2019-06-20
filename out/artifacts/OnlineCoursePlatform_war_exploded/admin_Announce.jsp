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
    <title>在线课程平台/信息地带</title>
    <link rel="stylesheet" href="css/admin_announce_style.css">
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
                    <li><a href="admin_Announce.jsp">公告发布</a></li>
                    <li><a href="admin_Manage_Announce.jsp">公告管理</a></li>
                    <li><a href="admin_Manage_Board.jsp">留言管理</a></li>
                </ul>
            </nav>
            <div id="main_right">
                <h1>发布公告</h1>
                    <form action="addAnnounceServlet" method="post">
                        <h2>公告标题:</h2>
                        <input type="text" name="announce_title" style="margin-left: 105px">
                        <h2>公告内容：</h2>
                        <textarea name="announce_content" maxlength="200" style="margin-left: 105px"></textarea>
                        <p class="extra-tips">还可以输入 <span id="tipsNum">200</span> 字</p>
                        <h2>发布时间：</h2>
                        <input type="datetime-local" name="announce_date" style="margin-left: 105px">
                        <button type="submit">保存</button>
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
