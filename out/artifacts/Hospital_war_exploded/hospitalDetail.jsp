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
    .leftMenu {
        position: absolute;
        top: 70px;
        width: 200px;
        margin-left: 168px;
        height: 350px;
        padding: 0px;
    }

    .rightMain {
        position: absolute;
        top: 70px;
        width: 1000px;
        margin-left: 368px;
        height: 650px;
        padding: 0px;
    }

    .patientul li {
        line-height: 70px;
        font-weight: 700;
        font-size: 15px;
        font-family: FontAwesome;
        height: 70px;
        list-style-type: none;
        background: white;
        font-size: 15px;
        color: #077893;
        font-weight: 700;
        font-family: FontAwesome;
        outline: none;
        border: none;
        background-color: white
    }

    .patientul li:hover {
        color: rgb(48, 255, 75);

    }

    .patientDetail {
        background: white;
        font-size: 15px;
        color: #08bbe6;
        font-weight: 700;
        font-family: FontAwesome;
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
            <li id="hospitalDetails" class="hospitalLi"><a>医院详情</a><span style="margin-left: 5px">></span></li>
            <li id="subscribe" class="hospitalLi"><a></a>预约挂号<span style="margin-left: 5px">></span></li>
            <li id="ruleAndNotice" class="hospitalLi"><a>预约须知</a><span style="margin-left: 5px">></span></li>
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
        let filter = document.getElementsByClassName("hospitalLi")
        for (let i = 0; i < filter.length; i++) {
            filter[i].addEventListener('click', function () {
                switch ($(this).attr("id")) {
                    case "hospitalDetails":
                        window.location.href = "hospitalDetail.jsp?current=" + 1
                        break;
                    case "subscribe":
                        window.location.href = "hospitalDetail.jsp?current=" + 2
                        break;
                    case "ruleAndNotice":
                        window.location.href = "hospitalDetail.jsp?current=" + 3
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
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="hospitalDetailM.jsp"%>`)
                break;
            case 2:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="departmentChoose.jsp"%>`)
                break;
            case 3:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="orderNotice.jsp"%>`)
                break;
            case 4:
                filter[1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="numSrcOrder.jsp"%>`)
                break;
            case 5:
                filter[1].style.color = "rgb(48, 255, 75)"
                $("#rightMain").html(String.raw`<%@ include file="subscribe.jsp"%>`)
                break;
            default:
                break;
        }
    };

    function patientDetail(patientID) {
        window.location.href = "patientDetail?current=" + 4 + "&patientID=" + patientID
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

    function numSrcOrder(departmentID) {
        window.location.href = "queryNumSrcView?current=4&departmentID=" + departmentID
    }

    function dataChoose(date) {
        var dateNumSrcViewMap = eval("("+'${dateNumSrcViewMap}'+")");
        $("#doctors").html("")
        for (var i in dateNumSrcViewMap[date]){
            $("#doctors").html($("#doctors").html() + String.raw`
            <div style="width: 100%; height: 100px;  border-bottom:1px solid rgba(0,0,0,0.2); ">
                <div style="float: left">
                    <div style="margin: 10px;margin-top: 20px; font-weight: 600">`+dateNumSrcViewMap[date][i].doctorName+String.raw`</div>
                    <div style="margin: 10px; color: grey; font-size: 15px">`+dateNumSrcViewMap[date][i].expertise+String.raw`</div>
                </div>
                <div ><button onclick="orderEnter(`+dateNumSrcViewMap[date][i].signalSrcID+String.raw`,`+dateNumSrcViewMap[date][i].remain+String.raw`)" style=" margin-top:30px;float: right; line-height: 40px; width: 150px; border: none; background-color: #4490f1;border-radius: 5px; color: white; font-weight: 600">剩余:&nbsp;&nbsp;&nbsp;`+dateNumSrcViewMap[date][i].remain+String.raw`</button></div>
                <div style="float: right; line-height: 100px; margin-right: 20px; font-weight: 500">预约费用:&nbsp;&nbsp;￥`+dateNumSrcViewMap[date][i].cost+String.raw`</div>
            </div>
        `)
        }
    }
    function orderEnter(numSrcID, remain) {
        if (remain!=0){
            window.location.href = "orderConfirm?current=5&numSrcID=" + numSrcID
        }
    }
    var patientID=-1
    function selectPatient(id) {
        let filter = document.getElementsByClassName("item")
        for (let i = 0; i < filter.length; i++) {
            filter[i].style.background = "#ffffff"
        }
        $("#item"+id).css('background','#4bbfd4')
        patientID=id
    }
    function orderConfirm() {
        if (patientID!=-1){
            window.location.href = "orderInsert?patientID="+patientID+"&numSrcID=" + getArgs("numSrcID")
        }
    }



    //获取地址栏上的某一个属性值
    function getArgs(strParame) {
        var args = new Object( );
        var query = location.search.substring(1);
        var pairs = query.split("&"); // Break at ampersand
        for(var i = 0; i < pairs.length; i++) {
            var pos = pairs[i].indexOf("=");
            if (pos == -1) continue;
            var argname = pairs[i].substring(0,pos);
            var value = pairs[i].substring(pos+1);
            value = decodeURIComponent(value);
            args[argname] = value;
        }
        return args[strParame];
    }
</script>
</body>
</html>
