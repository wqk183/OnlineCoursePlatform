<%@ page import="OCP.vo.person" import="java.util.List" import="OCP.factory.DAOFactory" %>
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
    <title>在线课程平台/个人资料</title>
    <link rel="stylesheet" href="css/userInfor_style.css">
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
            <div id="main_info">
               <%
                   String account=request.getParameter("account");
                   List<person> list=DAOFactory.getPersonDAOInstance().queryAll(account);
               %>
                <h1>修改个人资料</h1>
                <h2>基本信息</h2>
                <form action="updateServlet" method="post">
                    <ul>
                        <li>
                            <label>头像：</label>
                            <img src="<%=list.get(0).getImage()%>" height="70">
                            <span><a href="user_updateImage.jsp?image=<%=list.get(0).getImage()%>">修改头像</a></span>
                        </li>
                        <li>
                            <label>用户名：</label>
                            <input type="text" name="account" value="<%=list.get(0).getAccount()%>">
                        </li>
                        <li>
                            <label>密码：</label>
                            <input type="text" name="password" value="<%=list.get(0).getPassword()%>">
                        </li>
                        <li>
                            <label>真实姓名：</label>
                            <input type="text" name="name" value="<%=list.get(0).getName()%>">
                        </li>
                        <li>
                            <label>性别：</label>
                            <input type="text" name="sex" value="<%=list.get(0).getSex()%>">
                        </li>
                        <li>
                            <label>年龄：</label>
                            <input type="text" name="age" value="<%=list.get(0).getAge()%>">
                        </li>
                        <li>
                            <label>现居地址：</label>
                            <input type="text" name="address" value="<%=list.get(0).getAddress()%>">
                        </li>
                        <li>
                            <label>个人简介：</label>
                            <textarea name="introducing" maxlength="300" <%--placeholder="<%=session.getAttribute("introducing")%>"--%>><%=list.get(0).getIntroducing()%></textarea>
                            <p class="extra-tips">还可以输入 <span id="tipsNum">200</span> 字</p>
                        </li>
                        <br><br><br><br><br>
                        <hr>
                        <h2>职业信息</h2>
                        <li>
                            <label>职业状态:</label>
                            <input type="text" name="job" value="<%=list.get(0).getJob()%>">
                        </li>
                        <li>
                            <label>职业方向:</label>
                            <input type="text" name="job_direction" value="<%=list.get(0).getJob_direction()%>">
                        </li>
                        <br>
                        <hr>
                        <h2>身份信息</h2>
                        <label>身份:</label>
                        <input type="text" name="identity" value="<%=list.get(0).getIdentity()%>">
                    </ul>
                    <button type="submit">保存</button>
                </form>
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
