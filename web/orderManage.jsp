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
            <input id="orderID" type="text" autocomplete="off" placeholder="点击输入预约单号"/>
            <button onclick="searchOrderByID()" class="weightText">搜索</button>
        </div>
    </div>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; height: 70px; width: calc(100% - 320px); height: 550px">
        <table border="1" cellspacing="0">
            <tr>
                <th>预约单号</th>
                <th>科室</th>
                <th>医生</th>
                <th>就诊人</th>
                <th>预约就诊日期</th>
                <th>操作</th>
            </tr>
            <c:forEach var="orderManageView" items="${ orderManageViews }">
                <tr>
                    <td>${orderManageView.getOrderID()}</td>
                    <td>${orderManageView.getDepartmentName()}</td>
                    <td>${orderManageView.getDoctorName()}</td>
                    <td>${orderManageView.getPatientName()}</td>
                    <td>${orderManageView.getContractTime()}</td>
<%--                    <c:choose>--%>
<%--                        <c:when test="${hospitalIDMap.get(hospital.hospitalID)!=0}"><td>${hospitalIDMap.get(hospital.hospitalID)}</td></c:when>--%>
<%--                        <c:otherwise><td><a href="JavaScript:addHospitalUser(${hospital.hospitalID})">添加</a></td></c:otherwise>--%>
<%--                    </c:choose>--%>
                    <td><a href="#" onclick="completeOrBreakOrder('${orderManageView.getOrderID()}',1)">已履约</a>
                    | <a href="#" onclick="completeOrBreakOrder('${orderManageView.getOrderID()}',2)">已爽约</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示14条记录，共${pageCount}页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button onclick="preOrder(${pageCount})" id="pre" class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div id="pageNum" style="float: left; line-height: 40px;margin-left: 19px">${nowPage+1}</div>
            <button onclick="nextOrder(${pageCount})" class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
</body>
</html>
