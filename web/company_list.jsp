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
    <title>在线课程平台/合作企业</title>
    <link rel="stylesheet" href="css/company_style.css">
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
                <h1>合作企业</h1>
                <div>
                    <ul>
                        <strong>微软虚拟学院</strong>
                        <li>微软虚拟学院，Microsoft Virtual Academy 提供由世界级专家主讲的免费在线 IT、开发人员和数据科学培训，可帮助你培养技能并推动职业生涯发展。它是你开始了解 Microsoft 技术最佳场所，欢迎加入这个生机勃勃的社区。</li>
                        <strong>AWS</strong>
                        <li>AWS是世界上服务和应用广泛的云服务平台。通过位于全球16个不同区域的43个可用区（AZ），AWS向客户提供90多项功能全面的服务并获得了全球数百万客户的青睐。通过AWS的服务，客户能够有效地强化自身基础设施，提高敏捷度，降低成本。</li>
                        <strong>腾讯云</strong>
                        <li>腾讯云是腾讯公司倾力打造的面向广大企业和个人的公有云平台, 本系列课程深入讲解腾讯云在搭建站点、架构设计、运维管理，以及大数据和应用开发方面的应用，并辅以实战操作，让学生从零开始到学会使用云计算所能实现的各种功能。</li>
                        <strong>Qualcomm</strong>
                        <li>Qualcomm是全球3G、4G与下一代无线技术的领军企业，其产品和服务不仅仅局限于移动智能终端，目前的产品和业务已拓展至医疗、教育、汽车等多个行业，为迎接下一个数据大爆炸带来的“千倍数据”挑战，以及万物互联做好准备。本课程专为移动开发者打造，深入技术讲解，讲师均为Qualcomm资深工程师。</li>
                        <strong>图灵机器人</strong>
                        <li>图灵机器人基于 DeepQA 深度问答技术，是目前中文语境下智能度最高的机器人。图灵机器人提供免费 API 端口，接入简单、支持多平台及个性化设定。本系列课程讲解如何方便的在 Android、iOS、智能家居、车载、微信、微博、客服系统等平台搭建属于自己的个性化智能机器人。</li>
                        <strong>科大讯飞</strong>
                        <li>语音云开放平台是科大讯飞旗下的全球首个面向互联网开发者的智能语音交互平台，为开发者免费开放语音识别、语音合成、智能语义等服务。本系列课程将介绍如何在 Android、iOS、智能硬件、Unity 等平台上快速接入语音识别能力、语音合成能力、语义能力和唤醒能力等。</li>
                        <strong>Cocos</strong>
                        <li>Cocos 是一家开源游戏引擎开发商，主要的产品有 Cocos2d-x、Cocos2d-JS，核心优势在于允许开发人员利用 C++、Lua 及 Javascript 来进行跨平台部署，覆盖平台包括 iOS、Android、Windows Phone 等。本系列课程是由极客学院与 Cocos 引擎团队合作，推出的 Cocos2d-x & Cocos2d-JS 游戏引擎最新特性视频教学课程专区。</li>
                        <strong>神策</strong>
                        <li>大数据平台研发工程师主要负责基于海量数据的数据仓库建设和数据分析，同时针对各业务场景探索大数据解决方案，是数据分析、运维监控、推荐系统、精准广告等各类数据应用的基础支撑。本系列课程由神策数据（国内领先的大数据分析平台服务商）和极客学院联手打造，将为大家带来对应企业真实需求的实战课程。</li>
                        <strong>AMD</strong>
                        <li>AMD 设计并集成尖端技术，为包括电脑、游戏主机和云服务器等提供强大动力。AMD 解决方案让人们随时随地享受到所喜爱的设备和应用的全部潜力 。本课程带领开发者逐步掌握 OpenCL 并行程序的开发环境与 API，并通过分析 CPU、GPU 等不同处理器的特点，展开性能调优的高级话题。课程讲师均为 AMD 软件架构师与资深工程师。</li>
                        <strong>聚合数据</strong>
                        <li>聚合数据为国内最大的基础数据服务商，为包括京东、高德、泰康人寿在内的 20 万个人开发者及企业用户提供数据服务。聚合数据通过稳定的数据服务、高质量的数据接口、较低的数据成本为用户提供优质服务。本系列课程学习如何在 Android、iOS 等移动开发平台上快速接入海量数据。</li>
                        <strong>青云QingCloud</strong>
                        <li>青云QingCloud是全球首家实现资源秒级响应并按秒计量的基础云服务商，致力于为企业用户提供安全可靠、性能卓越、按需、实时的 IT 资源交付平台。其产品包含完整的IaaS层组件、PaaS层服务及超融合硬件设备。</li>
                        <strong>腾讯</strong>
                        <li>腾讯公司是目前中国最大的互联网综合服务提供商之一，也是中国服务用户最多的互联网企业之一。腾讯Bugly是腾讯公司为移动开发者开放的服务之一，提供了业界最专业的Crash(崩溃)监控和解决方案。本系列课程将针对Android、iOS平台应用，讲解应用Crash(崩溃)的常见方法，以及如何使用“腾讯Bugly”跟踪解决Crash(崩溃)问题。</li>
                        <strong>百度直达号</strong>
                        <li>直达号是商户在百度移动平台的官方服务账号。基于移动搜索需求精准匹配、@商家账号直达服务、手机百度“发现”、百度地图“附近”等多种方式，让亿万客户随时随地直达商户服务；更有CRM等大数据分析能力，助力商户做个性化推荐等服务，促进客户多频次消费。</li>
                        <strong>Testin</strong>
                        <li>Testin 云测是全球最大的独立第三方移动应用、游戏云测试服务平台，三大核心服务 QAMaster 围绕 App 的自动化真机云测试、极客专家测试、应用性能分析管理，为移动应用、游戏开发者提供不可或缺的移动 App 质量保证。本系列课程介绍如何使用 Testin 崩溃分析 SDK，实时监控 App 崩溃信息，快速定位并解决问题。</li>
                        <strong>微软</strong>
                        <li>微软是一家研发最为著名和畅销的操作系统 Windows 的科技公司，并研发运行于移动终端的 Windows Phone 操作系统。本系列课程包括 Windows Phone 应用开发基础、基于 C# 和 HTML5 的 Windows Phone 应用开发、Windows Phone 游戏开发、TypeScript 语言、.Net 开发、C# 开发等热门技术。</li>
                        <strong>灵雀云</strong>
                        <li>灵雀云是中国第一家基于容器，服务于完整开发周期的新一代云平台。灵雀云以容器这个新一代应用交付件为中心，全方位支持云端应用创建、编译、集成、部署、运行的每一个环节。我们提供持续集成服务用于轻松构建容器镜像。通过高性能Docker Hub服务用于创建私有、公有镜像仓库，实现镜像管理。同时，我们提供的容器托管服务，从云端与Docker技术对接，全面服务于容器化应用的整个生命周期。</li>
                        <strong>OneAPM</strong>
                        <li>OneAPM（北京蓝海讯通科技有限公司）是中国首家基于真实用户体验的应用性能管理（APM）服务提供商，致力于为客户的 IT 资源管理提供实时展示和性能分析，实现企业 IT 资源管理的价值最大化。本系列课程将针对 Android、iOS 平台，讲解 OneAPM 应用性能分析工具是如何进行崩溃分析的。</li>
                        <strong>友盟</strong>
                        <li>友盟是中国最大、最专业的移动开发者服务平台以及移动互联网数据平台，目前已合作 52 万款 APP，日启动超过 67 亿次。本系列课程讲解友盟应用统计分析、游戏统计分析、社会化分享和消息推送的集成与使用，帮助开发者解决实际技术问题。</li>
                        <strong>微软开放技术</strong>
                        <li>微软开放技术有限公司是微软为进一步推动在互操作性、开放标准以及开源项目等方面而成立的全资子公司。主要由标准化、技术推广专家组成，旨在推动开源工程最佳实践的交流与发展，促进开放技术标准规范的发展，从而提供更平滑的跨软硬件用户体验。本系列课程将涵盖微软众多开源技术，如：Open XML SDK, VM Depot, Azure 等。</li>
                        <strong>机智云</strong>
                        <li>机智云是目前国内外最大的智能硬件集群之一，主要面向消费类、商用类智能硬件厂家、创业团队与个人开发者提供智能硬件云服务和一系列快速开发工具。截至2014年底，机智云平台智能硬件设备全球出货激活总量超过 200 万台。</li>
                        <strong>DaoCloud</strong>
                        <li>DaoCloud是领先的企业级容器云平台和解决方案提供商，致力于以Docker容器技术为基础，为企业打造面向下一代互联网应用的交付和运维平台，帮助客户实现云端持续创新。DaoCloud提供一站式容器化应用管理服务，同时为大企业提供基于容器技术的开发运维联动和混合云平台解决方案。</li>
                        <strong>FileMaker</strong>
                        <li>FileMaker, Inc. 是苹果公司的全资子公司，提供可轻松定制在 iPad、iPhone、Windows、Mac 和 Web 上跨平台无缝运行的商务解决方案的数据库软件。全世界数百万用户都依赖 FileMaker 平台共享信息、管理项目、追踪资产等等。</li>
                        <strong>听云</strong>
                        <li>听云应用性能管理平台，提供最全面的移动 App 及网站性能监测。同时听云平台还提供领先的 App、Server 监测方案，及时发现、定位、解决 App 使用过程中的问题，通过听云平台开发者可以降低用户流失比例，提高用户留存率。本系列课程介绍如何在移动平台快速集成听云 SDK，对 App 性能实时监测并给出毫秒级报警通知。</li>
                        <strong>CloudStack</strong>
                        <li>CloudStack 是一个开源的具有高可用性及扩展性的云计算平台, 也是一个开源云计算解决方案。CloudStack 中国社区是为国内广大CloudStack 爱好者提供有关 Apache CloudStack 部署、运维、开发等有关内容，以及沟通交流的平台。本系列课程讲解 CloudStack 的基础安装与配置，包括管理节点，存储，XenServer 等一系列内容。</li>
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

