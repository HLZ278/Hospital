<%--
  Created by IntelliJ IDEA.
  User: 96916
  Date: 2021/1/18
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/popWindow.css">
</head>
<style>
    .leftMenu{
        position: absolute;
        top: 70px;
        width: 200px;
        margin-left:168px;
        height: 350px;
        padding: 0px;
    }
    .rightMain{
        position: absolute;
        top: 70px;
        width: 1000px;
        margin-left:368px;
        padding: 0px;
    }
    .patientul li{
        line-height: 70px;
        font-weight: 700;
        font-size: 15px;
        font-family: FontAwesome;
        height: 70px;
        list-style-type:none;
        background: white;
        font-size: 15px;
        color: #077893;
        font-weight: 700;
        font-family:FontAwesome;
        outline: none;
        border: none;
        background-color: white
    }
    .patientul li:hover{
        color: rgb(48, 255, 75);

    }
    .patientDetail{
        background: white;
        font-size: 15px;
        color: #08bbe6;
        font-weight: 700;
        font-family:FontAwesome;
        outline: none;
        border: none;
        background-color: white
    }

</style>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>

<div class="leftMenu">
    <div style="float: left; position: fixed">
        <ul class="patientul">
            <li id="patientManage" class="patientLi"><a>就诊人管理</a><span style="margin-left: 5px">></span></li>
            <li id="orderManage" class="patientLi"><a>预约订单管理</a><span style="margin-left: 5px">></span></li>
            <li id="messageManage" class="patientLi"><a>个人信息管理</a><span style="margin-left: 5px">></span></li>
        </ul>
    </div>

</div>
<div id="rightMain" style="float: right" class="rightMain">

</div>
<div style="">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
    window.onload = function () {
        let filter = document.getElementsByClassName("patientLi")
        for (let i = 0; i < filter.length; i++) {
            filter[i].addEventListener('click', function () {
                switch ($(this).attr("id")) {
                    case "patientManage":
                        window.location.href="queryPatient?current="+1
                        break;
                    case "orderManage":
                        window.location.href="queryOrderManageView?current="+2
                        break;
                    case "messageManage":
                        window.location.href="patientManage.jsp?current="+3
                        break;
                    default:
                        break;
                }
                filter[i].style.color = "rgb(48, 255, 75)"
                for (let j = 0; j < filter.length; j++) {
                    if (i != j) {
                        filter[j].style.color = "#077893"
                    }
                }
            })
        }
        switch (<%=request.getParameter("current")%>) {
            case 1:
                filter[parseInt("<%=request.getParameter("current")%>")-1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="patientM.jsp"%>`)
                break;
            case 2:
                filter[parseInt("<%=request.getParameter("current")%>")-1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="orderManageM.jsp"%>`)
                break;
            case 3:
                filter[parseInt("<%=request.getParameter("current")%>")-1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="personManageM.jsp"%>`)
                break;
            case 4:
                filter[0].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="patientDetail.jsp"%>`)
                break;
            default:
                break;
        }
    };
    function patientDetail(patientID) {
        window.location.href="patientDetail?current="+4+"&patientID="+patientID
    }
    function updatePatientShow() {
        $("#updateBox").css('display', 'block')
    }
    function updatePatientConfirm() {
        $("#patientUpdate").submit()
    }
    function updatePatientCancle() {
        $("#updateBox").css('display', 'none')
    }
    function addPatient() {
        $("#updateBox").css('display', 'block')
    }
    function addPatientConfirm() {
        $("#patientInsert").submit()
    }
    function deletePatient(patientID) {
        if (confirm("确定删除?")) {
            window.location.href = "deletePatient?patientID=" + patientID
        }
    }
    function updateUserDetail() {
        $("#updateBox").css('display', 'block')
    }
    function updateUserConfirm() {
        $("#personUpdate").submit()
    }
    function cancleOrder(orderID,signalSrcID) {
        window.location.href="cancleOrder?current=2&orderID="+orderID+"&signalSrcID="+signalSrcID
    }
    function searchOrder() {
        if ($("#orderStatus")[0].value==0){
            window.location.href="queryOrderManageView?current="+2
        }else{
            window.location.href="searchOrder?current=2&status="+$("#orderStatus")[0].value
        }
    }

</script>
</body>
</html>
