<%@ page import="entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>home</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/head.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/headLogined.css">
</head>
<body>
<div class="home">
    <div class="homeHead">
        <div class="homeTitle">
            <svg t="1609896900733" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 p-id="572" xmlns:xlink="http://www.w3.org/1999/xlink" width="70" height="70">
                <defs>
                    <style type="text/css">
                    </style>
                </defs>
                <path d="M517.2 149.2c8.5-16.4 26.3-28.9 48-12.3l115.1 114.8c13.8 15 18.3 42.3 0.1 63.2L596 399.6h-0.6V266H441.8v138.9l-92.4-94c-17.5-22-10.3-46.2 5-61.9L464 140.8c17.2-15.6 39.9-16.2 53.2 8.4zM876.1 514c16.4-8.5 28.9-26.3 12.3-48L773.6 350.9c-15-13.8-42.3-18.3-63.2-0.1L622 440.5h139v154.9H626.4l87.9 86.4c22 17.5 46.2 10.3 61.9-5l108.2-109.6c15.7-17.1 16.2-39.8-8.3-53.2zM149.1 508.2c-16.4-8.5-28.9-26.3-12.3-48l114.8-115.1c15-13.8 42.3-18.3 63.2-0.1l84.3 84H266.7v154.9h138L310.9 676c-22 17.5-46.2 10.3-61.9-5L140.8 561.3c-15.7-17-16.2-39.7 8.3-53.1zM510.8 875.6c8.5 16.4 26.3 28.9 48 12.3l115.1-114.8c13.8-15 18.3-42.3 0.1-63.2l-90.4-88.3v138.1H430.8v-135L343 713.9c-17.5 22-10.3 46.2 5 61.9L457.7 884c17 15.7 39.8 16.2 53.1-8.4z"
                      fill="#E50012" p-id="573">
                </path>
            </svg>
        </div>

        <div class="homeTitle">
            <h1 class="title">Hospital</h1>
        </div>
        <c:choose>
            <c:when test="${user==null}">
                <div class="registBtn">
                    <a href="login.jsp">登陆/注册</a>
                </div>
            </c:when>
            <c:when test="${user.getUserType()==1}">
                <div class="dropdown">
                    <span>* ${user.getRealName().substring(user.getRealName().length()-2)} ▽</span>
                    <div class="dropdown-content">
                        <a href="javascript:patientManage();">就诊人管理</a>
                        <a href="javascript:orderManage();">预约挂号订单</a>
                        <a href="#" onclick="personMessage()">个人信息</a>
                        <a href="javascript:exit();">退出登录</a>
                    </div>
                </div>
            </c:when>
            <c:when test="${user.getUserType()==2}">
                <div class="dropdown">
                    <span>* ${user.getRealName().substring(user.getRealName().length()-2)} ▽</span>
                    <div class="dropdown-content">
                        <a href="queryDepartment?page=0&current=1">管理界面</a>
                        <a  href="javascript:exit();">退出登录</a>
                </div>
                </div>
            </c:when>
            <c:when test="${user.getUserType()==3}">
                <div class="dropdown">
                    <span>* ${user.getRealName().substring(user.getRealName().length()-2)} ▽</span>
                    <div class="dropdown-content">
                        <a href="ordinaryUser?page=0&current=1">管理界面</a>
                        <a href="javascript:exit();">退出登录</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
    </div>
</div>
<script>
    function exit() {
        window.location.href="exitLogin"
    }
    function patientManage() {
        window.location.href="queryPatient?current=1"
    }
    function personMessage() {
        window.location.href="patientManage.jsp?current="+3
    }
    function orderManage() {
        window.location.href="queryOrderManageView?current="+2
    }
</script>
</body>
</html>

