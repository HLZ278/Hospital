<%--
  Created by IntelliJ IDEA.
  User: 96916
  Date: 2021/1/5
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/sysManage.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>
<div>
    <div class="leftMenu" style="position: absolute;text-align:center;
          top: 70px;float:left;background-color: rgba(7,120,147,0.77); width: 300px;height: calc(100% - 70px)">
        <div style="background-color: #42e8e8; line-height: 170px"><font
                style="color: white; font-weight: 700; font-size: 20px; font-family: FontAwesome">欢迎您，亲爱的管理员</font>
        </div>
        <div class="sysMenuItem">
            <ul>
                <li id="ordinaryUser" class="sysLi"><a >普通用户管理</a><span style="margin-left: 5px">></span></li>
                <li id="hospitalUser" class="sysLi"><a >医院用户管理</a><span style="margin-left: 5px">></span></li>
                <li id="hospital" class="sysLi"><a >医院管理</a><span style="margin-left: 5px">></span></li>
                <li id="notice" class="sysLi"><a >公告管理</a><span style="margin-left: 5px">></span></li>
                <li id="message" class="sysLi"><a >留言管理</a><span style="margin-left: 5px">></span></li>

            </ul>
        </div>
    </div>

    <div id="right">
        <%@ include file="commonUserManage.jsp" %>
    </div>
</div>


<script type="text/javascript">
    window.onload = function () {
        let filter = document.getElementsByClassName("sysLi")
        for (let i = 0; i < filter.length; i++) {
            filter[i].addEventListener('click', function () {
                var data = getData(filter[i].id)
                switch (this.id) {
                    case "ordinaryUser":
                        $("#right").html(String.raw`<%@ include file="commonUserManage.jsp" %>`)
                        break;
                    case "hospitalUser":
                        $("#right").html(String.raw`<%@ include file="hospitalUserManage.jsp" %>`)
                        break;
                    case "hospital":
                        $("#right").html(String.raw`<%@ include file="hospitalTableManage.jsp" %>`)
                        break;
                    default:
                        break;
                }
                filter[i].style.backgroundColor = "#4bbfd4"
                for (let j = 0; j < filter.length; j++) {
                    if (i !== j) {
                        filter[j].style.backgroundColor = "#4097ac"
                    }
                }
            })
        }
    };
    function getData(id) {
        window.
        $.ajax({
            type:"get",
            url:id,
            dataType:"text",
            success:function(data){
                return data
            },
        });
    }
</script>

</body>
</html>
