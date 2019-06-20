<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/3
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/职业列表</title>
    <link rel="stylesheet" href="css/profession_style.css">
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
                <h1>职业列表</h1>
                <div>
                    <ul>
                        <strong>前端</strong>
                        <li><i style="background: url('img/web.png');width: 16px;height: 23px;"></i>Web前端工程师</li>
                        <li><i style="background: url('img/wechat.png');width: 16px;height: 13px;"></i>微信小程序</li>
                        <strong>移动端</strong>
                        <li><i style="background: url('img/andiord.png');width: 14px;height: 18px;"></i>Android工程师</li>
                        <li><i style="background: url('img/ios.png');width: 14px;height: 18px;"></i>iOS工程师</li>
                        <strong>后端</strong>
                        <li><i style="background: url('img/python.png');width: 16px;height: 15px;"></i>Python工程师</li>
                        <li><i style="background: url('img/php.png');width: 22px;height: 10px;"></i>PHP工程师</li>
                        <li><i style="background: url('img/golang.png');width: 16px;height: 15px;"></i>Golang工程师</li>
                        <li><i style="background: url('img/javaweb.png');width: 14px;height: 17px;"></i>JavaWeb工程师</li>
                        <strong>大数据</strong>
                        <li><i style="background: url('img/data.png');width: 18px;height: 23px;"></i>大数据平台研发工程师</li>
                        <strong>人工智能</strong>
                        <li><i style="background: url('img/ml.png');width: 18px;height: 23px;"></i>机器学习工程师</li>
                        <strong>区块链</strong>
                        <li><i style="background: url('img/qkl.png');width: 16px;height: 18px;"></i>区块链工程师</li>
                        <strong>设计</strong>
                        <li><i style="background: url('img/ui.jpg');width: 16px;height: 16px;"></i>UI/UX设计师</li>
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

