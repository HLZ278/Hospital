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
</head>
<body>
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">

    <div style="margin: 10px; position: absolute;top: 70px;background-color: white; height: 70px; width: calc(100% - 320px)">
        <div class="search">
            <svg t="1609910073093" class="icon" viewBox="0 0 1024 1024" version="1.1"
                 xmlns="http://www.w3.org/2000/svg"
                 p-id="2648" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20">
                <defs>
                    <style type="text/css"></style>
                </defs>
                <path d="M945.28512 875.7248l-159.02208-156.11904c50.65216-67.06688 81.0496-150.27712 81.0496-240.80384 0-221.12256-179.21536-400.37888-400.37376-400.37888-221.13792 0-400.384 179.25632-400.384 400.37888 0 221.16352 179.24096 400.39936 400.384 400.39936 101.888 0 194.62144-38.38464 265.27744-101.05856l159.24736 156.32896c15.6416 15.36512 40.36608 14.71488 55.2448-1.47456 14.84288-16.19456 14.21824-41.856-1.42336-57.27232z m-478.32064-67.15392c-182.10816 0-329.71776-147.6352-329.71776-329.74336 0-182.08768 147.61472-329.728 329.71776-329.728 182.0928 0 329.71776 147.6352 329.71776 329.728 0 182.10816-147.62496 329.74336-329.71776 329.74336z"
                      fill="#575757" p-id="2649"></path>
            </svg>
            <input id="departmentName" type="text" autocomplete="off" placeholder="点击输入科室名称"/>
            <button onclick="departmentSearch()" class="weightText">搜索</button>
        </div>
        <button onclick="addDepartment()" style="float: left; line-height: 70px; margin-left: 30px" class="weightText">添加</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>科室号</th>
                <th>科室总类别</th>
                <th>科室名称</th>
                <th>科室位置</th>
                <th>上班时间</th>
                <th>下班时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="department" items="${ list }">
                <tr>
                    <td>${department.departmentID}</td>
                    <td>${department.departmentType}</td>
                    <td>${department.departmentName}</td>
                    <td>${department.position}</td>
                    <td>${department.workTime}</td>
                    <td>${department.closeTime}</td>
                    <td><a href="JavaScript:doctorManageEnter(${department.departmentID})">管理</a>|<a href="#" onclick='updateDepartment(this)'>修改</a>|<a href="JavaScript:deleteDepartment(${department.departmentID})">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示14条记录，共${pageCount}页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button onclick="preDepartmnet(${pageCount})" id="pre" class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div id="pageNum" style="float: left; line-height: 40px;margin-left: 19px">${nowPage+1}</div>
            <button onclick="nextDepartmnet(${pageCount})" class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
<div id="ooo" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">添加科室</div>
        <div>
            <form id="addDepartment" method="post" action="departmentInsert" >
                <div>
                    科室名:<input type="text" onblur="departmentNameBlur()" id="departmentName2" name="departmentName" autocomplete="off" placeholder="点击输入科室名"/>
                    <font id="departmentNameError" style="color: red">必填</font>

                </div>
                <div>
                    科室总类:<input type="text" onblur="departmentTypeBlur()" id="departmentType" name="departmentType" autocomplete="off" placeholder="点击输入科室总类"/>
                    <font id="departmentTypeError" style="color: red">必填</font>

                </div>
                <div>
                    科室位置:<input type="text" onblur="positionBlur()" id="position" name="position" autocomplete="off" placeholder="点击输入科室位置"/>
                    <font id="positionError" style="color: red">必填</font>

                </div>
                <div>
                    上班时间:<input type="time" onblur="workTimeBlur()" id="workTime" name="workTime" autocomplete="off" />
                    <font id="workTimeError" style="color: red">请选择</font>
                </div>
                <div>
                    下班时间:<input type="time" onblur="closeTimeBlur()" id="closeTime" name="closeTime" autocomplete="off" />
                    <font id="closeTimeError" style="color: red">请选择</font>
                </div>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addDepartmentConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="addCancle()">No</button>
        </div>
    </div>
</div>
<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改科室信息</div>
        <div>
            <form id="departmentUpdate" method="post" action="departmentUpdate" >
                <div>
                    科室名:<input id="updateDepartmentName" onblur="updateDepartmentNameBlur()" type="text" name="departmentName" autocomplete="off" placeholder="点击输入科室名"/>
                    <font id="updateDepartmentNameError" style="color: green">√</font>
                </div>
                <div>
                    科室类别:<input id="updateDepartmentType" onblur="updateDepartmentTypeBlur()" type="text" name="departmentType" autocomplete="off" placeholder="点击输入科室类别"/>
                    <font id="updateDepartmentTypeError" style="color: green">√</font>
                </div>
                <div>
                    科室位置:<input id="updatePosition" type="text" onblur="updatePositionBlur()" name="position" autocomplete="off" placeholder="点击输入科室位置"/>
                    <font id="updatePositionError" style="color: green">√</font>
                </div>
                <div>
                    上班时间:<input id="updateWorkTime" type="time" onblur="updateWorkTimeBlur()" name="workTime" autocomplete="off"/>
                    <font id="updateWorkTimeError" style="color: red">请确认</font>
                </div>
                <div>
                    下班时间:<input id="updateCloseTime" type="time" onblur="updateCloseTimeBlur()" name="closeTime" autocomplete="off" />
                    <font id="updateCloseTimeError" style="color: red">请确认</font>
                </div>
                <input type="text" style="display: none" name="userType" value="1"/>
                <input id="updateDepartmentID" type="text" style="display: none" name="departmentID" value="0"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updateDepartmentConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updateDepartmentCancle()">No</button>
        </div>
    </div>
</div>
</body>
</html>
