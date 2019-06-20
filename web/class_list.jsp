<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/3
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/课程列表</title>
    <link rel="stylesheet" href="css/class_style.css">
</head>
<body>
<div id="wrapper">
    <div id="header">
        <div id="main_title">
            <a href="main.html"><span style="color: green;font-size: 30px;">在线课程平台</span></a>
        </div>
        <div id="head">
            <ul>
                <li><a href="main.html">首页</a></li>
                <li><a href="profession_list.jsp">职业列表</a></li>
                <li><a href="class_list.jsp">课程列表</a></li>
                <li><a href="company_list.jsp">合作企业</a></li>
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
            <%--<a href="userInfor.jsp"><img src="<%=session.getAttribute("image")%>"></a>--%>

        </div>
    </div>
    <div id="main">
        <div id="main_content">
            <div id="main_info">
                <h1>课程列表</h1>
                <div>
                    <ul>
                        <strong>基础语言</strong>
                        <li>C | C++ | Objective-C | Swift | C# | Java | Perl | Shell | Qt | Scala</li>
                        <strong>计算机基础</strong>
                        <li>计算机组成原理 | 网络工程 | Excel | PowerPoint</li>
                        <strong>开发基础</strong>
                        <li>算法基础 | 数据结构 | 设计模式 | 软件工程</li>
                        <strong>开发工具</strong>
                        <li>Git/Github | SVN | VI</li>
                        <strong>开放标准</strong>
                        <li>OpenCL | Open XML | OpenGL/GLES</li>
                        <strong>计算机等级考试</strong>
                        <li>一级 | 二级C | 二级Java | 二级C++ | 网络工程师 | 数据库工程师 | 信息安全工程师</li>
                        <strong>企业认证</strong>
                        <li>思科认证 | Oracle认证 | Linux认证 | ARM认证</li>
                        <strong>运维管理</strong>
                        <li>Shell | 自动化运维 | Nginx | Apache | 运维监控</li>
                        <strong>商业智能</strong>
                        <li>FileMaker</li>
                        <strong>操作系统</strong>
                        <li>Linux | Windows | Mac OS</li>
                        <strong>企业服务</strong>
                        <li>B2C</li>
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

