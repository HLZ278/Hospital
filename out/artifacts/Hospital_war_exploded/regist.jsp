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
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/regist.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
  </head>
  <body>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%--网页头部--%>
    <div>
        <jsp:include page="headLogined.jsp"></jsp:include>
    </div>
    <div class="bgGradient">
      <div class="registBox">
        <div class="registTitle2" style="text-align: center;font-size: 30px;font-weight: 600;">
            <font>欢迎注册</font>
        </div>
        <div style="margin-left: 230px;">
          <form id="registForm" name="registForm" class="registFrom" style=" width: 550px" action="registC" method="post">
              <table>
                  <tr>
                      <td>请输入用户名:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                          <input onblur="nameBlur()" autocomplete="off" id="userName" name="userName" type="text" placeholder="仅支持英文及数字"/></div></td>
                      <td id="nameError" style="color: red">必填</td>
                  </tr>
                  <tr>
                      <td>请输入密码:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                              <input onblur="passwdBlur()" name="password" id="password1" autocomplete="off" type="password"  placeholder="6位以上，仅支持英文及数字"/>
                          </div>
                          </td>
                      <td id="passwdError" style="color: red">必填</td>
                  </tr>
                  <tr>
                      <td>确认密码:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                              <input name="password2" id="password2" onblur="passwordBlur2()"  type="password" autocomplete="off" placeholder="点击再次输入密码"/>
                          </div>
                      </td>
                      <td id="passwdConfirm" style="color: red">必填</td>
                  </tr>
                  <tr>
                      <td>手机号:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                              <input onblur="phoneBlur()" id="phone" name="phone" type="tel" autocomplete="off" placeholder="点击输入手机号"/>
                          </div>
                      </td>
                      <td id="phoneError" style="color: red">必填</td>
                  </tr>
                  <tr>
                      <td>真实姓名:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                              <input onblur="realNameBlur()" type="tel" id="realName" name="realName" autocomplete="off" placeholder="点击输入真实姓名"/>
                          </div>
                      </td>
                      <td id="realNameError" style="color: red">必填</td>
                  </tr>
                  <tr>
                      <td>身份证类型:</td>
                      <td>
                          <div style="float: right; margin-right: 40px; margin-bottom: 10px; border-bottom: none; margin-top: 10px" class="registInput">

                              <select  id="idCardType" name="idCardType"  style="border: none; border-bottom: 1px solid rgba(0,0,0,0.2); width: 250px; color: #828282">
                                  <option value ="1">居民身份证</option>
                                  <option value ="2">港澳居民来往内地通行证</option>
                                  <option value="3">台湾居民来往大陆通行证</option>
                                  <option value="4">护照</option>
                                  <option value="5">外国人永久居留身份证</option>
                                  <option value="6">港澳居民居住证</option>
                                  <option value="7">台湾居民居住证</option>
                              </select>
                          </div>
                      </td>
                      <td id="idCardTypeError"></td>
                  </tr>
                  <tr>
                      <td>身份证号码:</td>
                      <td>
                          <div  style="float: right;  margin-right: 40px; margin-bottom: 10px" class="registInput">
                              <input onblur="idCardNumBlur()" id="idCardNum" name="idCardNum"  type="text" autocomplete="off" placeholder="点击输入身份证号"/>
                          </div>
                      </td>
                      <td id="idCardNumError" style="color: red">必填</td>
                  </tr>
              </table>
              <div class="loginBtn"style="">
                  <button onclick="registSubmit()" type="button" style="width: 360px;margin-top: 30px">注册</button>
              </div>
          </form>
        </div>
      </div>
    </div>
    <div style="">
      <jsp:include page="footer.jsp"></jsp:include>
    </div>
  <script>
      function registSubmit() {
          var temp = true
          if($("#nameError").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if($("#passwdError").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if($("#phoneError").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if($("#realNameError").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if($("#idCardNumError").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if($("#passwdConfirm").css("color")=="rgb(255, 0, 0)"){
              temp=false
          }
          if (temp){
              $("#registForm").submit()
          }else {
              alert("请填写完整")
          }
      }
      function nameBlur() {
          var userName = $("#userName")[0].value
          var reg=/^[a-zA-Z0-9]{0,15}$/;
          if(reg.test(userName)==false){
              $("#nameError").css("color","red")
              $("#nameError").html('格式不正确')
          }else{
              $.ajax({
                  type:"get",
                  url:"findUser",
                  data:{"userName": $("#userName")[0].value},
                  dataType:"text",
                  success:function(data){
                      if("true" === data){
                          $("#nameError").css("color","red")
                          $("#nameError").html('用户已存在')
                      }else{
                          $("#nameError").css("color","green")
                          $("#nameError").html('用户名可用')
                      }
                  },
              });
          }
      }
      function passwdBlur() {
          var password1 = $("#password1")[0].value
          var reg=/^[a-zA-Z0-9]{5,15}$/;
          if(reg.test(password1)==false){
              $("#passwdError").css("color","red")
              $("#passwdError").html('格式不正确')
          }else{
              $("#passwdError").css("color","green")
              $("#passwdError").html('密码可用')
          }
      }
      function passwordBlur2() {
          var password1 = $("#password1")[0].value
          var password2 = $("#password2")[0].value
          if(password2!=password1){
              $("#passwdConfirm").css("color","red")
              $("#passwdConfirm").html('密码不一致')
          }else {
              $("#passwdConfirm").css("color","green")
              $("#passwdConfirm").html('')
          }

      }
      function phoneBlur() {
          var phone = $("#phone")[0].value
          if(!phone.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/)){
              $("#phoneError").css("color","red")
              $("#phoneError").html('手机号格式错误')
          }else{
              $("#phoneError").css("color","green")
              $("#phoneError").html('')
          }//^[\u4e00-\u9fa5]{2,4}$
      }
      function realNameBlur() {
          var realName = $("#realName")[0].value
          if(!realName.match(/^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\s]{1,20})$/)){
              $("#realNameError").css("color","red")
              $("#realNameError").html('请输入正确姓名')
          }else{
              $("#realNameError").css("color","green")
              $("#realNameError").html('')
          }
      }
      function idCardNumBlur() {
          var idCardNum = $("#idCardNum")[0].value
          if(!idCardNum.match(/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}[0-9Xx]$)/)){
              $("#idCardNumError").css("color","red")
              $("#idCardNumError").html('格式不对')
          }else{
              $("#idCardNumError").css("color","green")
              $("#idCardNumError").html('')
          }
      }
  </script>
  </body>
</html>
