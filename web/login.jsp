<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/popWindow.css">
    <script src="js/login.js"></script>
    
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<%--网页头部--%>
<div>
    <jsp:include page="headLogined.jsp"></jsp:include>
</div>
<div class="bgGradient">
    <div class="loginBox">
        <div class="boxLeft">
            <svg t="1609896900733" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 p-id="572" xmlns:xlink="http://www.w3.org/1999/xlink" width="200" height="200">
                <defs>
                    <style type="text/css">
                    </style>
                </defs>
                <path d="M517.2 149.2c8.5-16.4 26.3-28.9 48-12.3l115.1 114.8c13.8 15 18.3 42.3 0.1 63.2L596 399.6h-0.6V266H441.8v138.9l-92.4-94c-17.5-22-10.3-46.2 5-61.9L464 140.8c17.2-15.6 39.9-16.2 53.2 8.4zM876.1 514c16.4-8.5 28.9-26.3 12.3-48L773.6 350.9c-15-13.8-42.3-18.3-63.2-0.1L622 440.5h139v154.9H626.4l87.9 86.4c22 17.5 46.2 10.3 61.9-5l108.2-109.6c15.7-17.1 16.2-39.8-8.3-53.2zM149.1 508.2c-16.4-8.5-28.9-26.3-12.3-48l114.8-115.1c15-13.8 42.3-18.3 63.2-0.1l84.3 84H266.7v154.9h138L310.9 676c-22 17.5-46.2 10.3-61.9-5L140.8 561.3c-15.7-17-16.2-39.7 8.3-53.1zM510.8 875.6c8.5 16.4 26.3 28.9 48 12.3l115.1-114.8c13.8-15 18.3-42.3 0.1-63.2l-90.4-88.3v138.1H430.8v-135L343 713.9c-17.5 22-10.3 46.2 5 61.9L457.7 884c17 15.7 39.8 16.2 53.1-8.4z"
                      fill="#E50012" p-id="573">
                </path>
            </svg>
        </div>
        <div class="boxRight">
            <div style="margin-top: 30px" class="registTitle"><font>LOGIN</font></div>
            <form id="loginForm" action="${pageContext.request.contextPath}/doLogin" method="post" style="margin-top: 20px">
                <div class="registInput">
                    <div class="registIcon">
                        <svg t="1609989203051" class="icon" viewBox="0 0 1024 1024" version="1.1"
                             xmlns="http://www.w3.org/2000/svg" p-id="2092" xmlns:xlink="http://www.w3.org/1999/xlink"
                             width="20" height="20">
                            <defs>
                                <style type="text/css"></style>
                            </defs>
                            <path d="M511.913993 941.605241c-255.612968 0-385.311608-57.452713-385.311608-170.810012 0-80.846632 133.654964-133.998992 266.621871-151.88846L393.224257 602.049387c-79.986561-55.904586-118.86175-153.436587-118.86175-297.240383 0-139.33143 87.211154-222.586259 233.423148-222.586259l7.912649 0c146.211994 0 233.423148 83.254829 233.423148 222.586259 0 54.184445 0 214.67361-117.829666 297.412397l-0.344028 16.685369c132.966907 18.061482 266.105829 71.041828 266.105829 151.716445C897.225601 884.152528 767.526961 941.605241 511.913993 941.605241zM507.957668 141.567613c-79.470519 0-174.250294 28.382328-174.250294 163.241391 0 129.698639 34.230808 213.469511 104.584579 255.784982 8.944734 5.332437 14.277171 14.965228 14.277171 25.286074l0 59.344868c0 15.309256-11.524945 28.0383-26.662187 29.414413-144.319839 14.449185-239.959684 67.429531-239.959684 95.983874 0 92.199563 177.346548 111.637158 325.966739 111.637158 148.792206 0 325.966739-19.26558 325.966739-111.637158 0-28.726356-95.639845-81.534688-239.959684-95.983874-15.48127-1.548127-27.006215-14.621199-26.662187-30.102469l1.376113-59.344868c0.172014-10.148833 5.676466-19.437594 14.277171-24.770032 70.525785-42.487485 103.208466-123.678145 103.208466-255.784982 0-135.031077-94.779775-163.241391-174.250294-163.241391L507.957668 141.567613 507.957668 141.567613z"
                                  p-id="2093"></path>
                        </svg>
                    </div>
                    <input id="userName" name="userName" type="text" autocomplete="off" placeholder="点击输入用户名"
                           onblur="checkName()"/>
                    <div class="userError" style="visibility: hidden;">用户名不正确</div>

                </div>
                <div style="margin: auto; margin-top: 10px" class="registInput">
                    <div class="registIcon">
                        <svg t="1609990051100" class="icon" viewBox="0 0 1024 1024" version="1.1"
                             xmlns="http://www.w3.org/2000/svg" p-id="4122" xmlns:xlink="http://www.w3.org/1999/xlink"
                             width="20" height="20">
                            <defs>
                                <style type="text/css"></style>
                            </defs>
                            <path d="M791.366 459.07l-459.174-0.791c-0.186-61.936-16.847-157.926 36.027-216.192 32.142-35.52 86.326-72.068 144.127-72.068 85.395 0 149.246 64.412 180.166 144.126 9.009 22.992 16.936 35.38 36.037 36.037 47.899 1.45 44.986-49.075 36.029-72.067C719.914 163.03 636.118 97.953 512.346 97.953c-84.12 0-130.475 17.265-180.154 72.065-76.009 83.746-72.259 219.151-72.067 288.26l-26.795 0.791c-25.045 0-45.273 20.034-45.273 44.667v378.249c0 24.774 20.269 44.755 45.273 44.755h557.99c25.009 0 45.273-19.989 45.273-44.755V503.737c0.046-24.678-20.218-44.667-45.227-44.667zM765.68 818.35c0 9.966-3.476 18.514-10.58 25.52-7.045 7.051-15.56 10.58-25.517 10.58H296.362c-9.966 0-18.472-3.478-25.475-10.58-7.051-7.049-10.624-15.553-10.624-25.52V565.635c0-19.878 16.166-36.054 36.098-36.054h433.212c19.932 0 36.107 16.176 36.107 36.054V818.35z"
                                  fill="" p-id="4123"></path>
                        </svg>
                    </div>
                    <input name="userPwd" type="password" autocomplete="off" placeholder="点击输入密码" onclick="clearError()"/>
                    <c:choose>
                        <c:when test="${requestScope.msgg == 1}">
                            <div style="visibility:visible" class="pwdError">密码错误</div>
                        </c:when>
                        <c:otherwise>
                            <div style="visibility:hidden" class="pwdError">密码错误</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="" style="margin-top: 20px; margin-left: 60px">
                    <input type="text" placeholder="请输入验证码" style="border: 1px solid #ccc;margin-top:4px;float:left;width:150px; height:40px;border-radius: 5px;" id ="text">
                    <canvas id="canvas" width="90" height="40px" onclick="dj()" style="margin-left:10px;border: 1px solid #ccc; float:left; border-radius: 5px;"></canvas>
                </div>
                <div class="loginBtn" style="margin-top: 90px">
                    <button onclick="doLogin()" type="button">登录</button>
                </div>
            </form>
            <div class="registA">
                <a href="regist.jsp">注册</a>
            </div>
        </div>
    </div>
</div>
<div style="">
    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
<script>
    function doLogin() {
        if (sublim()){
            $.ajax({
                type:"get",
                url:"findUser",
                data:{"userName": $("#userName").val()},
                dataType:"text",
                success:function(data){
                    if("true" === data){
                        $("#loginForm").submit()
                        draw(show_num);
                    }else {
                        alert("请检查您的用户名或密码")
                        draw(show_num);
                    }
                },
            });
        }
    }
    var show_num = [];
    draw(show_num);
    function dj(){
        draw(show_num);
    }
    function sublim(){
        var val=document.getElementById("text").value;
        var num = show_num.join("");
        if(val==''){
            alert('请输入验证码！');
            draw(show_num);
            return false
        }else if(val == num){
            return true
            draw(show_num);

        }else{
            alert('验证码错误！\n你输入的是:  '+val+"\n正确的是:  "+num+'\n请重新输入！');
            return false
            draw(show_num);
        }



    }
    function draw(show_num) {
        var canvas_width=document.getElementById('canvas').clientWidth;
        var canvas_height=document.getElementById('canvas').clientHeight;
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt;
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }
    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
</script>
</html>