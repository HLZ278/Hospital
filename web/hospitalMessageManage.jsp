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

    </style>
</head>
<body>
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">

    <div class="hospitalContainer" style="overflow: auto;margin: 10px; position: absolute;top: 70px;background-color: white;  width: calc(100% - 320px); height: 630px">
        <form action="updateHospitalMessage" method="post" enctype="multipart/form-data">
            <div>
                医院名称：<input name="hospitalName" value="${userHospital.getHospitalName()}">
            </div>
            <div>
                医院图标:<img name="hospitalIcon" type="image" src="images/${userHospital.getIcon()}.png">
                <input type="file" name="image"  accept=".png">
            </div>
            <div>
             医院等级：<input name="hospitalGrade" value="${userHospital.getGrade()}">
            </div>
            <div>
            所在地区：<input name="hospitalArea" value="${userHospital.getArea()}">
            </div>
            <div>
            详细地址：<textarea name="hospitalAddress" >${userHospital.getAddress()}</textarea>
            </div>

            <div>
            开门时间：<input type="time" name="hospitalOpen"  value="${userHospital.getReleaseTime()}">
            </div>
            <div>
            关门时间：<input type="time" name="hospitalClose"  value="${userHospital.getStopTime()}">
            </div>
            <div>
            预约规则：<textarea name="hospitalRule" style="width: 300px; height: 60px" >${userHospital.getRule()}</textarea>
            </div>
            <div>
            医院详情：<textarea name="hospitalDetails" style="width: 400px; height: 200px" >${userHospital.getDetails()}</textarea>
            </div>
            <button type="submit">保存</button>
        </form>
    </div>
</div>


</body>
</html>
