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
        <li id="hospitalMessageManage" class="sysLi"><a>医院管理</a><span style="margin-left: 5px">></span></li>
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
            window.location.href="queryMessageByUserID?page="+0+"&current="+3
            break;
          case "hospitalMessageManage":
            window.location.href="hospitalMessageManage?&current="+6
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
      case 6:
        filter[3].style.backgroundColor = "#4bbfd4"
        $("#hospitalRight").html(String.raw`<%@ include file="hospitalMessageManage.jsp"%>`)
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
    var temp = true
    if($("#departmentNameError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#departmentTypeError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#positionError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#workTimeError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#closeTimeError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if (temp){
      $('#addDepartment').submit()
    }else {
      alert("请填写完整")
    }
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
    updateDepartmentNameBlur()
    updateDepartmentTypeBlur()
    updatePositionBlur()
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
    var temp = true
    if($("#doctorNameError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#jobError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#ageError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#expertiseError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#costError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if (temp){
      $("#addDoctor").submit()
    }else {
      alert("请填写完整")
    }

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

    updateDoctorNameBlur()
    updateJobBlur()
    updateAgeBlur()
    updateExpertiseBlur()
    updateCostBlur()
    $("#updateBox").css('display', 'block')
  }
  function updateCancle() {
    $("#updateBox").css('display', 'none')
  }
  function updateDoctorConfirm() {
    var temp = true
    if($("#updateDoctorNameError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#updateJobError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#updateAgeError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#updateExpertiseError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#updateCostError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if (temp){
      $("#doctorUpdate").submit()

    }else {
      alert("请填写完整")
    }
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

  function completeOrBreakOrder(orderID, completeOrBreak,patientID) {
     window.location.href="completeOrBreakOrder?completeOrBreak="+completeOrBreak+"&orderID="+orderID+"&page=0&current=2&patientID="+patientID
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
  function preMessages() {
    var currentPage = $("#pageNum").html()
    if(currentPage==1){
    }else {
      window.location.href="queryMessageByUserID?page="+(currentPage-2)+"&current="+3
    }
  }
  function nextMessages(pageCount) {
    var currentPage = $("#pageNum").html()
    if(currentPage==pageCount){
    }else {
      window.location.href="queryMessageByUserID?page="+(currentPage)+"&current="+3
    }
  }
  function showMessage(content) {
    alert(content)
  }
  function deleteMessage(id) {
    if (confirm("确定删除?")) {
      window.location.href = "deleteMessage?messageID="+id
    }
  }
  function add() {
    $('#ooo').css('display', 'block')
  }



  function departmentNameBlur() {
    var departmentName = $("#departmentName2")[0].value
    if(departmentName==""){
      $("#departmentNameError").css("color","red")
      $("#departmentNameError").html('必填')
    }else{
      $("#departmentNameError").css("color","green")
      $("#departmentNameError").html('√')
    }
  }
  function departmentTypeBlur() {
      var departmentType = $("#departmentType")[0].value
      if(departmentType==""){
        $("#departmentTypeError").css("color","red")
        $("#departmentTypeError").html('必填')
      }else{
        $("#departmentTypeError").css("color","green")
        $("#departmentTypeError").html('√')
      }
  }
  function positionBlur() {
      var position = $("#position")[0].value
      if(position==""){
        $("#positionError").css("color","red")
        $("#positionError").html('必填')
      }else{
        $("#positionError").css("color","green")
        $("#positionError").html('√')
      }
  }

  function workTimeBlur() {
    var workTime = $("#workTime")[0].value
    if(workTime==""||workTime.split(":").length==3){
      $("#workTimeError").css("color","red")
      $("#workTimeError").html('请选择')
    }else{
      $("#workTimeError").css("color","green")
      $("#workTimeError").html('√')
    }
  }

  function closeTimeBlur() {
    var closeTime = $("#closeTime")[0].value
    if(closeTime==""||closeTime.split(":").length==3){
      $("#closeTimeError").css("color","red")
      $("#closeTimeError").html('请选择')
    }else{
      $("#closeTimeError").css("color","green")
      $("#closeTimeError").html('√')
    }
  }


  function updateDepartmentNameBlur() {
    var departmentName = $("#updateDepartmentName")[0].value
    if(departmentName==""){
      $("#updateDepartmentNameError").css("color","red")
      $("#updateDepartmentNameError").html('必填')
    }else{
      $("#updateDepartmentNameError").css("color","green")
      $("#updateDepartmentNameError").html('√')
    }
  }
  function updateDepartmentTypeBlur() {
    var departmentType = $("#updateDepartmentType")[0].value
    if(departmentType==""){
      $("#updateDepartmentTypeError").css("color","red")
      $("#updateDepartmentTypeError").html('必填')
    }else{
      $("#updateDepartmentTypeError").css("color","green")
      $("#updateDepartmentTypeError").html('√')
    }
  }
  function updatePositionBlur() {
    var position = $("#updatePosition")[0].value
    if(position==""){
      $("#updatePositionError").css("color","red")
      $("#updatePositionError").html('必填')
    }else{
      $("#updatePositionError").css("color","green")
      $("#updatePositionError").html('√')
    }
  }

  function updateWorkTimeBlur() {
    var workTime = $("#updateWorkTime")[0].value
    if(workTime==""||workTime.split(":").length==3){
      $("#updateWorkTimeError").css("color","red")
      $("#updateWorkTimeError").html('请选择')
    }else{
      $("#updateWorkTimeError").css("color","green")
      $("#updateWorkTimeError").html('√')
    }
  }

  function updateCloseTimeBlur() {
    var closeTime = $("#updateCloseTime")[0].value
    if(closeTime==""||closeTime.split(":").length==3){
      $("#updateCloseTimeError").css("color","red")
      $("#updateCloseTimeError").html('请选择')
    }else{
      $("#updateCloseTimeError").css("color","green")
      $("#updateCloseTimeError").html('√')
    }
  }
  function updateDoctorNameBlur() {
    var doctorName = $("#updateDoctorName")[0].value
    if(doctorName==""){
      $("#updateDoctorNameError").css("color","red")
      $("#updateDoctorNameError").html('必填')
    }else{
      $("#updateDoctorNameError").css("color","green")
      $("#updateDoctorNameError").html('√')
    }
  }
  function updateJobBlur() {
    var job = $("#updateJob")[0].value
    if(job==""){
      $("#updateJobError").css("color","red")
      $("#updateJobError").html('必填')
    }else{
      $("#updateJobError").css("color","green")
      $("#updateJobError").html('√')
    }
  }
  function updateAgeBlur() {
    var age = $("#updateAge")[0].value
    if(age==""||(age<0||age>100)){
      $("#updateAgeError").css("color","red")
      $("#updateAgeError").html('请输入正确年龄')
    }else{
      $("#updateAgeError").css("color","green")
      $("#updateAgeError").html('√')
    }
  }
  function updateExpertiseBlur() {
    var expertise = $("#updateExpertise")[0].value
    if(expertise==""){
      $("#updateExpertiseError").css("color","red")
      $("#updateExpertiseError").html('必填')
    }else{
      $("#updateExpertiseError").css("color","green")
      $("#updateExpertiseError").html('√')
    }
  }
  function updateCostBlur() {
    var cost = $("#updateCost")[0].value
    if(cost==""||(cost<0)){
      $("#updateCostError").css("color","red")
      $("#updateCostError").html('请输入正确费用')
    }else{
      $("#updateCostError").css("color","green")
      $("#updateCostError").html('√')
    }
  }


  function doctorNameBlur() {
    var doctorName = $("#doctorName")[0].value
    if(doctorName==""){
      $("#doctorNameError").css("color","red")
      $("#doctorNameError").html('必填')
    }else{
      $("#doctorNameError").css("color","green")
      $("#doctorNameError").html('√')
    }
  }
  function jobBlur() {
    var job = $("#job")[0].value
    if(job==""){
      $("#jobError").css("color","red")
      $("#jobError").html('必填')
    }else{
      $("#jobError").css("color","green")
      $("#jobError").html('√')
    }
  }
  function ageBlur() {
    var age = $("#age")[0].value
    if(age==""||(age<0||age>100)){
      $("#ageError").css("color","red")
      $("#ageError").html('请输入正确年龄')
    }else{
      $("#ageError").css("color","green")
      $("#ageError").html('√')
    }
  }
  function expertiseBlur() {
    var expertise = $("#expertise")[0].value
    if(expertise==""){
      $("#expertiseError").css("color","red")
      $("#expertiseError").html('必填')
    }else{
      $("#expertiseError").css("color","green")
      $("#expertiseError").html('√')
    }
  }
  function costBlur() {
    var cost = $("#cost")[0].value
    if(cost==""||(cost<0)){
      $("#costError").css("color","red")
      $("#costError").html('请输入正确费用')
    }else{
      $("#costError").css("color","green")
      $("#costError").html('√')
    }
  }
  function titleBlur() {
    var title = $("#title")[0].value
    if(title==""){
      $("#titleError").css("color","red")
      $("#titleError").html('必填')
    }else{
      $("#titleError").css("color","green")
      $("#titleError").html('√')
    }
  }
  function contentBlur() {
    var content = $("#content")[0].value
    if(content==""){
      $("#contentError").css("color","red")
      $("#contentError").html('必填')
    }else{
      $("#contentError").css("color","green")
      $("#contentError").html('√')
    }
  }
  function addMessage() {
    var temp = true
    if($("#titleError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#contentError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if (temp){
      $("#addMessage").submit()
    }else {
      alert("请填写完整")
    }
  }
  function hospitalNameBlur() {
    var hospitalName = $("#hospitalName")[0].value
    if(!hospitalName.match(/^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\s]{3,20})$/)){
      $("#hospitalNameError").css("color","red")
      $("#hospitalNameError").html('请输入正确医院名')
    }else{
      $("#hospitalNameError").css("color","green")
      $("#hospitalNameError").html('√')
    }
  }
  function hospitalGradeBlur() {
    var hospitalGrade = $("#hospitalGrade")[0].value
    if(hospitalGrade=="一级甲等"||hospitalGrade=="二级甲等"||hospitalGrade=="三级甲等"){
      $("#hospitalGradeError").css("color","green")
      $("#hospitalGradeError").html('√')
    }else{
      $("#hospitalGradeError").css("color","red")
      $("#hospitalGradeError").html('请输入正确等级')
    }
  }
  function hospitalAreaBlur() {

  }
  function hospitalAddressBlur() {
    var hospitalAddress = $("#hospitalAddress")[0].value
    if(hospitalAddress.trim()!=""){
      $("#hospitalAddressError").css("color","green")
      $("#hospitalAddressError").html('√')
    }else{
      $("#hospitalAddressError").css("color","red")
      $("#hospitalAddressError").html('请输入地址')
    }
  }
  function hospitalOpenBlur() {
    var hospitalOpen = $("#hospitalOpen")[0].value
    if(hospitalOpen==""||hospitalOpen.split(":").length==3){
      $("#hospitalOpenError").css("color","red")
      $("#hospitalOpenError").html('请选择')
    }else{
      $("#hospitalOpenError").css("color","green")
      $("#hospitalOpenError").html('√')
    }
  }
  function hospitalCloseBlur() {
    var hospitalClose = $("#hospitalClose")[0].value
    if(hospitalClose==""||hospitalClose.split(":").length==3){
      $("#hospitalCloseError").css("color","red")
      $("#hospitalCloseError").html('请选择')
    }else{
      $("#hospitalCloseError").css("color","green")
      $("#hospitalCloseError").html('√')
    }
  }
  function hospitalRuleBlur() {
    var hospitalRule = $("#hospitalRule")[0].value
    if(hospitalRule.trim()!=""){
      $("#hospitalRuleError").css("color","green")
      $("#hospitalRuleError").html('√')
    }else{
      $("#hospitalRuleError").css("color","red")
      $("#hospitalRuleError").html('请输入地址')
    }
  }
  function hospitalDetailsBlur() {
    var hospitalDetails = $("#hospitalDetails")[0].value
    if(hospitalDetails.trim()!=""){
      $("#hospitalDetailsError").css("color","green")
      $("#hospitalDetailsError").html('√')
    }else{
      $("#hospitalDetailsError").css("color","red")
      $("#hospitalDetailsError").html('请输入地址')
    }
  }
  function submitHospitalMessage() {
    var temp = true
    if($("#hospitalNameError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalIconError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalGradeError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalAreaError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalAddressError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalOpenError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalCloseError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalRuleError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if($("#hospitalDetailsError").css("color")=="rgb(255, 0, 0)"){
      temp=false
    }
    if (temp){
      $('#hospitalMessage').submit()
    }else {
      alert("请填写完整")
    }
  }
</script>
</body>
</html>
