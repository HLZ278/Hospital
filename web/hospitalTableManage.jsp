<%--
  Created by IntelliJ IDEA.
  User: 96916
  Date: 2021/1/7
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/popWindow.css">
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
            <input id="hospitalName" type="text" autocomplete="off" placeholder="点击输入医院名称"/>
            <button onclick="hospitalSearchByName()" class="weightText">搜索</button>
        </div>
        <button onclick="add()" style="float: left; line-height: 70px; margin-left: 30px" class="weightText">添加</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>医院ID</th>
                <th>医院名</th>
                <th>等级</th>
                <th>地区</th>
                <th>地点</th>
                <th>开门时间</th>
                <th>关门时间</th>
                <th>管理员ID</th>
                <th>操作</th>
            </tr>
            <c:forEach var="hospital" items="${ list }">
                <tr>
                    <td>${hospital.hospitalID}</td>
                    <td>${hospital.hospitalName}</td>
                    <td>${hospital.grade}</td>
                    <td>${hospital.area}</td>
                    <td>${hospital.address}</td>
                    <td>${hospital.releaseTime}</td>
                    <td>${hospital.stopTime}</td>
                    <c:choose>
                        <c:when test="${hospitalIDMap.get(hospital.hospitalID)!=0}"><td>${hospitalIDMap.get(hospital.hospitalID)}</td></c:when>
                        <c:otherwise><td><a href="JavaScript:addHospitalUser(${hospital.hospitalID})">添加</a></td></c:otherwise>
                    </c:choose>
                    <td><a href="#" onclick='updateHospital(this)'>修改</a>|<a href="JavaScript:deleteHospitalConfirm(${hospital.hospitalID})">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示14条记录，共${pageCount}页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button onclick="preHospitalTable(${pageCount})" id="pre" class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div id="pageNum" style="float: left; line-height: 40px;margin-left: 19px">${nowPage+1}</div>
            <button onclick="nextHospitalTable(${pageCount})" class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
<div id="ooo" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">添加普通用户</div>
        <div>
            <form id="addHospital" method="post" action="hospitalInsert" >
                <div>
                    医院名:<input type="text" name="hospitalName" autocomplete="off" placeholder="点击输入用户名"/>
                </div>
                <div>
                    医院等级:<input type="text" name="grade" autocomplete="off" placeholder="点击输入密码"/>
                </div>
                <div>
                    地区:<input type="text" name="area" autocomplete="off" placeholder="点击输入手机号"/>
                </div>
                <div>
                    地点:<input type="text" name="address" autocomplete="off" placeholder="点击输入真实姓名"/>
                </div>
                <div>
                    开门时间:<input type="time" name="releaseTime" autocomplete="off"/>
                </div>
                <div>
                    关门时间:<input type="time" name="stopTime" autocomplete="off" />
                </div>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addHospital()">Yes</button>
            <button class="popup__noBtn" onclick="addCancle()">No</button>
        </div>
    </div>
</div>
<div id="addHU" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">为该医院添加医院管理员</div>
        <div>
            <form id="addUser" method="post" action="userInsert" >
                <div>
                    请输入用户名:<input type="text" name="userName" autocomplete="off" placeholder="点击输入用户名"/>
                </div>
                <div>
                    请输入密码:<input type="text" name="userPwd" autocomplete="off" placeholder="点击输入密码"/>
                </div>
                <div>
                    手机号:<input type="text" name="userTel" autocomplete="off" placeholder="点击输入手机号"/>
                </div>
                <div>
                    真实姓名:<input type="text" name="realName" autocomplete="off" placeholder="点击输入真实姓名"/>
                </div>
                <div>
                    身份证类型:<select name="idCardType">
                    <option value ="1">居民身份证</option>
                    <option value ="2">港澳居民来往内地通行证</option>
                    <option value="3">台湾居民来往大陆通行证</option>
                    <option value="4">护照</option>
                    <option value="5">外国人永久居留身份证</option>
                    <option value="6">港澳居民居住证</option>
                    <option value="7">台湾居民居住证</option>
                </select>
                </div>
                <div>
                    身份证号码:<input type="text" name="idCardNum" autocomplete="off" placeholder="点击输入身份证号"/>
                </div>
                <input type="text" style="display: none" name="userType" value="2"/>
                <input id="addUserHospitalID" type="text" style="display: none" name="hospitalID"/>
                <input type="text" style="display: none" name="which" value="1"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addHU()">Yes</button>
            <button class="popup__noBtn" onclick="addHUCancle()">No</button>
        </div>
    </div>
</div>
<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改医院信息</div>
        <div>
            <form id="hospitalUpdate" method="post" action="hospitalUpdate" >
                <div>
                    医院名:<input id="updateHospitalName" type="text" name="hospitalName" autocomplete="off" placeholder="点击输入用户名"/>
                </div>
                <div>
                    等级:<input id="updateGrade" type="text" name="grade" autocomplete="off" placeholder="点击输入密码"/>
                </div>
                <div>
                    地区:<input id="updateArea" type="text" name="area" autocomplete="off" placeholder="点击输入手机号"/>
                </div>
                <div>
                    地点:<input id="updateAddress" type="text" name="address" autocomplete="off" placeholder="点击输入真实姓名"/>
                </div>
                <div>
                    开门时间:<input id="updateReleaseTime" type="time" name="releaseTime" autocomplete="off" placeholder="点击输入真实姓名"/>
                </div>
                <div>
                    关门时间:<input id="updateStopTime" type="time" name="stopTime" autocomplete="off" placeholder="点击输入身份证号"/>
                </div>
                <input id="updateHospitalID" type="text" style="display: none" name="hospitalID" value="0"/>
                <input type="text" style="display: none" name="which" value="1"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updateHospitalConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updateCancle()">No</button>
        </div>
    </div>
</div>
</body>
</html>
