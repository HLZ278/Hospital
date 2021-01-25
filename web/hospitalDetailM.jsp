<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top: 20px;margin-left: 20px">
    <font style="font-weight: 600;font-size: 23px">${hospital.getHospitalName()}</font> <font style="color:grey;margin-left: 20px">${hospital.getGrade()}</font>
</div>
<div style="margin-left: 20px; margin-top: 10px">
    <div style="float: left"><img src="images/hospital1.png" style="width: 80px; height: 80px">
    </div>
    <div style="float: left">
        <font style=" margin-left: 20px">医院详情:</font>
        <div>
            <font style="font-size: 15px; color: grey; margin-left: 20px">医院地点:</font>
            <font style=" color: grey;font-size: 15px; margin-left: 10px">${hospital.getAddress()}</font>
        </div>
        <div>
            <font style=" color: grey; margin-left: 20px; font-size: 15px">挂号须知:</font>
            <font style=" color: grey;font-size: 15px; margin-left: 10px">${hospital.getRule()}</font>
        </div>
        <div>
            <div style="width: 600px; color: grey;font-size: 15px; margin-left: 20px;word-wrap: break-word;word-break: break-all;overflow: hidden;">退号注意:&nbsp;&nbsp;&nbsp;已完成预约的号源，如需办理退号，至少在就诊前12小时前通过网站、微信公众号、电话等平台预约渠道进行取消预约。</div>
        </div>
    </div>
</div>
<div style="float:left;margin: 20px;margin-top: 10px; width: 960px; height: 400px; margin-top: 50px">
    <div style="font-weight: 600;">医院介绍:</div>
    <div style="margin-top: 20px;width:900px;word-wrap: break-word;word-break: break-all;overflow: hidden;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hospital.getDetails()}
    </div>
</div>
