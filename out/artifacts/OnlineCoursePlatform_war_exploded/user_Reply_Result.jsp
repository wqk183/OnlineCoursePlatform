<%@ page import="OCP.vo.reply" import="java.util.List" import="OCP.util.SplitPage" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="css/user_reply_result_style.css">
    <script>
        function go(){
            var goPage=document.all.selectpage.value;
            alert("我们将去页面:list_notes.jsp?flag="+goPage);
            document.open("list_notes.jsp?flag="+goPage,"_self","");
        }
    </script>
</head>

<jsp:useBean id="spage5" class="OCP.util.SplitPage" scope="session"></jsp:useBean>
<jsp:useBean id="dao5" class="OCP.daoImpl.ReplyDaoImpl" scope="session"></jsp:useBean>

<body>
<div id="wrapper">
    <div id="header">
        <div id="main_title">
            <a href="main.html"><span style="color: green;font-size: 30px;">在线课程平台</span></a>
        </div>
        <div id="head">
            <ul>
                <li><a href="admin_main_next.jsp">首页</a></li>
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
            <a href="adminInfo.jsp"><img src="<%=session.getAttribute("image")%>"></a>

        </div>
    </div>
    <div id="main">
        <div id="main_content">
            <nav id="main_left">
                <ul>
                    <li><a href="user_Manage_Board.jsp">留言地带</a></li>
                    <li><a href="user_Reply_Result.jsp">回复信息</a></li>
                    <li><a href="user_Announce.jsp">公告信息</a></li>
                </ul>
            </nav>
            <div id="main_right">
                <h1>回复信息</h1>

                <%-- <%
                         System.out.println(session.getAttribute("account"));
                 %>--%>
                <%
                    request.setCharacterEncoding("utf-8");
                    String flag=request.getParameter("flag");
                    String strItem=request.getParameter("item");
                    String strContent=request.getParameter("content");
                    List<reply> list =null;
                    HashMap<String,String> tm =new HashMap<>();
                    if(strContent==null||strContent==""||strContent.equals("")){
                        int totalRows=dao5.getSize().size();
                        spage5.setTotalRows(totalRows);
                        int currentPage=spage5.confirmPage(flag);
                        spage5.setPageRows(5);
                        spage5.setTotalRows(totalRows);//设定总页数
                        list=dao5.queryAll(spage5);
                    }else{
                        tm.put(strItem,strContent);
                        int totalRows=dao5.getRows(tm);
                        spage5.setTotalRows(totalRows);
                        int currentPage=spage5.confirmPage(flag);
                        spage5.setPageRows(5);
                        spage5.setTotalRows(totalRows);//设定总页数
                        list =dao5.queryByLike(tm,spage5);
                    }

                %>
                <table border="0" width="760px">
                    <%
                        for(reply reply:list){
                    %>
                    <tr>
                        <td><img src="<%=reply.getBoard_image()%>" alt="" width="50px" height="50px"><a href="user_Reply_Board.jsp?board_account=<%=reply.getBoard_account()%>"><span style="color: #333;font-weight: bold;font-size: 20px;"><%=reply.getBoard_account()%></span></a></td>
                    </tr>
                    <tr>
                        <td style="text-indent: 50px"><h4 style="color: #666"><%=reply.getBoard_content()%></h4></td>
                    </tr>
                    <tr>
                        <td align="right"><h4 style="color: #666"><%=reply.getBoard_date()%></h4></td>
                    </tr>
                    <tr><td colspan="8">
                        <hr></td></tr>
                        <tr style="text-indent:50px;"><td><h4>回复信息：</h4></td></tr>
                        <tr style="text-indent:50px;">
                            <td><img src="<%=reply.getReply_image()%>" alt="" width="50px" height="50px"><span style="color: #333;font-weight: bold;font-size: 20px;"><%=reply.getBoard_account()%></span></td>
                        </tr>
                        <tr style="text-indent:50px;">
                            <td style="text-indent: 50px"><h4 style="color: #666"><%=reply.getReply_content()%></h4></td>
                        </tr>
                        <tr style="text-indent:50px;">
                            <td align="right"><h4 style="color: #666"><%=reply.getReply_date()%></h4></td>
                        </tr>
                    <tr><td colspan="4">
                        <hr></td></tr>
                    <%}  %>
                    <tr>
                        <td colspan="4" align="right" style="padding-top: 20px;">
                            <a href="user_Reply_Result.jsp?flag=<%=SplitPage.FIRSTPAGE%>">首页</a>
                            <a href="user_Reply_Result.jsp?flag=<%=SplitPage.PREVIOUSEPAGE %>">上一页</a>
                            <a href="user_Reply_Result.jsp?flag=<%=SplitPage.NEXTPAGE %>">下一页</a>
                            <a href="user_Reply_Result.jsp?flag=<%=SplitPage.LASTPAGE %>">最后页</a>
                            <select id="selectpage" name="goPage" onchange="javascript:go();">
                                <%
                                    for(int i=1;i<=spage5.getTotalPages();i++){
                                %>
                                <option value="<%=i%>" <%=(spage5.getCurrentPage()==+i)?"selected='selected'":"" %>><%=i%>/<%=spage5.getTotalPages()%>
                                        <%}%>
                            </select>
                        </td>
                    </tr>
                </table>
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
