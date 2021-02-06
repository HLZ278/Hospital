<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>home</title>
    <script src="js/popper.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/home.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>
<%--轮播图--%>
<div class="myContainer">
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- 指示符 -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- 轮播图片 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="containerImg" src="images/web-banner1.png">
            </div>
            <div class="carousel-item">
                <img class="containerImg" src="images/web-banner1.png">
            </div>
            <div class="carousel-item">
                <img class="containerImg" src="images/web-banner1.png">
            </div>
        </div>

        <!-- 左右切换按钮 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

    </div>
</div>
<div class="main">
    <div class="left">
        <%--   医院搜索框   --%>
        <div class="search">
            <svg t="1609910073093" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 p-id="2648" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20">
                <defs>
                    <style type="text/css"></style>
                </defs>
                <path d="M945.28512 875.7248l-159.02208-156.11904c50.65216-67.06688 81.0496-150.27712 81.0496-240.80384 0-221.12256-179.21536-400.37888-400.37376-400.37888-221.13792 0-400.384 179.25632-400.384 400.37888 0 221.16352 179.24096 400.39936 400.384 400.39936 101.888 0 194.62144-38.38464 265.27744-101.05856l159.24736 156.32896c15.6416 15.36512 40.36608 14.71488 55.2448-1.47456 14.84288-16.19456 14.21824-41.856-1.42336-57.27232z m-478.32064-67.15392c-182.10816 0-329.71776-147.6352-329.71776-329.74336 0-182.08768 147.61472-329.728 329.71776-329.728 182.0928 0 329.71776 147.6352 329.71776 329.728 0 182.10816-147.62496 329.74336-329.71776 329.74336z"
                      fill="#575757" p-id="2649"></path>
            </svg>
            <input type="text" id="hospitalName" name="hospitalName" autocomplete="off" placeholder="点击输入医院名称"/>
            <button type="button" onclick="findHospitalByName()" class="weightText">搜索</button>
        </div>
        <div style="margin-top: 20px; margin-left: 2px;">
            <font class="weightText">按条件搜索</font>
        </div>
        <div class="condition">
            <font class="weightText">等级:</font>
            <a class="level" href="JavaScript:searchLevel('全部')">全部</a>
            <a class="level" href="JavaScript:searchLevel('三级甲等')">三级甲等</a>
            <a class="level" href="JavaScript:searchLevel('二级甲等')">二级甲等</a><br/>
            <a class="level" style="margin-left: 50px" href="JavaScript:searchLevel('一级甲等')">一级甲等</a>
        </div>
        <div class="condition">
            <font class="weightText">地区:</font>
            <a class="area" href="JavaScript:searchArea('全部')">全部</a>
            <a class="area" href="JavaScript:searchArea('中山区')">中山区</a>
            <a class="area" href="JavaScript:searchArea('西岗区')">西岗区</a>
            <a class="area" href="JavaScript:searchArea('沙河口区')">沙河口区</a><br/>
            <a class="area" style="margin-left: 50px" href="JavaScript:searchArea('甘井子区')">甘井子区</a>
            <a class="area" href="JavaScript:searchArea('旅顺口区')">旅顺口区</a>
            <a class="area" href="JavaScript:searchArea('金州区')">金州区</a><br/>
            <a class="area" style="margin-left: 50px" href="JavaScript:searchArea('普兰店区')">普兰店区</a>
        </div>


        <div class="notice">
            <h3>公告</h3>
            <c:forEach var="notice" items="${ notices }" varStatus="status">
                <div class="noticeTitle">
                    <div></div>
                    <a href="JavaScript:noticeItem(${notice.getNoticeID()})">${notice.getTitle()}</a>
                </div>
            </c:forEach>
        </div>
    </div>
    <%-- 医院部分   --%>
    <div class="right" style="height: 700px">
        <%--    医院卡片部分，一个item就是一个卡片    --%>
        <c:forEach var="hospital" items="${ hospitals }" varStatus="status">
            <c:choose>
                <c:when test="${status.index%2==0}"> <!-- idList是List类型变量 -->
                    <div class="item" style="float: left;" onclick="hospitalDetailM(${hospital.getHospitalID()})">
                        <div style="" class="wapper">
                            <div style="height: 50px">${hospital.getHospitalName()}</div>
                            <div>
                                <div style="float: left;">${hospital.getGrade()}</div>
                                <div style="float: right; margin-right: 50px">${hospital.getReleaseTime().getHours()}:${hospital.getReleaseTime().getMinutes()}-${hospital.getStopTime().getHours()}:${hospital.getStopTime().getMinutes()}</div>
                            </div>
                        </div>
                        <img class="micon" src="images/${hospital.getIcon()}.png"></img>
                    </div>
                </c:when>
                <c:when test="${status.index%2==1}">
                    <div class="item" style="float: right;" onclick="hospitalDetailM(${hospital.getHospitalID()})">
                        <div style="" class="wapper">
                            <div style=" height: 50px">${hospital.getHospitalName()}</div>
                            <div>
                                <div style="float: left;">${hospital.getGrade()}</div>
                                <div style="float: right; margin-right: 50px">${hospital.getReleaseTime().getHours()}:${hospital.getReleaseTime().getMinutes()}-${hospital.getStopTime().getHours()}:${hospital.getStopTime().getMinutes()}</div>
                            </div>
                        </div>
                        <img class="micon" src="images/${hospital.getIcon()}.png"></img>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
        <div style="height: 100px; width: 100px;background: none; float: left">

        </div>
    </div>

</div>
<div style="">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
    var level = "全部"
    var area = "全部"
    function findHospitalByName() {
        window.location.href="homeWithSearchByHospitalName?hospitalName="+$("#hospitalName")[0].value
    }
    function searchLevel(alevel) {
        level = alevel
        searchHospitalAjax()
    }
    function searchArea(aArea) {
        area = aArea
        searchHospitalAjax()
    }
    function searchHospitalAjax(){
        $(".right").html("")
        $.ajax({
            type:"post",
            url:"searchHospitalAjaxC",
            data:{"level": level, "area": area},
            dataType:"json",
            success:function(data){
                for(var i in data){
                    if (i%2==0){
                        $(".right").html($(".right").html()+String.raw`<div class="item" style="float: left;" onclick="hospitalDetailM(`+data[i].hospitalID+String.raw`)">
                        <div style="" class="wapper">
                            <div style="height: 50px">`+data[i].hospitalName+String.raw`</div>
                            <div>
                                <div style="float: left;">`+data[i].grade+String.raw`</div>
                                <div style="float: right; margin-right: 50px">`+data[i].releaseTime+String.raw`-`+data[i].stopTime+String.raw`</div>
                            </div>
                        </div>
                        <img class="micon" src="images/`+data[i].icon+String.raw`.png"></img>
                    </div>`)
                    }else {
                        $(".right").html($(".right").html()+String.raw`<div class="item" style="float: right;" onclick="hospitalDetailM(`+data[i].hospitalID+String.raw`)">
                        <div style="" class="wapper">
                            <div style="height: 50px">`+data[i].hospitalName+String.raw`</div>
                            <div>
                                <div style="float: left;">`+data[i].grade+String.raw`</div>
                                <div style="float: right; margin-right: 50px">`+data[i].releaseTime+String.raw`-`+data[i].stopTime+String.raw`</div>
                            </div>
                        </div>
                        <img class="micon" src="images/`+data[i].icon+String.raw`.png"></img>
                    </div>`)
                    }
                }

            }
        });
    }

    window.onload = function() {
        let filter = document.getElementsByClassName("level")
        for(let i=0;i<filter.length;i++){
            filter[i].addEventListener('click',function(){
                for(let j=0;j<filter.length;j++){
                    if(i!=j){
                        filter[j].style.color = "rgba(0, 0, 0, 0.56)"
                    }else {
                        filter[j].style.color = "#ff0006"

                    }
                }
            })
        }
        let filter2 = document.getElementsByClassName("area")
        for(let i=0;i<filter2.length;i++){
            filter2[i].addEventListener('click',function(){
                for(let j=0;j<filter2.length;j++){
                    if(i!=j){
                        filter2[j].style.color = "rgba(0, 0, 0, 0.56)"
                    }else {
                        filter2[j].style.color = "#ff0006"

                    }
                }
            })
        }
    };
    function hospitalDetailM(hostpital) {
        window.location.href="queryHospitalByID?hospitalID="+hostpital+"&current=1"
    }
    function noticeItem(noticeID) {
        window.location.href="noticePage.jsp?noticeID="+noticeID;
    }
</script>
</body>
</html>
