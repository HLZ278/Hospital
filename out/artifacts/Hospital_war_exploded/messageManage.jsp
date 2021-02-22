<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/tableLeft.css">
</head>
<body>
<div class="rightMain" style="background-color: #f0f0f0;float: right;  width: calc(100% - 300px);height: 100%">
    <c:choose>
        <c:when test="${user.getUserType()==2}">
            <div style="margin: 10px; position: absolute;top: 70px;background-color: white; height: 70px; width: calc(100% - 320px)">
                <button style="float: left; line-height: 70px; margin-left: 30px" onclick="add()" class="weightText">添加</button>
            </div>
        </c:when>
        <c:otherwise>
            <div style="margin: 10px; position: absolute;top: 70px;background-color: white; height: 70px; width: calc(100% - 320px);text-align: center; line-height: 70px; font-size: 30px; font-weight: 600">
                留言管理
            </div>
        </c:otherwise>
    </c:choose>
    <div style="margin: 10px; position: absolute;top: 150px;background-color: white; width: calc(100% - 320px); height: 550px">
        <table id="tab" border="1" cellspacing="0">
            <tr>
                <th>留言编号</th>
                <th>标题</th>
                <th>留言时间</th>
                <th>操作</th>
            </tr>
            <%--这个list就是在selevt中设置到request域中的json--%>
            <c:forEach var="message" items="${ messages }">
                <tr>
                    <td>${message.getMessageID()}</td>
                    <td>${message.getTitle()}</td>
                    <td>${message.getCreateTime()}</td>
                    <%--&quot;的作用是：js函数传入数字就没问题，传入中文、字母等字符串就会没效果，加上&quot;表示引用""的含义只要就不会出错--%>
                    <td><a href="JavaScript:showMessage(&quot;${message.getContent()}&quot;)">查看内容</a>|<a href="JavaScript:deleteMessage(${message.getMessageID()})">删除</a></td>

                </tr>
            </c:forEach>
        </table>
        <div style="position:absolute; bottom: 0;left: 0; margin-left: 20px; height: 40px" >
            一页最多显示14条记录，共${pageCount}页
        </div>
        <div style="position:absolute; bottom: 0;right: 0; margin: 10px;  width: 170px; height: 40px" >
            <button onclick="preMessages(${pageCount})" id="pre" class="weightText" style="float: left; height: 40px; width: 60px">上一页</button>
            <div id="pageNum" style="float: left; line-height: 40px;margin-left: 19px">${nowPage+1}</div>
            <button onclick="nextMessages(${pageCount})" class="weightText" style="float: right; height: 40px; width: 60px">下一页</button>
        </div>
    </div>
</div>
<div id="ooo" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">添加留言</div>
        <div>
            <form id="addMessage" method="post" action="insertMessage" >
                <div>
                    请输入标题:<input type="text" onblur="titleBlur()" id="title" name="title" autocomplete="off"/>
                    <font id="titleError" style="color: red">必填</font>

                </div>
                <div>
                    请输入内容:<textarea id="content" onblur="contentBlur()" name="content" autocomplete="off" />
                    <font id="contentError" style="color: red">必填</font>
                </div>
                <div class="popup__btnWrapper">
                    <button class="popup__yesBtn" type="button" onclick="addMessage()">Yes</button>
                    <button class="popup__noBtn" type="button" onclick="addCancle()">No</button>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>

