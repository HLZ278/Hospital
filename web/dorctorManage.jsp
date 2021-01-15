<%@ page import="entity.Department" %><%--
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
        .searchi{
            float: left;
            width: 290px;
            line-height: 70px;
            margin-left: 30px;
            margin-right: 5px;
            border: none;
        }
    </style>
</head>
<body>
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">

    <div style="margin: 10px; position: absolute;top: 70px;background-color: white; height: 70px; width: calc(100% - 320px)">
        <div class="searchi">
            <font style="font-size: 20px">科室名:${department.getDepartmentName()}</font>
        </div>
        <button onclick="addDoctor()" style="float: left; line-height: 70px; margin-left: 30px" class="weightText">添加医生</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>医生号</th>
                <th>医生名</th>
                <th>医生职位</th>
                <th>性别</th>
                <th>年龄</th>
                <th>专长</th>
                <th>预约费用</th>
                <th>号源管理</th>
                <th>信息管理</th>
            </tr>
            <c:forEach var="doctor" items="${ list }">
                <tr>
                    <td>${doctor.doctorID}</td>
                    <td>${doctor.doctorName}</td>
                    <td>${doctor.job}</td>
                    <td>${doctor.gender}</td>
                    <td>${doctor.age}</td>
                    <td>${doctor.expertise}</td>
                    <td>${doctor.cost}</td>
                    <td><a href="#">进入</a></td>
                    <td><a href="#" onclick='updateDoctor(this)'>修改</a>|<a href="JavaScript:deleteDoctor('${doctor.doctorID}', '${department.getDepartmentID()}')">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示15条记录，共5页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div style="float: left; line-height: 40px;margin-left: 17px">01</div>
            <button class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
<div id="addDoctorBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">添加医生</div>
        <div>
            <form id="addDoctor" method="post" action="doctorInsert" >
                <div>
                    医生名:<input type="text" name="doctorName" autocomplete="off" placeholder="点击输入医生名"/>
                </div>
                <div>
                    医生职位:<input type="text" name="job" autocomplete="off" placeholder="点击输入医生职位"/>
                </div>
                <div>
                    性别:<select name="gender">
                    <option value ="1">男</option>
                    <option value ="2">女</option>
                    </select>
                </div>
                <div>
                    年龄:<input type="number" name="age" autocomplete="off" placeholder="点击输入年龄"/>
                </div>
                <div>
                    专长:<input type="text" name="expertise" autocomplete="off" placeholder="点击输入专长"/>
                </div>
                <div>
                    预约费用:<input type="number" name="cost" autocomplete="off" placeholder="点击输入预约费用"/>
                </div>
                <input type="hidden" name="departmentID" autocomplete="off" value="${department.getDepartmentID()}"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addDoctorConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="addDoctorCancle()">No</button>
        </div>
    </div>
</div>
<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改医生信息</div>
        <div>
            <form id="doctorUpdate" method="post" action="doctorUpdate" >
                <div>
                    医生名:<input id="updateDoctorName" type="text" name="doctorName" autocomplete="off" placeholder="点击输入医生名"/>
                </div>
                <div>
                    医生职位:<input id="updateJob" type="text" name="job" autocomplete="off" placeholder="点击输入医生职位"/>
                </div>
                <div>
                    性别:<select id="updateGender" name="gender">
                    <option value ="1">男</option>
                    <option value ="2">女</option>
                </select>
                </div>
                <div>
                    年龄:<input id="updateAge" type="number" name="age" autocomplete="off" placeholder="点击输入年龄"/>
                </div>
                <div>
                    专长:<input id="updateExpertise" type="text" name="expertise" autocomplete="off" placeholder="点击输入专长"/>
                </div>
                <div>
                    预约费用:<input id="updateCost" type="number" name="cost" autocomplete="off" placeholder="点击输入预约费用"/>
                </div>
                <input id="updateDoctorID" type="text" style="display: none" name="doctorID" value="0"/>
                <input type="hidden" name="departmentID" autocomplete="off" value="${department.getDepartmentID()}"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updateDoctorConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updateCancle()">No</button>
        </div>
    </div>
</div>
</body>
</html>
