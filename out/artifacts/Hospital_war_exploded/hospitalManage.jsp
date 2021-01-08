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
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/hospotalManage.css">
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
    <div style="background-color: #42e8e8; padding-top: 60px;padding-bottom: 60px; padding-right: 20px; padding-left: 20px">
      <font style="color: white; font-weight: 700; font-size: 20px; font-family: FontAwesome">欢迎您，亲爱的大连市医科大学附属第一医院管理员</font>
    </div>
    <div class="sysMenuItem">
      <ul>
        <li class="sysLi"><a>科室管理</a><span style="margin-left: 5px">></span></li>
        <li class="sysLi"><a>预约订单管理</a><span style="margin-left: 5px">></span></li>
        <li class="sysLi"><a>留言管理</a><span style="margin-left: 5px">></span></li>
      </ul>
    </div>
  </div>

  <div>
    <jsp:include page="numSrc.jsp"></jsp:include>
  </div>
</div>


<script type="text/javascript">
  window.onload = function () {
    let filter = document.getElementsByClassName("sysLi")
    for (let i = 0; i < filter.length; i++) {
      filter[i].addEventListener('click', function () {
        filter[i].style.backgroundColor = "#4bbfd4"
        for (let j = 0; j < filter.length; j++) {
          if (i != j) {
            filter[j].style.backgroundColor = "#4097ac"
          }
        }
      })
    }
  };
</script>
</body>
</html>
