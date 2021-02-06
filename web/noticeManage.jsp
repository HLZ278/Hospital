<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <input id="noticeTitle" type="text" autocomplete="off" placeholder="点击输入标题进行模糊搜索"/>
            <button onclick="searchNotice()" class="weightText">搜索</button>
        </div>
        <button onclick="add()" style="float: left; line-height: 70px; margin-left: 30px" class="weightText">添加</button>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>公告编号</th>
                <th>标题</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            <c:forEach var="notice" items="${ notices }">
                <tr>
                    <td>${notice.getNoticeID()}</td>
                    <td>${notice.getTitle()}</td>
                    <td>${notice.getCreateTime()}</td>
                    <td><a a href="#" onclick='updateNotice(this)'>修改</a>|<a href="JavaScript:deleteNoticeConfirm(${notice.getNoticeID()})">删除</a></td>
                </tr>
            </c:forEach>
        </table>

    </div>
</div>

<div id="ooo" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改医院信息</div>
        <div>
            <form id="insertNotice" method="post" action="insertNotice" >
                <div>
                    公告标题:<input type="text" name="noticeTitle" autocomplete="off" placeholder="点击输入用户名"/>
                </div>
                <div>
                    公告内容:<textarea name="noticeContent"></textarea>
                </div>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addNoticeConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="addCancle()">No</button>
        </div>
    </div>
</div>
<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改医院信息</div>
        <div>
            <form id="noticeUpdate" method="post" action="updateNotice" >
                <div>
                    公告标题:<input type="text" id="updateNoticeTitle"  name="noticeTitle" autocomplete="off" placeholder="点击输入用户名"/>
                </div>
                <div>
                    公告内容:<textarea name="noticeContent"></textarea>
                </div>
                <input id="updateNoticeID" type="text" style="display: none" name="noticeID" value="0"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updateNoticeConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updateCancle()">No</button>
        </div>
    </div>
</div>
</body>
</html>