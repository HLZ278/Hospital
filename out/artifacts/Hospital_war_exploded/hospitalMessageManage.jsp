<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 96916
  Date: 2021/1/7
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/tableLeft.css">
    <style>
        .hospitalContainer::-webkit-scrollbar {
            border-width:1px;
        }
        form div{
            margin: 30px;
        }
    </style>
</head>
<body>
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">

    <div class="hospitalContainer" style="overflow: auto;margin: 10px; position: absolute;top: 70px;background-color: white;  width: calc(100% - 320px); height: 630px">
        <form id="hospitalMessage" action="updateHospitalMessage" method="post" enctype="multipart/form-data">
            <div>
                医院名称：<input onblur="hospitalNameBlur()" id="hospitalName" name="hospitalName" value="${userHospital.getHospitalName()}">
                <font id="hospitalNameError" style="color: green">√</font>
            </div>
            <div>
                医院图标:<img id="img_id" name="hospitalIcon" width="100px" height="100px" type="image" src="images/${userHospital.getIcon()}.png">
                <input type="file" name="image" onchange="showImg()" id="img_file" accept=".png">
                <font id="hospitalIconError" style="color: green">√</font>
            </div>
            <div>
             医院等级：<input onblur="hospitalGradeBlur()" id="hospitalGrade" name="hospitalGrade" value="${userHospital.getGrade()}">
                <font id="hospitalGradeError" style="color: green">√</font>

            </div>
            <div>
            所在地区：<input onblur="hospitalAreaBlur()" id="“hospitalArea" name="hospitalArea" value="${userHospital.getArea()}">
                <font id="hospitalAreaError" style="color: green">√</font>
            </div>
            <div>
            详细地址：<textarea onblur="hospitalAddressBlur()" id="hospitalAddress" name="hospitalAddress" >${userHospital.getAddress()}</textarea>
                <font id="hospitalAddressError" style="color: green">√</font>

            </div>

            <div>
            开门时间：<input onblur="hospitalOpenBlur()" type="time" id="hospitalOpen" name="hospitalOpen"  value="${userHospital.getReleaseTime()}">
                <font id="hospitalOpenError" style="color: red">保存前需确认</font>

            </div>
            <div>
            关门时间：<input onblur="hospitalCloseBlur()" type="time" id="hospitalClose" name="hospitalClose"  value="${userHospital.getStopTime()}">
                <font id="hospitalCloseError" style="color: red">保存前需确认</font>

            </div>
            <div>
            预约规则：<textarea onblur="hospitalRuleBlur()" id="hospitalRule" name="hospitalRule" style="width: 300px; height: 60px" >${userHospital.getRule()}</textarea>
                <font id="hospitalRuleError" style="color: green">√</font>

            </div>
            <div>
            医院详情：<textarea onblur="hospitalDetailsBlur()" id="hospitalDetails" name="hospitalDetails" style="width: 400px; height: 200px" >${userHospital.getDetails()}</textarea>
                <font id="hospitalDetailsError" style="color: green">√</font>
            </div>
            <button style="margin-left:300px;margin-bottom:20px;width: 200px; height: 60px; border: none; background-color: #85f2ff" type="button" onclick="submitHospitalMessage()">保存</button>
        </form>
    </div>
</div>
</body>
</html>
