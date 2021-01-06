<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css"  rel="stylesheet" href="<%=request.getContextPath() %>/css/head.css">
<script>
	window.onload=function(){
		let sz=new Array();
		var cur_ul=document.getElementById("banner");
		for(let i=1;i<=5;i++){
			var cur_li=document.createElement("li");
			var cur_img=document.createElement("img");
			
			cur_img.src="images/"+ i + ".jpg";
			cur_img.style.width="400px";
			cur_img.style.height="200px";
			cur_li.appendChild(cur_img);
			sz.push(cur_li);
			sz[sz.length-1].style.left="0px";
			
			let len=sz.length-1;
			sz[len-2].style.left="0px";
			sz[len-1].style.zIndex=100;
			sz[len-1].style.left="200px";
			sz[len-1].style.transform="scale(1.3)";
		}
	}
</script>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="head.jsp">
 <jsp:param name="title" value="首页"/>
</jsp:include>
<!-- 轮播 -->

	<ul id="banner"></ul>



</body>
</html>
