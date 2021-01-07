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
          <form class="registFrom" style=" width: 400px">
              <div class="fontText" style="margin-top: 10px;">
                请输入用户名:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                <input type="text" autocomplete="off" placeholder="点击输入用户名"/>
              </div>
              <div class="fontText" style="margin-top: 30px;">
                  请输入密码:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                  <input type="text" autocomplete="off" placeholder="点击输入密码"/>
              </div>
              <div class="fontText" style="margin-top: 30px;">
                  确认密码:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                  <input type="text" autocomplete="off" placeholder="点击再次输入密码"/>
              </div>
              <div class="fontText" style="margin-top: 28px;">
                  手机号:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                  <input type="text" autocomplete="off" placeholder="点击输入手机号"/>
              </div>
              <div class="fontText" style="margin-top: 28px;">
                  真实姓名:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                  <input type="text" autocomplete="off" placeholder="点击输入真实姓名"/>
              </div>
              <div class="fontText" style="margin-top: 28px;">
                  身份证类型:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px; border-bottom: none; margin-top: 10px" class="registInput">

                  <select style="border: none; border-bottom: 1px solid rgba(0,0,0,0.2); width: 250px; color: #828282">
                      <option value ="volvo">居民身份证</option>
                      <option value ="saab">港澳居民来往内地通行证</option>
                      <option value="opel">台湾居民来往大陆通行证</option>
                      <option value="audi">护照</option>
                      <option value="audi">外国人永久居留身份证</option>
                      <option value="audi">港澳居民居住证</option>
                      <option value="audi">台湾居民居住证</option>
                  </select>
              </div>
              <div class="fontText" style="margin-top: 28px">
                  身份证号码:
              </div>
              <div style="float: right; margin-right: 40px; margin-bottom: 10px" class="registInput">
                  <input type="text" autocomplete="off" placeholder="点击输入身份证号"/>
              </div>
              <div class="loginBtn"style="">
                  <button type="submit" style="width: 360px;margin-top: 30px">注册</button>
              </div>
          </form>
        </div>
      </div>
    </div>
    <div style="">
      <jsp:include page="footer.jsp"></jsp:include>
    </div>
  </body>
</html>
