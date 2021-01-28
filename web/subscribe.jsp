<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .wapper{
        float: left; height: 80px; width: 290px;
    }
    .item{
        margin-left: 20px;
        margin-top: 25px;
        width:200px;
        height: 100px;
        z-index: 2;
        background-color: white;
        box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2);
        transition-duration:0.1s;
        transition-timing-function:linear;
        transition-delay:0s;
    }
    .item:hover{
        transform: scale(1.02);
        box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.51);
    }
</style>
<div style="margin-top: 20px;margin-left: 20px; text-align: center">
    <font style="font-weight: 600;font-size: 20px">请确认挂号信息</font>
</div>
<div style="margin: 10px">
    选择就诊人:
</div>
<div style="margin: 10px">
    <div style="float: left">
        <c:forEach var="patient" items="${ patients }" varStatus="status">
            <div style="padding: 10px; float: left " id="item${patient.patientID}" class="item" onclick="selectPatient(${patient.patientID})">
                    <div style="font-weight: 600">
                        <font>${patient.patientName}</font>
                    </div>
                    <div>
                        ${patient.gender}
                    </div>
                    <div>
                        ${patient.age}
                    </div>
            </div>
        </c:forEach>
    </div>
<%--    <div style="float: left; text-align: center" class="item" onclick="hospitalDetailM(${hospital.getHospitalID()})">--%>
<%--        <font style="line-height: 100px; color: #007bff">+ 添加就诊人</font>--%>
<%--    </div>--%>
</div>
<div style="margin: 10px; margin-top:160px;  clear: both;">
        详细信息:
</div>
<div style="margin: 10px">
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">就诊日期：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">2021年02月02日 周二 上午</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">就诊医院：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">中国人民解放军总医院(301医院)</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">就诊科室：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">肝脏外科门诊</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">医生姓名：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">李成刚</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">医生职称：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">副主任医师</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">医生专长：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">擅长原发性肝癌、肝脏转移癌和肝脏良性肿瘤的诊治，尤其在机器人微创肝脏肿瘤切除方面有较深造诣。</div>
    <div style="float:left;margin-top: 10px;margin-left:180px;color: grey">医事服务费：</div><div style="float:left;margin-top: 10px;width:600px;word-wrap: break-word;word-break: break-all;overflow: hidden;">60元</div>
</div>
<div style="text-align: center; height: 150px;clear: left">
    <button onclick="" style="margin-top: 30px; height: 50px; width: 150px; background: #4490f1; border: none; color: white">确认</button>
</div>

