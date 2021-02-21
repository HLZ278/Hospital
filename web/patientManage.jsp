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
        var temp = true
        if($("#updatePatientNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientIdCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientAgeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientBirthdayError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientAddressError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkIdCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#patientUpdate").submit()
        }else {
            alert("请填写完整")
        }
    }
    function updatePatientCancle() {
        $("#updateBox").css('display', 'none')
    }
    function addPatient() {
        $("#updateBox").css('display', 'block')
    }
    function addPatientConfirm() {
        var temp = true
        if($("#updatePatientNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientIdCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientAgeError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientBirthdayError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientAddressError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkIdCardNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updatePatientLinkTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#patientInsert").submit()

        }else {
            alert("请填写完整")
        }
    }
    function deletePatient(patientID) {
        if (confirm("确定删除?")) {
            window.location.href = "deletePatient?patientID=" + patientID
        }
    }
    var usernameTemp;
    function updateUserDetail() {
        usernameTemp = $("#updateUserName").val()
        $("#updateBox").css('display', 'block')
    }
    function updateUserConfirm() {
        var temp = true
        if($("#updateUserNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserPwdError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserTelError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserRealNameError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if($("#updateUserIDNumError").css("color")=="rgb(255, 0, 0)"){
            temp=false
        }
        if (temp){
            $("#personUpdate").submit()
        }else {
            alert("请填写完整")
        }
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
    function updatePatientNameBlur() {
        var patientName = $("#updatePatientName")[0].value
        if(!patientName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#updatePatientNameError").css("color","red")
            $("#updatePatientNameError").html('请输入正确姓名')
        }else{
            $("#updatePatientNameError").css("color","green")
            $("#updatePatientNameError").html('√')
        }
    }
    function updatePatientIdCardNumBlur() {
        var idCardNum = $("#updatePatientIdCardNum")[0].value
        if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
            $("#updatePatientIdCardNumError").css("color","red")
            $("#updatePatientIdCardNumError").html('格式不对')
        }else{
            $("#updatePatientIdCardNumError").css("color","green")
            $("#updatePatientIdCardNumError").html('√')
        }
    }
    function updatePatientAgeBlur() {
        var age = $("#updatePatientAge")[0].value
        if(age==""||(age<0||age>100)){
            $("#updatePatientAgeError").css("color","red")
            $("#updatePatientAgeError").html('请输入正确年龄')
        }else{
            $("#updatePatientAgeError").css("color","green")
            $("#updatePatientAgeError").html('√')
        }
    }
    function updatePatientBirthdayBlur() {
        var birthday = $("#updatePatientBirthday")[0].value
        if(birthday==""){
            $("#updatePatientBirthdayError").css("color","red")
            $("#updatePatientBirthdayError").html('请输入选择生日')
        }else{
            $("#updatePatientBirthdayError").css("color","green")
            $("#updatePatientBirthdayError").html('√')
        }
    }
    function updatePatientTelBlur() {
        var phone = $("#updatePatientTel")[0].value
        if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
            $("#updatePatientTelError").css("color","red")
            $("#updatePatientTelError").html('手机号格式错误')
        }else{
            $("#updatePatientTelError").css("color","green")
            $("#updatePatientTelError").html('√')
        }
    }
    function updatePatientAddressBlur() {
        var address = $("#updatePatientAddress")[0].value
        if(address.trim()==""){
            $("#updatePatientAddressError").css("color","red")
            $("#updatePatientAddressError").html('请输入')
        }else{
            $("#updatePatientAddressError").css("color","green")
            $("#updatePatientAddressError").html('√')
        }
    }

    function updatePatientLinkNameBlur() {
        var patientName = $("#updatePatientLinkName")[0].value
        if(!patientName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#updatePatientLinkNameError").css("color","red")
            $("#updatePatientLinkNameError").html('请输入正确姓名')
        }else{
            $("#updatePatientLinkNameError").css("color","green")
            $("#updatePatientLinkNameError").html('√')
        }
    }
    function updatePatientLinkIdCardNumBlur() {
        var idCardNum = $("#updatePatientLinkIdCardNum")[0].value
        if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
            $("#updatePatientLinkIdCardNumError").css("color","red")
            $("#updatePatientLinkIdCardNumError").html('格式不对')
        }else{
            $("#updatePatientLinkIdCardNumError").css("color","green")
            $("#updatePatientLinkIdCardNumError").html('√')
        }
    }
    function updatePatientLinkTelBlur() {
        var phone = $("#updatePatientLinkTel")[0].value
        if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
            $("#updatePatientLinkTelError").css("color","red")
            $("#updatePatientLinkTelError").html('手机号格式错误')
        }else{
            $("#updatePatientLinkTelError").css("color","green")
            $("#updatePatientLinkTelError").html('√')
        }
    }
    function updateUserNameBlur() {
        var userName = $("#updateUserName")[0].value
        var reg=/^[a-zA-Z0-9]{1,15}$/;
        if(reg.test(userName)==false){
            $("#updateUserNameError").css("color","red")
            $("#updateUserNameError").html('格式不正确')
        }else{
            $.ajax({
                type:"get",
                url:"findUser",
                data:{"userName": $("#updateUserName")[0].value},
                dataType:"text",
                success:function(data){
                    if("true" === data){
                        if (usernameTemp != $("#updateUserName")[0].value){
                            $("#updateUserNameError").css("color","red")
                            $("#updateUserNameError").html('用户已存在')
                        }else {
                            $("#updateUserNameError").css("color","green")
                            $("#updateUserNameError").html('用户名可用')
                        }
                    }else{
                        $("#updateUserNameError").css("color","green")
                        $("#updateUserNameError").html('用户名可用')
                    }
                },
            });
        }

    }
    function updateUserPwdBlur() {
        var password1 = $("#updateUserPwd")[0].value
        var reg=/^[a-zA-Z0-9]{5,15}$/;
        if(reg.test(password1)==false){
            $("#updateUserPwdError").css("color","red")
            $("#updateUserPwdError").html('格式不正确')
        }else{
            $("#updateUserPwdError").css("color","green")
            $("#updateUserPwdError").html('√')
        }
    }
    function updateUserTelBlur() {
        var phone = $("#updateUserTel")[0].value
        if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
            $("#updateUserTelError").css("color","red")
            $("#updateUserTelError").html('手机号格式错误')
        }else{
            $("#updateUserTelError").css("color","green")
            $("#updateUserTelError").html('√')
        }
    }
    function updateUserRealNameBlur() {
        var realName = $("#updateUserRealName")[0].value
        if(!realName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
            $("#updateUserRealNameError").css("color","red")
            $("#updateUserRealNameError").html('请输入正确姓名')
        }else{
            $("#updateUserRealNameError").css("color","green")
            $("#updateUserRealNameError").html('√')
        }
    }
    function updateUserIDNumBlur() {
        var idCardNum = $("#updateUserIDNum")[0].value
        if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
            $("#updateUserIDNumError").css("color","red")
            $("#updateUserIDNumError").html('格式不对')
        }else{
            $("#updateUserIDNumError").css("color","green")
            $("#updateUserIDNumError").html('√')
        }
    }

</script>
</body>
</html>
