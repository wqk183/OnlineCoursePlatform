<%@ page import="OCP.vo.video" import="java.util.List" import="OCP.factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/5
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/资源管理</title>
    <link rel="stylesheet" href="css/add_resource_style.css">
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
                    <li><a href="add_resourceManagement.jsp">添加资源</a></li>
                    <li><a href="update_resourceManagement.jsp">修改资源</a></li>
                    <li><a href="delete_resourceManagement.jsp">删除资源</a></li>
                    <li><a href="search_resourceManagement.jsp">查看资源</a></li>
                </ul>
            </nav>
            <div id="main_right">
                <%
                    String video_name=request.getParameter("video_name");
                    List<video> list= DAOFactory.getVideoDAOInstance().queryAll(video_name);
                %>
                <h1>视频课程资料</h1>
                <h2>基本信息</h2>
                <form action="addVideoServlet" method="post">
                    <ul>
                        <li style="margin-bottom: 20px;">
                            <label>视频名称：</label>
                            <input type="text" name="account" value="<%=list.get(0).getVideo_name()%>">
                        </li>
                        <li style="margin-bottom: 20px;">
                            <label>视频路径：</label>
                            <input type="text" name="password" value="<%=list.get(0).getLink()%>">
                        </li>
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
