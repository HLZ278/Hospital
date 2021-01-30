
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top: 20px;margin-left: 20px">
    <font style="font-weight: 600;font-size: 23px">${hospital.getHospitalName()}</font> <font style="color:grey;margin-left: 20px">${hospital.getGrade()}</font>
</div>
<div style="margin-left: 20px; margin-top: 10px">
    <div style="float: left"><img src="images/hospital1.png" style="width: 80px; height: 80px">
    </div>
    <div style="float: left">
        <font style=" margin-left: 20px">医院详情:</font>
        <div>
            <font style="font-size: 15px; color: grey; margin-left: 20px">医院地点:</font>
            <font style=" color: grey;font-size: 15px; margin-left: 10px">${hospital.getAddress()}</font>
        </div>
        <div>
            <font style=" color: grey; margin-left: 20px; font-size: 15px">挂号须知:</font>
            <font style=" color: grey;font-size: 15px; margin-left: 10px">${hospital.getRule()}</font>
        </div>
    </div>
</div>
<div style="float:left;margin: 20px;margin-top: 10px; width: 960px; height: 400px; margin-top: 50px">
    <div style="font-weight: 600;">选择科室:</div>
    <c:forEach var="key" items="${departmentMapKey}">
        <div style="margin-top: 20px">
            ${key}:
            <div style="margin-left:30px;margin-right:30px;width: 900px;word-wrap: break-word;word-break: break-all;overflow: hidden;">
                <c:forEach var="department" items="${ departmentMap.get(key) }" varStatus="status">
                    <c:choose>
                        <c:when test="${status.index!=0&&status.index%4==0}">
                            <div style="float:left;min-width: 150px"><a href="#" onclick="numSrcOrder(${department.getDepartmentID()})">${department.getDepartmentName()}</a></div>
                            <br/>
                        </c:when>
                        <c:otherwise>
                            <div style="float:left;min-width: 150px"><a href="#" onclick="numSrcOrder(${department.getDepartmentID()})">${department.getDepartmentName()}</a></div>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>

            </div>
        </div>
    </c:forEach>
</div>