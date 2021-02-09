<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #patientCon div{
        margin: 10px;
    }
    form div{
        margin:10px;
    }
    form{
    }
</style>
<div style="margin: 30px;">
    <font style="font-weight: 600; ">就诊人管理</font>
</div>
<c:forEach var="patient" items="${ patients }">
    <div id="patientCon" style="margin: 30px; width: 940px; height: 130px; background-color: white; border-radius: 10px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2);
">
        <div>${patient.patientName}</div>
        <div>身份证号:${patient.idCardNum}</div>
        <div>身份证类型:
            <c:choose>
                <c:when test="${patient.idCardType==1}">居民身份证</c:when>
                <c:when test="${patient.idCardType==2}">港澳居民来往内地通行证</c:when>
                <c:when test="${patient.idCardType==3}">台湾居民来往大陆通行证</c:when>
                <c:when test="${patient.idCardType==4}">护照</c:when>
                <c:when test="${patient.idCardType==5}">外国人永久居留身份证</c:when>
                <c:when test="${patient.idCardType==6}">港澳居民居住证</c:when>
                <c:when test="${patient.idCardType==7}">台湾居民居住证</c:when>
                <c:otherwise><td>其他</td></c:otherwise>
            </c:choose>
        </div>
        <div style="float: left; margin-top: 0">年龄:${patient.age}</div>
        <div><a href="#" onclick="patientDetail(${patient.patientID})" class="patientDetail" style="float: right">查看详情 ></a></div>
    </div>
</c:forEach>
<div onclick="addPatient()" style="margin: 30px; width: 940px; height: 65px; background-color: white; text-align: center; line-height: 65px; border-radius: 10px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
    <div>+ 添加就诊人</div>
</div>

<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">添加就诊人</div>
        <div>
            <form id="patientInsert" method="post" action="patientInsert" >
                <div>
                    就诊人姓名:<input  id="updatePatientName" type="text" name="updatePatientName" autocomplete="off" />
                </div>
                <div>
                    就诊人身份证:<input  id="updatePatientIdCardNum" type="text" name="updatePatientIdCardNum" autocomplete="off" />
                </div>
                <div>
                    就诊人身份证类型:<select id="updatePatientIDCardType" name="updatePatientIDCardType">
                    <option value ="1">居民身份证</option>
                    <option value ="2">港澳居民来往内地通行证</option>
                    <option value="3">台湾居民来往大陆通行证</option>
                    <option value="4">护照</option>
                    <option value="5">外国人永久居留身份证</option>
                    <option value="6">港澳居民居住证</option>
                    <option value="7">台湾居民居住证</option>
                </select>
                </div>
                <div>
                    年龄:<input  id="updatePatientAge" type="text" name="updatePatientAge" autocomplete="off" />
                </div>
                <div>
                    性别:
                    <select id="updatePatientGender" name="updatePatientGender">
                        <option value ="1">男</option>
                        <option value ="2">女</option>
                    </select>
                </div>
                <div>
                    生日:<input  id="updatePatientBirthday" type="date" name="updatePatientBirthday" autocomplete="off" />
                </div>
                <div>
                    电话:<input  id="updatePatientTel" type="text" name="updatePatientTel" autocomplete="off" />
                </div>
                <div>
                    是否已婚:
                    <select id="updatePatientMarry" name="updatePatientMarry">
                        <option value ="1">否</option>
                        <option value ="2">是</option>
                    </select>
                </div>
                <div>
                    住址:<input  id="updatePatientAddress" type="text" name="updatePatientAddress" autocomplete="off" />
                </div>
                <div>
                    是否专程来连就医:
                    <select id="updatePatientObjective" name="updatePatientObjective">
                        <option value ="1">否</option>
                        <option value ="2">是</option>
                    </select>
                </div>
                <div>
                    联系人姓名:<input  id="updatePatientLinkName" type="text" name="updatePatientLinkName" autocomplete="off" />
                </div>
                <div>
                    联系人身份证类型:
                    <select id="updatePatientLinkIdCardType" name="updatePatientLinkIdCardType">
                        <option value ="1">居民身份证</option>
                        <option value ="2">港澳居民来往内地通行证</option>
                        <option value="3">台湾居民来往大陆通行证</option>
                        <option value="4">护照</option>
                        <option value="5">外国人永久居留身份证</option>
                        <option value="6">港澳居民居住证</option>
                        <option value="7">台湾居民居住证</option>
                    </select>
                </div>
                <div>
                    联系人身份证号码:<input  id="updatePatientLinkIdCardNum" type="text" name="updatePatientLinkIdCardNum" autocomplete="off" />
                </div>
                <div>
                    联系人电话:<input  id="updatePatientLinkTel" type="text" name="updatePatientLinkTel" autocomplete="off"/>
                </div>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="addPatientConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updatePatientCancle()">No</button>
        </div>
    </div>
</div>