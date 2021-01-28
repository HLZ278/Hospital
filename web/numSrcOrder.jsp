<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div onclick="dataChoose('<%= strCurrentTime %>')" style="text-align:center; background-color: grey;float: left;margin: 30px; margin-left: 50px; border-radius: 10px; width: 180px; height: 90px">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= strCurrentTime %></font>
        </div>
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px">有号</font>
        </div>
    </div>


    <div onclick="dataChoose('<%= tomorrowDate %>')" style="text-align:center;background-color: grey;float: left;margin: 30px; margin-left: 50px;border-radius: 10px; width: 180px; height: 90px">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= tomorrowDate %></font>
        </div>
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px">有号</font>
        </div>
    </div>


    <div onclick="dataChoose('<%= bigTomorrowDate %>')" style="text-align:center;background-color: grey;float: left;margin: 30px; margin-left: 50px;border-radius: 10px; width: 180px; height: 90px">
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px"><%= bigTomorrowDate %></font>
        </div>
        <div style="border-bottom: 1px solid rgba(0,0,0,0.2); width: 100%; height: 45px">
            <font style="line-height: 45px">有号</font>
        </div>
    </div>
</div>

<div style="clear: both; margin-left: 20px">
    <font style="font-weight: 600">可预约号源</font>
</div>
<div style="clear: both; margin-left: 20px" id="doctors">

</div>


