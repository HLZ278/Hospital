<%--
  Created by IntelliJ IDEA.
  User: 96916
  Date: 2021/1/5
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/sysManage.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>
<div>
    <div class="leftMenu" style="position: absolute;text-align:center;
          top: 70px;float:left;background-color: rgba(7,120,147,0.77); width: 300px;height: calc(100% - 70px)">
        <div style="background-color: #42e8e8; line-height: 170px"><font
                style="color: white; font-weight: 700; font-size: 20px; font-family: FontAwesome">欢迎您，亲爱的管理员</font>
        </div>
        <div class="sysMenuItem">
            <ul>
                <li id="ordinaryUser" class="sysLi"><a>普通用户管理</a><span style="margin-left: 5px">></span></li>
                <li id="hospitalUser" class="sysLi"><a>医院用户管理</a><span style="margin-left: 5px">></span></li>
                <li id="hospital" class="sysLi"><a>医院管理</a><span style="margin-left: 5px">></span></li>
                <li id="notice" class="sysLi"><a>公告管理</a><span style="margin-left: 5px">></span></li>
                <li id="message" class="sysLi"><a>留言管理</a><span style="margin-left: 5px">></span></li>
            </ul>
        </div>
    </div>

    <div id="right">

    </div>
</div>


<script type="text/javascript">
    window.onload = function () {
        let filter = document.getElementsByClassName("sysLi")

        for (let i = 0; i < filter.length; i++) {
            filter[i].addEventListener('click', function () {
                switch ($(this).attr("id")) {
                    case "ordinaryUser":
                        window.location.href = "ordinaryUser?page=" + 0 + "&current=" + 1
                        break;
                    case "hospitalUser":
                        window.location.href = "hospitalUser?page=" + 0 + "&current=" + 2
                        break;
                    case "hospital":
                        window.location.href = "hospitalTable?page=" + 0 + "&current=" + 3
                        break;
                    case "notice":
                        window.location.href = "queryAllNotice?page=" + 0 + "&current=" + 4
                        break;
                    default:
                        break;
                }
                filter[i].style.backgroundColor = "#4bbfd4"
                for (let j = 0; j < filter.length; j++) {
                    if (i !== j) {
                        filter[j].style.backgroundColor = "#4097ac"
                    }
                }

            })
        }
        switch (<%=request.getParameter("current")%>) {
            case 1:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.backgroundColor = "#4bbfd4"
                $("#right").html(String.raw`<%@ include file="commonUserManage.jsp"%>`)
                break;
            case 2:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.backgroundColor = "#4bbfd4"
                $("#right").html(String.raw`<%@ include file="hospitalUserManage.jsp"%>`)
                break;
            case 3:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.backgroundColor = "#4bbfd4"
                $("#right").html(String.raw`<%@ include file="hospitalTableManage.jsp"%>`)
                break;
            case 4:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.backgroundColor = "#4bbfd4"
                $("#right").html(String.raw`<%@ include file="noticeManage.jsp"%>`)
                break;
            default:
                break;
        }
    };
    function add() {
        $('#ooo').css('display', 'block')
    }

    function addCancle() {
        $('#ooo').css('display', 'none')
    }

    function addOrdinaryConfirm() {
        $('#addUser').submit()
    }

    function addHU() {
        $('#addUser').submit()
    }

    function addHUCancle() {
        $('#addHU').css('display', 'none')
    }

    function ordinaryUserSearchByName() {
        window.location.href = "ordinaryUser?page=" + 0 + "&current=" + 1 + "&userName=" + $('#ordinaryUserName').val()
    }

    function hospitalUserSearchByName() {
        window.location.href = "hospitalUser?page=" + 0 + "&current=" + 2 + "&userName=" + $('#hospitalUserName').val()
    }

    function hospitalSearchByName() {
        window.location.href = "hospitalTable?page=" + 0 + "&current=" + 3 + "&hospitalName=" + $('#hospitalName').val()
    }
    function searchNotice() {
        window.location.href = "searchNotice?page=" + 0 + "&current=" + 4 + "&noticeTitle=" + $('#noticeTitle').val()
    }
    function deleteUser(userID) {
        if (confirm("确定删除?")) {
            window.location.href = "deleteUser?userID=" + userID + "&userType=" + 1
        }
    }

    function deleteHospitalUser(userID) {
        if (confirm("确定删除?")) {
            window.location.href = "deleteUser?userID=" + userID + "&userType=" + 2
        }
    }

    function deleteHospitalConfirm(hospitalID) {
        if (confirm("确定删除?")) {
            window.location.href = "deleteHospital?hospitalID=" + hospitalID
        }
    }
    function deleteNoticeConfirm(noticeID) {
        if (confirm("确定删除?")) {
            window.location.href = "deleteNotice?noticeID=" + noticeID
        }
    }

    function addHospital() {
        $('#addHospital').submit()
    }

    function addHospitalUser(hospitalID) {
        $('#addUserHospitalID').val(hospitalID)
        $('#addHU').css('display', 'block')
    }

    function updateOrdinaryUser(obj) {
        alert(obj.href)
    }
    function updateNotice(obj) {
        $(obj.parentNode.parentNode).children('td').each(function (j) {
            switch (j) {
                case 0:
                    $("#updateNoticeID").val($(this).text())
                case 1:
                    $("#updateNoticeTitle").val($(this).text())
                    break;
            }
        })
        $("#updateBox").css('display', 'block')
    }
    function updateUser(obj) {
        $(obj.parentNode.parentNode).children('td').each(function (j) {
            switch (j) {
                case 0:
                    $("#updateUserID").val($(this).text())
                case 1:
                    $("#updateUserName").val($(this).text())
                    break;
                case 2:
                    $("#updateUserPwd").val($(this).text())
                    break;
                case 3:
                    $("#updateUserTel").val($(this).text())
                    break;
                case 5:
                    $("#updateRealName").val($(this).text())
                    break;
                case 6:
                    switch ($(this).text()){
                        case "居民身份证":
                            $("#updateIdCardType").val(1)
                            break;
                        case "港澳居民来往内地通行证":
                            $("#updateIdCardType").val(2)
                            break;
                        case "台湾居民来往大陆通行证":
                            $("#updateIdCardType").val(3)
                            break;
                        case "护照":
                            $("#updateIdCardType").val(4)
                            break;
                        case "外国人永久居留身份证":
                            $("#updateIdCardType").val(5)
                            break;
                        case "港澳居民居住证":
                            $("#updateIdCardType").val(6)
                            break;
                        case "台湾居民居住证":
                            $("#updateIdCardType").val(7)
                            break;
                    }
                    break;
                case 7:
                    $("#updateIdcardNum").val($(this).text())
                    break;
            }
        })
        $("#updateBox").css('display', 'block')
    }

    function updateCancle() {
        $("#updateBox").css('display', 'none')
    }
    function updateHospitalConfirm() {
        $("#hospitalUpdate").submit()
    }
    function updateNoticeConfirm() {
        $("#noticeUpdate").submit()
    }
    function updateConfirm() {
        $("#userUpdate").submit()
    }
    function updateHUser(obj) {
        $(obj.parentNode.parentNode).children('td').each(function (j) {
            switch (j) {
                case 0:
                    $("#updateUserID").val($(this).text())
                case 1:
                    $("#updateUserName").val($(this).text())
                    break;
                case 2:
                    $("#updateUserPwd").val($(this).text())
                    break;
                case 3:
                    $("#updateUserTel").val($(this).text())
                    break;
                case 5:
                    $("#updateRealName").val($(this).text())
                    break;
                case 6:
                    switch ($(this).text()){
                        case "居民身份证":
                            $("#updateIdCardType").val(1)
                            break;
                        case "港澳居民来往内地通行证":
                            $("#updateIdCardType").val(2)
                            break;
                        case "台湾居民来往大陆通行证":
                            $("#updateIdCardType").val(3)
                            break;
                        case "护照":
                            $("#updateIdCardType").val(4)
                            break;
                        case "外国人永久居留身份证":
                            $("#updateIdCardType").val(5)
                            break;
                        case "港澳居民居住证":
                            $("#updateIdCardType").val(6)
                            break;
                        case "台湾居民居住证":
                            $("#updateIdCardType").val(7)
                            break;
                    }
                    break;
                case 7:
                    $("#updateIdcardNum").val($(this).text())
                    break;
            }
        })
        $("#updateBox").css('display', 'block')
    }
    function updateHConfirm() {
        $("#userUpdate").submit()
    }
    function addNoticeConfirm() {
        $("#insertNotice").submit()
    }
    function updateHCancle() {
        $("#updateBox").css('display', 'none')
    }
    function updateHospital(obj) {
        $(obj.parentNode.parentNode).children('td').each(function (j) {
            switch (j) {
                case 0:
                    $("#updateHospitalID").val($(this).text())
                case 1:
                    $("#updateHospitalName").val($(this).text())
                    break;
                case 2:
                    $("#updateGrade").val($(this).text())
                    break;
                case 3:
                    $("#updateArea").val($(this).text())
                    break;
                case 4:
                    $("#updateAddress").val($(this).text())
                    break;
                case 5:
                    $("#updateReleaseTime").val($(this).text())
                    break;
                case 6:
                    $("#updateStopTime").val($(this).text())
                    break;
            }
        })
        $("#updateBox").css('display', 'block')
    }

    function preOrdinaryUser(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==1){
        }else {
            window.location.href = "ordinaryUser?page=" + (currentPage-2) + "&current=" + 1
        }
    }
    function nextOrdinaryUser(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==pageCount){
        }else {
            window.location.href = "ordinaryUser?page=" + (currentPage) + "&current=" + 1
        }
    }
    function preHospitalUser(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==1){
        }else {
            window.location.href = "hospitalUser?page=" + (currentPage-2) + "&current=" + 2
        }
    }
    function nextHospitalUser(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==pageCount){
        }else {
            window.location.href = "hospitalUser?page=" + (currentPage) + "&current=" + 2
        }
    }
    function preHospitalTable(pageCount) {
        var currentPage = $("#pageNum").html()

        if(currentPage==1){
        }else {
            window.location.href = "hospitalTable?page=" + (currentPage-2) + "&current=" + 3
        }
    }
    function nextHospitalTable(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==pageCount){
        }else {
            window.location.href = "hospitalTable?page=" + (currentPage) + "&current=" + 3
        }
    }
</script>

</body>
</html>
