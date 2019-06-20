<%@ page import="OCP.vo.board" import="java.util.List" import="OCP.factory.DAOFactory" %>
<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/2
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线课程平台/信息地带</title>
    <link rel="stylesheet" href="css/update_style.css">
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
        <div id="main_content" >
            <div id="main_info">
                <%
                    String board_account=request.getParameter("board_account");
                    List<board> list=DAOFactory.getBoardDAOInstance().queryAll(board_account);

                %>
                <h1>留言信息</h1>
                <div>
                    <table border="0" width="100%">
                        <tr>
                            <td><img src="<%=list.get(0).getBoard_image()%>" alt="" width="50px" height="50px"><span style="color: #333;font-weight: bold;font-size: 20px;"><%=board_account%></span></td>
                        </tr>
                        <tr>
                            <td style="text-indent: 50px"><h4 style="color: #666"><%=list.get(0).getBoard_content()%></h4></td>
                        </tr>
                        <tr>
                            <td align="right"><h4 style="color: #666"><%=list.get(0).getBoard_date()%></h4></td>
                        </tr>
                    </table>
                </div>
                <h1>留言回复</h1>
                <form action="replyBoardServlet?account=<%=session.getAttribute("account")%>&board_account=<%=board_account%>" method="post">
                    <textarea name="reply_content" placeholder="小可耐你好啊，请输入回复内容哦！！！！！！！！！" style="width: 100%;height: 100px;"></textarea>
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
