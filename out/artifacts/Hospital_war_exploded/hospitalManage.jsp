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
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/popWindow.css">
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
      <font style="color: white; font-weight: 700; font-size: 20px; font-family: FontAwesome">欢迎您，亲爱的${hospitalName}管理员</font>
    </div>
    <div class="sysMenuItem">
      <ul>
        <li id="departmentManage" class="sysLi"><a>科室管理</a><span style="margin-left: 5px">></span></li>
        <li id="orderManage" class="sysLi"><a>预约订单管理</a><span style="margin-left: 5px">></span></li>
        <li id="messageManage" class="sysLi"><a>留言管理</a><span style="margin-left: 5px">></span></li>
      </ul>
    </div>
  </div>

  <div id="hospitalRight">
  </div>
</div>


<script type="text/javascript">
  window.onload = function () {
    let filter = document.getElementsByClassName("sysLi")
    for (let i = 0; i < filter.length; i++) {
      filter[i].addEventListener('click', function () {
        switch ($(this).attr("id")) {
          case "departmentManage":
            window.location.href="queryDepartment?page="+0+"&current="+1
            break;
          case "orderManage":
            window.location.href="queryHospitalOrderManageView?page="+0+"&current="+2
            break;
          case "messageManage":
            //window.location.href="messageManage?page="+0+"&current="+3
            break;
          default:
            break;
        }
        filter[i].style.backgroundColor = "#4bbfd4"
        for (let j = 0; j < filter.length; j++) {
          if (i != j) {
            filter[j].style.backgroundColor = "#4097ac"
          }
        }
      })
    }
    switch (<%=request.getParameter("current")%>) {
      case 1:
        filter[0].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="departmentManage.jsp"%>`)
        break;
      case 2:
        filter[1].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="orderManage.jsp"%>`)
        break;
      case 3:
        filter[2].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="messageManage.jsp"%>`)
        break;
      case 4:
        filter[0].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="dorctorManage.jsp"%>`)
        break;
      case 5:
          filter[0].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="numSrc.jsp"%>`)
        break;
      default:
        break;
    }
  };
  function addDepartment() {
    $('#ooo').css('display','block')
  }
  function addCancle() {
    $('#ooo').css('display','none')
  }
  function addDepartmentConfirm() {
    $('#addDepartment').submit()
  }
  function departmentSearch() {
    window.location.href="queryDepartment?page="+0+"&current="+1+"&departmentName="+$('#departmentName').val()
  }
  function deleteDepartment(departmentID) {
    if (confirm("确定删除?")) {
      window.location.href = "deleteDepartment?departmentID="+departmentID
    }
  }
  function updateDepartment(obj) {
    $(obj.parentNode.parentNode).children('td').each(function (j) {
      switch (j) {
        case 0:
          $("#updateDepartmentID").val($(this).text())
        case 1:
          $("#updateDepartmentType").val($(this).text())
          break;
        case 2:
          $("#updateDepartmentName").val($(this).text())
          break;
        case 3:
          $("#updatePosition").val($(this).text())
          break;
        case 4:
          $("#updateWorkTime").val($(this).text())
          break;
        case 5:
          $("#updateCloseTime").val($(this).text())
          break;
      }
    })
    $("#updateBox").css('display', 'block')
  }
  function updateDepartmentConfirm() {
    $("#departmentUpdate").submit()
  }
  function updateDepartmentCancle() {
    $("#updateBox").css('display', 'none')
  }
  function doctorManageEnter(departmentID) {
    window.location.href="queryDoctor?page="+0+"&current="+4+"&departmentID="+departmentID
  }

  function addDoctor() {
    $("#addDoctorBox").css('display', 'block')
  }
  function addDoctorConfirm() {
    $("#addDoctor").submit()
  }
  function addDoctorCancle() {
    $("#addDoctorBox").css('display', 'none')
  }
  function deleteDoctor(doctorID, departmentID) {
    if (confirm("确定删除?")) {
      window.location.href = "deleteDoctor?doctorID="+doctorID+"&departmentID="+departmentID
    }
  }
  function updateDoctor(obj) {
    $(obj.parentNode.parentNode).children('td').each(function (j) {
      switch (j) {
        case 0:
          $("#updateDoctorID").val($(this).text())
          break;
        case 1:
          $("#updateDoctorName").val($(this).text())
              break;
        case 2:
          $("#updateJob").val($(this).text())
          break;
        case 3:
          switch ($(this).text()){
            case "男":
              $("#updateIdCardType").val(1)
              break;
            case "女":
              $("#updateIdCardType").val(2)
              break;
          }
          break;
        case 4:
          $("#updateAge").val($(this).text())
          break;
        case 5:
          $("#updateExpertise").val($(this).text())
          break;
        case 6:
          $("#updateCost").val($(this).text())
          break;
      }
    })
    $("#updateBox").css('display', 'block')
  }
  function updateCancle() {
    $("#updateBox").css('display', 'none')
  }
  function updateDoctorConfirm() {
    $("#doctorUpdate").submit()
  }
  function numSrcManageEnter(doctorID, departmentID) {
    window.location.href="queryNumSrc?page="+0+"&current="+5+"&departmentID="+departmentID+"&doctorID="+doctorID
  }
  function add1() {
    $("#remainNum1")[0].innerHTML=parseInt($("#remainNum1")[0].innerHTML)+1
    $("#totalNum1")[0].innerHTML=parseInt($("#totalNum1")[0].innerHTML)+1
  }
  function sub1() {
    $("#remainNum1")[0].innerHTML=parseInt($("#remainNum1")[0].innerHTML)-1
    $("#totalNum1")[0].innerHTML=parseInt($("#totalNum1")[0].innerHTML)-1
  }
  function add2() {
    $("#remainNum2")[0].innerHTML=parseInt($("#remainNum2")[0].innerHTML)+1
    $("#totalNum2")[0].innerHTML=parseInt($("#totalNum2")[0].innerHTML)+1
  }
  function sub2() {
    $("#remainNum2")[0].innerHTML=parseInt($("#remainNum2")[0].innerHTML)-1
    $("#totalNum2")[0].innerHTML=parseInt($("#totalNum2")[0].innerHTML)-1
  }
  function add3() {
    $("#remainNum3")[0].innerHTML=parseInt($("#remainNum3")[0].innerHTML)+1
    $("#totalNum3")[0].innerHTML=parseInt($("#totalNum3")[0].innerHTML)+1
  }
  function sub3() {
    $("#remainNum3")[0].innerHTML=parseInt($("#remainNum3")[0].innerHTML)-1
    $("#totalNum3")[0].innerHTML=parseInt($("#totalNum3")[0].innerHTML)-1
  }
  function saveNumSrc() {
    window.
    $.ajax({
      type:"post",
      url:"insertOrUpdateNumSrc",
      data:{"remainNum1": $("#remainNum1")[0].innerHTML
        ,"totalNum1": $("#totalNum1")[0].innerHTML
        ,"remainNum2": $("#remainNum2")[0].innerHTML
        ,"totalNum2": $("#totalNum2")[0].innerHTML
        ,"remainNum3": $("#remainNum3")[0].innerHTML
        ,"totalNum3": $("#totalNum3")[0].innerHTML
        ,"doctorID":<%=request.getParameter("doctorID")%>
      },
      success:function(data){
        alert(data)
      },
    });
  }

  function completeOrBreakOrder(orderID, completeOrBreak) {
     window.location.href="completeOrBreakOrder?completeOrBreak="+completeOrBreak+"&orderID="+orderID+"&page=0&current=2"
  }
  function searchOrderByID() {
      window.location.href="searchOrderByID?current="+2+"&orderID="+$("#orderID")[0].value
  }

  function preDepartmnet(pageCount) {
    var currentPage = $("#pageNum").html()
    if(currentPage==1){
    }else {
      window.location.href = "queryDepartment?page=" + (currentPage-2) + "&current=" + 1
    }
  }

  function nextDepartmnet(pageCount) {
    var currentPage = $("#pageNum").html()
    if(currentPage==pageCount){
    }else {
      window.location.href = "queryDepartment?page=" + (currentPage) + "&current=" + 1
    }
  }

  function preDoctor(pageCount, departmentID) {
    var currentPage = $("#pageNum").html()
    if(currentPage==1){
    }else {
      window.location.href="queryDoctor?page="+(currentPage-2)+"&current="+4+"&departmentID="+departmentID
    }
  }

  function nextDoctor(pageCount, departmentID) {
    var currentPage = $("#pageNum").html()
    if(currentPage==pageCount){
    }else {
      window.location.href="queryDoctor?page="+(currentPage)+"&current="+4+"&departmentID="+departmentID

    }
  }
  function preOrder(pageCount) {
    var currentPage = $("#pageNum").html()
    if(currentPage==1){
    }else {
      window.location.href="queryHospitalOrderManageView?page="+(currentPage-2)+"&current="+2
    }
  }
  function nextOrder(pageCount) {
    var currentPage = $("#pageNum").html()
    if(currentPage==pageCount){
    }else {
      window.location.href="queryHospitalOrderManageView?page="+(currentPage)+"&current="+2

    }
  }
</script>
</body>
</html>
