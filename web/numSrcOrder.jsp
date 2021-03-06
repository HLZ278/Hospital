<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .datesrc:hover{
        transform: scale(1.02);
        box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.51);
    }
</style>
<div style="margin-top: 20px;margin-left: 20px">
    <font style="font-weight: 600;font-size: 23px">${hospital.getHospitalName()}</font>
    <font style="color:grey;margin-left: 20px">${hospital.getGrade()}</font>
    <font style="color:grey;margin-left: 20px">口腔内科</font>
</div>
<div style="margin-top: 20px;margin-left: 40px">
    <font style="color:grey;margin-left: 20px">上班时间:10:00</font>
    <font style="color:grey;margin-left: 20px">下班时间:18:00</font>
</div>
<%
    java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("MM月dd日");
    Date date = new Date();
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    calendar.add(calendar.DATE,1);
    Date tomorrowTime = calendar.getTime();
    calendar.add(calendar.DATE,1);
    Date bigTomorrowTime = calendar.getTime();
    String strCurrentTime=formater.format(date);
    String tomorrowDate=formater.format(tomorrowTime);
    String bigTomorrowDate=formater.format(bigTomorrowTime);
%>
<div>
    <div  class="datesrc" onclick="dataChoose('<%= strCurrentTime %>', this)" style="text-align:center; float: left;margin: 30px; margin-left: 50px; border-radius: 10px; width: 180px; height: 90px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= strCurrentTime %></font>
        </div>
        <div style="width: 100%; height: 45px">
            <font style="line-height: 45px">${havas.get(0)}</font>
        </div>
    </div>


    <div class="datesrc" onclick="dataChoose('<%= tomorrowDate %>', this)" style="text-align:center;float: left;margin: 30px; margin-left: 50px;border-radius: 10px; width: 180px; height: 90px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= tomorrowDate %></font>
        </div>
        <div style=" width: 100%; height: 45px">
            <font style="line-height: 45px">${havas.get(1)}</font>
        </div>
    </div>


    <div class="datesrc" onclick="dataChoose('<%= bigTomorrowDate %>', this)" style="text-align:center;float: left;margin: 30px; margin-left: 50px;border-radius: 10px; width: 180px; height: 90px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= bigTomorrowDate %></font>
        </div>
        <div style=" width: 100%; height: 45px">
            <font style="line-height: 45px">${havas.get(2)}</font>
        </div>
    </div>
</div>

<div style="clear: both; margin-left: 20px">
    <font style="font-weight: 600">可预约号源</font>
</div>
<div style="clear: both; margin-left: 20px" id="doctors">

</div>


