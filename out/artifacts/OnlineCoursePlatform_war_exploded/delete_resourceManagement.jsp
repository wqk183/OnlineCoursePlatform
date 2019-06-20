<%@ page import="OCP.vo.video" import="java.util.List" import="OCP.util.SplitPage" %>
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
    <title>在线课程平台/用户管理</title>
    <link rel="stylesheet" href="css/update_resource_style.css">
    <script>
        function go(){
            var goPage=document.all.selectpage.value;
            alert("我们将去页面:list_notes.jsp?flag="+goPage);
            document.open("list_notes.jsp?flag="+goPage,"_self","");
        }
    </script>
</head>

<jsp:useBean id="spage1" class="OCP.util.SplitPage" scope="session"></jsp:useBean>
<jsp:useBean id="dao1" class="OCP.daoImpl.VideoDaoImpl" scope="session"></jsp:useBean>

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
                <h1>视频信息</h1>
                <%
                    request.setCharacterEncoding("utf-8");
                    String flag=request.getParameter("flag");
                    String strItem=request.getParameter("item");
                    String strContent=request.getParameter("content");
                    List<video> list =null;
                    HashMap<String,String> tm =new HashMap<>();
                    if(strContent==null||strContent==""||strContent.equals("")){
                        int totalRows=dao1.getSize().size();
                        spage1.setTotalRows(totalRows);
                        int currentPage=spage1.confirmPage(flag);
                        spage1.setPageRows(5);
                        spage1.setTotalRows(totalRows);//设定总页数
                        list=dao1.queryAll(spage1);
                    }else{
                        tm.put(strItem,strContent);
                        int totalRows=dao1.getRows(tm);
                        spage1.setTotalRows(totalRows);
                        int currentPage=spage1.confirmPage(flag);
                        spage1.setPageRows(5);
                        spage1.setTotalRows(totalRows);//设定总页数
                        list =dao1.queryByLike(tm,spage1);
                    }

                %>
                <table border="1px" width="760px">
                    <thead>
                    <th>id</th><th>视频名称</th><th>视频路径</th><th>操作</th>
                    </thead>

                    <%
                        for(video vid:list){
                    %>
                    <tr>
                        <td><%=vid.getId()%></td>
                        <td><%=vid.getVideo_name()%></td>
                        <td><%=vid.getLink()%></td>

                        <td><a href="deleteVideoServlet?id=<%=vid.getId()%>">删除</a></td>
                    </tr>
                    <%}  %>
                    <tr>
                        <td colspan="4" align="right">
                            <a href="update_resourceManagement.jsp?flag=<%=SplitPage.FIRSTPAGE%>">首页</a>
                            <a href="update_resourceManagement.jsp?flag=<%=SplitPage.PREVIOUSEPAGE %>">上一页</a>
                            <a href="update_resourceManagement.jsp?flag=<%=SplitPage.NEXTPAGE %>">下一页</a>
                            <a href="update_resourceManagement.jsp?flag=<%=SplitPage.LASTPAGE %>">最后页</a>
                            <select id="selectpage" name="goPage" onchange="javascript:go();">
                                <%
                                    for(int i=1;i<=spage1.getTotalPages();i++){
                                %>
                                <option value="<%=i%>" <%=(spage1.getCurrentPage()==+i)?"selected='selected'":"" %>><%=i%>/<%=spage1.getTotalPages()%>
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
