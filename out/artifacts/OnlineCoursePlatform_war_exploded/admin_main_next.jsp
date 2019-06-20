<%--
  Created by IntelliJ IDEA.
  User: wqk183
  Date: 2019/6/4
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>在线课程平台/管理员层</title>
    <link rel="stylesheet" href="css/main_next_style.css">
    <link rel="stylesheet" href="bootstrap-4.0.0/dist/css/bootstrap.css">
    <script src="js/jquery-3.4.0.js"></script>
    <script src="bootstrap-4.0.0/dist/js/bootstrap.js"></script>
</head>
<body>
<div id="wrapper">
    <div id="header">
        <div id="main_title">
            <a href="main.html"><span style="color: green;font-size: 30px">在线课程平台</span></a>
        </div>
        <div id="head">
            <ul>
                <li><a href="admin_main_next.jsp">首页</a></li>
                <li><a href="addManagement.jsp">用户管理</a></li>
                <li><a href="add_resourceManagement.jsp">资源管理</a></li>
                <li><a href="admin_Announce.jsp">信息管理</a></li>
                <li><a href="main.html">退出登录</a></li>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="carousel slide" id="carousel-180347" >
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-180347" class="active">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-180347">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-180347">
                            </li>
                            <li data-slide-to="3" data-target="#carousel-180347">
                            </li>
                        </ol>
                        <div class="carousel-inner" style="padding-left:0px;width: 1366px;height: 360px">
                            <div class="carousel-item active">
                                <a href="video_resource.jsp"><img class="d-block w-100" alt="Carousel Bootstrap First" src="img/z3.jpg"/></a>
                            </div>
                            <div class="carousel-item">
                                <a href="video_resource.jsp"><img class="d-block w-100" alt="Carousel Bootstrap Second" src="img/z4.jpg" /></a>
                            </div>
                            <div class="carousel-item">
                                <a href="video_resource.jsp"> <img class="d-block w-100" alt="Carousel Bootstrap Third" src="img/z5.jpg" /></a>
                            </div>
                            <div class="carousel-item">
                                <a href="video_resource.jsp"><img class="d-block w-100" alt="Carousel Bootstrap Third" src="img/z6.jpg" /></a>
                            </div>
                        </div> <a class="carousel-control-prev" href="#carousel-180347" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-180347" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="main_content">
            <div id="main_son">
                <div class="newClass">
                    <h2>热门课程</h2>
                    <ul>
                        <li><a href="#"><img class="update_img" src="img/class1.jpeg" alt=""><p class="update_title">架构设计专项课程之页面静态化技术</p></a></li>
                        <li><a href="#"><img class="update_img" src="img/class2.png" alt=""><p class="update_title">微博热门话题系统架构设计</p></a></li>
                        <li><a href="#"><img class="update_img" src="img/class3.jpeg" alt=""><p class="update_title">从零开始学架构</p></a></li>
                        <li><a href="#"><img class="update_img" src="img/class4.png" alt=""><p class="update_title">项目实践</p></a></li>
                    </ul>
                </div>
                <div class="zhiye">
                    <h2>职业方向</h2>
                    <ul>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job1.png" alt="Android工程师">
                                <h3>Android工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job2.png" alt="Web前端工程师">
                                <h3>Web前端工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job3.png" alt="微信小程序工程师">
                                <h3>微信小程序工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job4.png" alt="Python工程师">
                                <h3>Python工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job5.png" alt="PHP工程师">
                                <h3>PHP工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job6.png" alt="Go语言工程师">
                                <h3>Go语言工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job7.png" alt="iOS工程师">
                                <h3>iOS工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job8.png" alt="大数据平台研发工程师">
                                <h3>大数据平台研发工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job9.png" alt="机器学习工程师">
                                <h3>机器学习工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job10.png" alt="JavaWeb工程师">
                                <h3>JavaWeb工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job11.png" alt="UI/UX设计师">
                                <h3>UI/UX设计师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job12.png" alt="区块链工程师">
                                <h3>区块链工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job13.png" alt="数据分析工程师">
                                <h3>数据分析工程师</h3>
                            </a>
                        </li>
                        <li class="status">
                            <a class="card " href="" target="_blank">
                                <img src="img/job14.png" alt="运维工程师">
                                <h3>运维工程师</h3>
                            </a>
                        </li>
                        <li>
                            <div class="card">
                                <img src="img/job15.png" alt="测试工程师" title="即将上线">
                                <h3>测试工程师</h3>
                            </div>
                        </li>
                    </ul>
                </div>
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
<script>
    $(".carousel").carousel({
        interval:2000,
        pause:false
    })
</script>
</body>
</html>
