<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/tableLeft.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>
<div style="width: 1200px; margin-left:168px; position: absolute; top: 70px;">
    <div style="font-weight: 600; margin: 20px; text-align: center; font-size: 30px">
        平台公告
    </div>
    <c:forEach var="notice" items="${ notices }">
        <c:choose>
            <%-- 判断点击的公告的ID，在list中取出来打印--%>
            <c:when test="${notice.getNoticeID()==param.noticeID}">
                <div style="text-align: center;font-weight: 600">
                        ${notice.getTitle()}
                </div>
                <div style="margin-top: 20px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${notice.getContent()}                            ${notice.getContent()}
                        ${notice.getContent()}

                </div>

                <div style="margin:40px; float: right">
                        ${notice.getCreateTime()}
                </div>
            </c:when>
        </c:choose>

    </c:forEach>
</div>
<div style="">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>


