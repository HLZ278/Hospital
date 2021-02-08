<%@ page import="entity.NumSrc" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/tableLeft.css">
    <style>
        .colorBlock{
            text-align:center;float: left; margin: 10px; height: 530px; width: 31.6%;
        }
        .srcDate{
            margin-top: 15px
        }
        .srcDate font{
            font-size:30px;font-weight: 700; color: white
        }
        .remain {
            margin-top: 100px
        }
        .remain font{
            font-size:60px;font-weight: 700; color: white
        }
        .total{
            margin-top: 60px
        }
        .total font{
            font-size:40px;font-weight: 700; color: white
        }
        .addAndSub{
            margin: 60px
        }
        .addAndSub button{
            font-size:40px;font-weight: 700; color: white; background: rgba(255,255,255,0.53); border: none;width: 60px
        }
        .save{
            color: #007bff; float: right; margin-right: 20px; line-height: 70px; width: 70px; background: none; border: none; font-size: 20px; font-weight: 600
        }
        .save:hover{
            color: rgba(0, 123, 255, 0.54);
        }
    </style>
</head>
<body>
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
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">

    <div style="text-align: center; margin: 10px; position: absolute;top: 70px;background-color: white; height: 70px; width: calc(100% - 320px)">
        <font style="font-size:30px; font-weight:600;line-height: 70px; color: #007bff">号源管理：</font>
        <font style="font-size:30px;line-height: 70px">科室：${department.getDepartmentName()}->医生：${doctor.getDoctorName()}</font>
        <button class="save" onclick="saveNumSrc()">保存</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <div class="colorBlock" style="background-color: #ff4a1a">
            <div class="srcDate">
                <font>明天 -</font>
                <font><%= strCurrentTime %></font>
            </div>
            <div class="remain">
                <font style="">剩余：</font>
                <font id="remainNum1">${numSrcs.get(0).getRemain()}</font>
            </div>
            <div class="total">
                <font >总量：</font>
                <font id="totalNum1">${numSrcs.get(0).getTotal()}</font>
            </div>
            <div class="addAndSub">
                <button onclick="add1()" style="float: left;">+</button>
                <button onclick="sub1()" style="float: right;">-</button>
            </div>
        </div>
        <div class="colorBlock" style=" background-color: #007bff">
            <div class="srcDate">
                <font >后天 -</font>
                <font ><%= tomorrowDate %></font>
            </div>
            <div class="remain">
                <font >剩余：</font>
                <font id="remainNum2">${numSrcs.get(1).getRemain()}</font>
            </div>
            <div class="total">
                <font>总量：</font>
                <font id="totalNum2">${numSrcs.get(1).getTotal()}</font>
            </div>
            <div class="addAndSub">
                <button onclick="add2()" style="float: left;">+</button>
                <button onclick="sub2()" style="float: right;">-</button>
            </div>
        </div>
        <div class="colorBlock" style=" background-color: #ffe206">
            <div class="srcDate">
                <font>大后天 -</font>
                <font><%= bigTomorrowDate %></font>
            </div>
            <div class="remain">
                <font>剩余：</font>
                <font id="remainNum3">${numSrcs.get(2).getRemain()}</font>
            </div>
            <div class="total">
                <font>总量：</font>
                <font id="totalNum3">${numSrcs.get(2).getTotal()}</font>
            </div>
            <div class="addAndSub" style="margin: 60px">
                <button onclick="add3()" style="float: left;">+</button>
                <button onclick="sub3()" style="float: right;">-</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
