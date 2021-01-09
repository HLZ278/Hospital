<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.User" %><%--
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
    <style>

        .popup__wrapper {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .popup {
            box-sizing: border-box;
            width: 670px;
            height: 300px;
            background: #fff;
            text-align: center;
            padding: 70px 10px 20px 10px;
            border-radius: 4px;
        }
        .popup__title{
            font-size: 30px;
            font-weight: 600;
            color: #004165;
            margin-bottom: 20px;
        }
        .popup__btnWrapper {
            width: 50%;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
        }
        .popup__text{
            font-size: 20px;
            margin-bottom: 50px;
        }

        .popup__yesBtn {
            color: #fff;
            background-color: #007dba;
            border: 1px solid #006ba1;
        }
    </style>
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
            <input type="text" autocomplete="off" placeholder="点击输入用户名称"/>
            <button class="weightText">搜索</button>
        </div>
        <button style="float: left; line-height: 70px; margin-left: 30px" onclick="add()" class="weightText">添加</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>电话</th>
                <th>注册日期</th>
                <th>真实姓名</th>
                <th>身份证类型</th>
                <th>身份证号</th>
                <th>操作</th>
            </tr>
<%--                        <%--%>

<%--                            out.println(request.getAttribute("list"));--%>
<%--                        %>--%>
            <c:forEach var="user" items="${ list }">
                <tr>
                    <td>${user.userID}</td>
                    <td>${user.userName}</td>
                    <td>${user.userPwd}</td>
                    <td>${user.userTel}</td>
                    <td>${user.registeDate}</td>
                    <td>${user.realName}</td>
                    <c:choose>
                        <c:when test="${user.idCardType==1}"><td>居民身份证</td></c:when>
                        <c:when test="${user.idCardType==2}"><td>港澳居民来往内地通行证</td></c:when>
                        <c:when test="${user.idCardType==3}"><td>台湾居民来往大陆通行证</td></c:when>
                        <c:when test="${user.idCardType==4}"><td>护照</td></c:when>
                        <c:when test="${user.idCardType==5}"><td>外国人永久居留身份证</td></c:when>
                        <c:when test="${user.idCardType==6}"><td>港澳居民居住证</td></c:when>
                        <c:when test="${user.idCardType==7}"><td>台湾居民居住证</td></c:when>
                        <c:otherwise><td>其他</td></c:otherwise>
                    </c:choose>
                    <td>${user.idCardNum}</td>
                    <td><a href="#">修改</a>/<a a href="#">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示15条记录，共5页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button id="pre" class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div style="float: left; line-height: 40px;margin-left: 17px">01</div>
            <button class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
<div id="ooo" class="popup__wrapper">
    <div class="popup">
        <div class="popup__title">Confirmation</div>
        <div class="popup__text">Are you sure you want to do this action?</div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="add()">Yes</button>
            <button class="popup__noBtn">No</button>
        </div>
    </div>
</div>
</body>
</html>
