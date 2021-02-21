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
                    case "message":
                        window.location.href = "queryMessage?page=" + 0 + "&current=" + 5
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
            case 5:
                filter[parseInt("<%=request.getParameter("current")%>") - 1].style.backgroundColor = "#4bbfd4"
                $("#right").html(String.raw`<%@ include file="messageManage.jsp"%>`)
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
        var temp = true
        if($("#nameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#userPwdError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#userTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#realNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#idCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $('#addUser').submit()
        }else {
            alert("请填写完整")
        }

    }

    function addHU() {
        var temp = true
        if($("#nameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#userPwdError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#userTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#realNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#idCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $('#addUser').submit()
        }else {
            alert("请填写完整")
        }

    }

    function addUserNameBlur() {
        var userName = $("#userName")[0].value
        var reg=/^[a-zA-Z0-9]{1,15}$/;
        if(reg.test(userName)==false){
            $("#nameError").css("color","red")
            $("#nameError").html('格式不正确')
        }else{
            $.ajax({
                type:"get",
                url:"findUser",
                data:{"userName": $("#userName")[0].value},
                dataType:"text",
                success:function(data){
                    if("true" === data){
                        $("#nameError").css("color","red")
                        $("#nameError").html('用户已存在')
                    }else{
                        $("#nameError").css("color","green")
                        $("#nameError").html('用户名可用')
                    }
                },
            });
        }

    }
    function addUserPasswdBlur() {
        var password1 = $("#userPwd")[0].value
        var reg=/^[a-zA-Z0-9]{5,15}$/;
        if(reg.test(password1)==false){
            $("#userPwdError").css("color","red")
            $("#userPwdError").html('格式不正确')
        }else{
            $("#userPwdError").css("color","green")
            $("#userPwdError").html('密码可用')
        }
    }
    function phoneBlur() {
        var phone = $("#userTel")[0].value
        if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
            $("#userTelError").css("color","red")
            $("#userTelError").html('手机号格式错误')
        }else{
            $("#userTelError").css("color","green")
            $("#userTelError").html('正确')
        }
    }
    function realNameBlur() {
        var realName = $("#realName")[0].value
        if(!realName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#realNameError").css("color","red")
            $("#realNameError").html('请输入正确姓名')
        }else{
            $("#realNameError").css("color","green")
            $("#realNameError").html('正确')
        }
    }
    function idCardNumBlur() {
        var idCardNum = $("#idCardNum")[0].value
        if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
            $("#idCardNumError").css("color","red")
            $("#idCardNumError").html('格式不对')
        }else{
            $("#idCardNumError").css("color","green")
            $("#idCardNumError").html('正确')
        }
    }



    function updateUserNameBlur() {
        var userName = $("#updateUserName")[0].value
        var reg=/^[a-zA-Z0-9]{1,15}$/;
        if(reg.test(userName)==false){
            $("#updateNameError").css("color","red")
            $("#updateNameError").html('格式不正确')
        }else{
            $.ajax({
                type:"get",
                url:"findUser",
                data:{"userName": $("#updateUserName")[0].value},
                dataType:"text",
                success:function(data){
                    if("true" === data){
                        if (usernameTemp != $("#updateUserName")[0].value){
                            $("#updateNameError").css("color","red")
                            $("#updateNameError").html('用户已存在')
                        }else {
                            $("#updateNameError").css("color","green")
                            $("#updateNameError").html('用户名可用')
                        }
                    }else{
                        $("#updateNameError").css("color","green")
                        $("#updateNameError").html('用户名可用')
                    }
                },
            });
        }

    }
    function updateUserPasswdBlur() {
        var password1 = $("#updateUserPwd")[0].value
        var reg=/^[a-zA-Z0-9]{5,15}$/;
        if(reg.test(password1)==false){
            $("#updateUserPwdError").css("color","red")
            $("#updateUserPwdError").html('格式不正确')
        }else{
            $("#updateUserPwdError").css("color","green")
            $("#updateUserPwdError").html('密码可用')
        }
    }
    function updateUserPhoneBlur() {
        var phone = $("#updateUserTel")[0].value
        if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
            $("#updateUserTelError").css("color","red")
            $("#updateUserTelError").html('手机号格式错误')
        }else{
            $("#updateUserTelError").css("color","green")
            $("#updateUserTelError").html('格式正确')
        }
    }
    function updateUserRealNameBlur() {
        var realName = $("#updateRealName")[0].value
        if(!realName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#updateRealNameError").css("color","red")
            $("#updateRealNameError").html('请输入正确姓名')
        }else{
            $("#updateRealNameError").css("color","green")
            $("#updateRealNameError").html('格式正确')
        }
    }
    function updateUserIdCardNumBlur() {
        var idCardNum = $("#updateIdcardNum")[0].value
        if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
            $("#updateIdcardNumError").css("color","red")
            $("#updateIdcardNumError").html('格式不对')
        }else{
            $("#updateIdcardNumError").css("color","green")
            $("#updateIdcardNumError").html('格式正确')
        }
    }
    function noticeTitleBlur() {
        var noticeTitle = $("#noticeTitle2")[0].value
        if(noticeTitle==''){
            $("#noticeTitleError").css("color","red")
            $("#noticeTitleError").html('必填')
        }else{
            $("#noticeTitleError").css("color","green")
            $("#noticeTitleError").html('√')
        }
    }
    function noticeContentBlur() {
        var noticeContent = $("#noticeContent2")[0].value
        if(noticeContent==''){
            $("#noticeContentError").css("color","red")
            $("#noticeContentError").html('必填')
        }else{
            $("#noticeContentError").css("color","green")
            $("#noticeContentError").html('√')
        }
    }
    function updateNoticeTitleBlur() {
        var noticeTitle = $("#updateNoticeTitle")[0].value
        if(noticeTitle==''){
            $("#updateNoticeTitleError").css("color","red")
            $("#updateNoticeTitleError").html('必填')
        }else{
            $("#updateNoticeTitleError").css("color","green")
            $("#updateNoticeTitleError").html('√')
        }
    }
    function updateNoticeContentBlur() {
        var noticeContent = $("#noticeContent")[0].value
        if(noticeContent==''){
            $("#updateNoticeContentError").css("color","red")
            $("#updateNoticeContentError").html('必填')
        }else{
            $("#updateNoticeContentError").css("color","green")
            $("#updateNoticeContentError").html('√')
        }
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
        var temp = true
        if($("#hospitalNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#addressError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#releaseTimeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#stopTimeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $('#addHospital').submit()
        }else {
            alert("请填写完整")
        }
    }
    function hospitalNameBlur() {
        var hospitalName = $("#hospitalName2")[0].value
        if(!hospitalName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#hospitalNameError").css("color","red")
            $("#hospitalNameError").html('请输入正确医院名')
        }else{
            $("#hospitalNameError").css("color","green")
            $("#hospitalNameError").html('可用')
        }
    }
    function addressBlur() {
        var address = $("#address")[0].value
        if(!address.match(/[^\x00-\xff]|[A-Za-z0-9_]/ig)){
            $("#addressError").css("color","red")
            $("#addressError").html('请输入正确地址')
        }else{
            $("#addressError").css("color","green")
            $("#addressError").html('可用')
        }
    }
    function releaseTimeBlur() {
        var releaseTime = $("#releaseTime")[0].value
        if(releaseTime==""||releaseTime.split(":").length==3){
            $("#releaseTimeError").css("color","red")
            $("#releaseTimeError").html('请选择')
        }else{
            $("#releaseTimeError").css("color","green")
            $("#releaseTimeError").html('√')
        }
    }

    function stopTimeBlur() {
        var stopTime = $("#stopTime")[0].value
        if(stopTime==""||stopTime.split(":").length==3){
            $("#stopTimeError").css("color","red")
            $("#stopTimeError").html('请选择')
        }else{
            $("#stopTimeError").css("color","green")
            $("#stopTimeError").html('√')
        }
    }

    function updateHospitalNameBlur() {
        var hospitalName = $("#updateHospitalName")[0].value
        if(!hospitalName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#updateHospitalNameError").css("color","red")
            $("#updateHospitalNameError").html('请输入正确医院名')
        }else{
            $("#updateHospitalNameError").css("color","green")
            $("#updateHospitalNameError").html('可用')
        }
    }
    function updateAddressBlur() {
        var updateAddress = $("#updateAddress")[0].value
        if(!updateAddress.match(/[^\x00-\xff]|[A-Za-z0-9_]/ig)){
            $("#updateAddressError").css("color","red")
            $("#updateAddressError").html('请输入正确地址')
        }else{
            $("#updateAddressError").css("color","green")
            $("#updateAddressError").html('可用')
        }
    }
    function updateReleaseTimeBlur() {
        var releaseTime = $("#updateReleaseTime")[0].value
        if(releaseTime==""||releaseTime.split(":").length==3){
            $("#updateReleaseTimeError").css("color","red")
            $("#updateReleaseTimeError").html('请选择')
        }else{
            $("#updateReleaseTimeError").css("color","green")
            $("#updateReleaseTimeError").html('√')
        }
    }

    function updateStopTimeBlur() {
        var stopTime = $("#updateStopTime")[0].value
        if(stopTime==""||stopTime.split(":").length==3){
            $("#updateStopTimeError").css("color","red")
            $("#updateStopTimeError").html('请选择')
        }else{
            $("#updateStopTimeError").css("color","green")
            $("#updateStopTimeError").html('√')
        }
    }

    function addHospitalUser(hospitalID) {
        $('#addUserHospitalID').val(hospitalID)
        $('#addHU').css('display', 'block')
    }

    function updateOrdinaryUser(obj) {
        alert(obj.href)
    }
    function updateNotice(obj, content) {
        $(obj.parentNode.parentNode).children('td').each(function (j) {
            switch (j) {
                case 0:
                    $("#updateNoticeID").val($(this).text())
                case 1:
                    $("#updateNoticeTitle").val($(this).text())
                    break;
            }
        })
        //由于&quot;附带双引号，所以得去掉首位双引号
        $("#noticeContent").val(content.substring(1,content.length - 1));
        updateNoticeTitleBlur()
        updateNoticeContentBlur()
        $("#updateBox").css('display', 'block')
    }
    var usernameTemp;
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
        usernameTemp = $("#updateUserName").val()
        updateUserNameBlur()
        updateUserPasswdBlur()
        updateUserPhoneBlur()
        updateUserRealNameBlur()
        updateUserIdCardNumBlur()
        $("#updateBox").css('display', 'block')
    }

    function updateCancle() {
        $("#updateBox").css('display', 'none')
    }
    function updateHospitalConfirm() {
        var temp = true
        if($("#updateHospitalNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateAddressError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateReleaseTimeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateStopTimeTimeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#hospitalUpdate").submit()
        }else {
            alert("请填写完整")
        }
    }
    function updateNoticeConfirm() {
        var temp = true
        if($("#updateNoticeTitleError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateNoticeTitleError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }

        if (temp){
            $("#noticeUpdate").submit()
        }else {
            alert("请填写完整")
        }
    }
    function updateConfirm() {
        var temp = true
        if($("#updateNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserPwdError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateRealNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateIdcardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#userUpdate").submit()
        }else {
            alert("请填写完整")
        }
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
        usernameTemp = $("#updateUserName").val()
        updateUserNameBlur()
        updateUserPasswdBlur()
        updateUserPhoneBlur()
        updateUserRealNameBlur()
        updateUserIdCardNumBlur()
        $("#updateBox").css('display', 'block')
    }
    function updateHConfirm() {
        var temp = true
        if($("#updateNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserPwdError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateRealNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateIdcardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#userUpdate").submit()
        }else {
            alert("请填写完整")
        }
    }
    function addNoticeConfirm() {
        var temp = true
        if($("#noticeTitleError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#noticeContentError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#insertNotice").submit()
        }else {
            alert("请填写完整")
        }
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
                    var selectid = document.getElementById("updateGrade");
                    for(i=0;i<selectid.length;i++){
                        if(selectid[i].value==$(this).text())
                            selectid[i].selected = true;
                    }
                    break;
                case 3:
                    var selectid = document.getElementById("updateArea");
                    for(i=0;i<selectid.length;i++){
                        if(selectid[i].value==$(this).text())
                            selectid[i].selected = true;
                    }
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

        updateHospitalNameBlur()
        updateStopTimeBlur()
        updateAddressBlur()
        updateReleaseTimeBlur()
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
    function showMessage(content) {
        alert(content)
    }
    function deleteFormAllMessage(id) {
        if (confirm("确定删除?")) {
            window.location.href = "deleteFormAllMessage?messageID="+id
        }
    }
    function preMessages() {
        var currentPage = $("#pageNum").html()
        if(currentPage==1){
        }else {
            window.location.href="queryMessage?page="+(currentPage-2)+"&current="+5
        }
    }
    function nextMessages(pageCount) {
        var currentPage = $("#pageNum").html()
        if(currentPage==pageCount){
        }else {
            window.location.href="queryMessage?page="+(currentPage)+"&current="+5

        }
    }
</script>

</body>
</html>
