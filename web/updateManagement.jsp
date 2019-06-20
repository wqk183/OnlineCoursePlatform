<%@ page import="OCP.vo.person" import="java.util.List" import="OCP.util.SplitPage" %>
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
    <link rel="stylesheet" href="css/updateManagement_style.css">
    <script>
        function go(){
            var goPage=document.all.selectpage.value;
            alert("我们将去页面:list_notes.jsp?flag="+goPage);
            document.open("list_notes.jsp?flag="+goPage,"_self","");
        }
    </script>
</head>

<jsp:useBean id="spage" class="OCP.util.SplitPage" scope="session"></jsp:useBean>
<jsp:useBean id="dao" class="OCP.daoImpl.PersonDaoImpl" scope="session"></jsp:useBean>

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
                    <li><a href="addManagement.jsp">添加用户</a></li>
                    <li><a href="updateManagement.jsp">修改用户</a></li>
                    <li><a href="deleteManagement.jsp">删除用户</a></li>
                    <li><a href="searchManagement.jsp">查看用户</a></li>
                </ul>
            </nav>
            <div id="main_right">
                <h1>用户信息</h1>
                   <%
                       request.setCharacterEncoding("utf-8");
                       String flag=request.getParameter("flag");
                       String strItem=request.getParameter("item");
                       String strContent=request.getParameter("content");
                       List<person> list =null;
                       HashMap<String,String> tm =new HashMap<>();
                       if(strContent==null||strContent==""||strContent.equals("")){
                           int totalRows=dao.getSize().size();
                           spage.setTotalRows(totalRows);
                           int currentPage=spage.confirmPage(flag);
                           spage.setPageRows(5);
                           spage.setTotalRows(totalRows);//设定总页数
                           list=dao.queryAll(spage);
                       }else{
                           tm.put(strItem,strContent);
                           int totalRows=dao.getRows(tm);
                           spage.setTotalRows(totalRows);
                           int currentPage=spage.confirmPage(flag);
                           spage.setPageRows(5);
                           spage.setTotalRows(totalRows);//设定总页数
                           list =dao.queryByLike(tm,spage);
                       }

                   %>
                   <table border="1px" width="760px">
                       <thead>
                       <th>id</th><th>账号</th><th>密码</th><th>头像</th><th>姓名</th><th>性别</th><th>年龄</th><th>地址</th><th>简介</th><th>职业状态</th><th>职业方向</th><th>身份</th><th>操作</th>
                       </thead>

                       <%
                           for(person per:list){
                       %>
                       <tr>
                           <td><%=per.getId() %></td>
                           <td><%=per.getAccount() %></td>
                           <td><%=per.getPassword() %></td>
                           <td><%=per.getImage() %></td>
                           <td><%=per.getName() %></td>
                           <td><%=per.getSex() %></td>
                           <td><%=per.getAge() %></td>
                           <td><%=per.getAddress() %></td>
                           <td><%=per.getIntroducing() %></td>
                           <td><%=per.getJob() %></td>
                           <td><%=per.getJob_direction() %></td>
                           <td><%=per.getIdentity() %></td>
                           <td><a href="updateUser.jsp?account=<%=per.getAccount()%>">修改</a></td>
                       </tr>
                       <%}  %>
                       <tr>
                           <td colspan="13" align="right">
                               <a href="updateManagement.jsp?flag=<%=SplitPage.FIRSTPAGE%>">首页</a>
                               <a href="updateManagement.jsp?flag=<%=SplitPage.PREVIOUSEPAGE %>">上一页</a>
                               <a href="updateManagement.jsp?flag=<%=SplitPage.NEXTPAGE %>">下一页</a>
                               <a href="updateManagement.jsp?flag=<%=SplitPage.LASTPAGE %>">最后页</a>
                               <select id="selectpage" name="goPage" onchange="javascript:go();">
                                   <%
                                       for(int i=1;i<=spage.getTotalPages();i++){
                                   %>
                                   <option value="<%=i%>" <%=(spage.getCurrentPage()==+i)?"selected='selected'":"" %>><%=i%>/<%=spage.getTotalPages()%>
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
