<%@ page import="OCP.vo.announce" import="java.util.List" import="OCP.util.SplitPage" %>
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
    <link rel="stylesheet" href="css/update_resource_style.css">
    <script>
        function go(){
            var goPage=document.all.selectpage.value;
            alert("我们将去页面:list_notes.jsp?flag="+goPage);
            document.open("list_notes.jsp?flag="+goPage,"_self","");
        }
    </script>
</head>

<jsp:useBean id="spage2" class="OCP.util.SplitPage" scope="session"></jsp:useBean>
<jsp:useBean id="dao2" class="OCP.daoImpl.AnnounceDaoImpl" scope="session"></jsp:useBean>

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
                <h1>公告信息</h1>
                <%
                    request.setCharacterEncoding("utf-8");
                    String flag=request.getParameter("flag");
                    String strItem=request.getParameter("item");
                    String strContent=request.getParameter("content");
                    List<announce> list =null;
                    HashMap<String,String> tm =new HashMap<>();
                    if(strContent==null||strContent==""||strContent.equals("")){
                        int totalRows=dao2.getSize().size();
                        spage2.setTotalRows(totalRows);
                        int currentPage=spage2.confirmPage(flag);
                        spage2.setPageRows(5);
                        spage2.setTotalRows(totalRows);//设定总页数
                        list=dao2.queryAll(spage2);
                    }else{
                        tm.put(strItem,strContent);
                        int totalRows=dao2.getRows(tm);
                        spage2.setTotalRows(totalRows);
                        int currentPage=spage2.confirmPage(flag);
                        spage2.setPageRows(5);
                        spage2.setTotalRows(totalRows);//设定总页数
                        list =dao2.queryByLike(tm,spage2);
                    }

                %>
                <table border="0" width="760px">
                   <%-- <thead>
                    <th>id</th><th>公告标题</th><th>公告内容</th><th>发布时间</th><th>操作</th>
                    </thead>--%>

                    <%
                        for(announce ann:list){
                    %>
                    <tr>
                        <td><h3 style="color: #333;font-weight: bold;"><%=ann.getId()+"."+ann.getAnnounce_title()%></h3></td>
                        <%--<td><h2><%=ann.getAnnounce_title()%></h2></td>--%>
                    </tr>
                       <tr>
                        <td style="text-indent: 40px"><h4 style="color: #666"><%=ann.getAnnounce_content()%></h4></td>
                       </tr>
                       <tr>
                           <td  align="right"><h4 style="color: #666"><%=ann.getAnnounce_date()%></h4></td>
                        <td style="text-align: center">
                            <a href="updateAnnounce.jsp?announce_title=<%=ann.getAnnounce_title()%>">修改</a><i>|</i>
                            <a href="deleteAnnounceServlet?id=<%=ann.getId()%>">删除</a>
                        </td>

                    </tr>
                    <tr><td colspan="5">
                        <hr></td></tr>
                    <%}  %>
                    <tr>
                        <td colspan="5" align="right">
                            <a href="admin_Manage_Announce.jsp?flag=<%=SplitPage.FIRSTPAGE%>">首页</a>
                            <a href="admin_Manage_Announce.jsp?flag=<%=SplitPage.PREVIOUSEPAGE %>">上一页</a>
                            <a href="admin_Manage_Announce.jsp?flag=<%=SplitPage.NEXTPAGE %>">下一页</a>
                            <a href="admin_Manage_Announce.jsp?flag=<%=SplitPage.LASTPAGE %>">最后页</a>
                            <select id="selectpage" name="goPage" onchange="javascript:go();">
                                <%
                                    for(int i=1;i<=spage2.getTotalPages();i++){
                                %>
                                <option value="<%=i%>" <%=(spage2.getCurrentPage()==+i)?"selected='selected'":"" %>><%=i%>/<%=spage2.getTotalPages()%>
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
