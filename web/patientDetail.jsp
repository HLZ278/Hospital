<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #patientDetailContain div{
        margin: 10px;
    }
</style>
<div style="margin: 30px;">
    <font style="font-weight: 600; ">就诊人管理</font>
</div>
<div id="patientDetailContain" style="margin: 30px; width: 940px;background-color: white; border-radius: 10px">
    <div>姓名:${patient.getPatientName()}</div>
    <div>身份证号:${patient.getIdCardNum()}</div>
    <div>身份证类型:
        <c:choose>
            <c:when test="${patient.getIdCardType()==1}">居民身份证</c:when>
            <c:when test="${patient.getIdCardType()==2}">港澳居民来往内地通行证</c:when>
            <c:when test="${patient.getIdCardType()==3}">台湾居民来往大陆通行证</c:when>
            <c:when test="${patient.getIdCardType()==4}">护照</c:when>
            <c:when test="${patient.getIdCardType()==5}">外国人永久居留身份证</c:when>
            <c:when test="${patient.getIdCardType()==6}">港澳居民居住证</c:when>
            <c:when test="${patient.getIdCardType()==7}">台湾居民居住证</c:when>
            <c:otherwise><td>其他</td></c:otherwise>
        </c:choose>
    </div>
    <div>年龄:${patient.getAge()}</div>
    <div>性别:
        <c:choose>
            <c:when test="${patient.getGender()==1}">女</c:when>
            <c:when test="${patient.getGender()==2}">男</c:when>
        </c:choose>
    </div>
    <div>生日:${patient.getBirthday()}</div>
    <div>电话:${patient.getTel()}</div>
    <div>是否已婚:
        <c:choose>
            <c:when test="${patient.getMariStatus()==1}">否</c:when>
            <c:when test="${patient.getMariStatus()==2}">是</c:when>
        </c:choose>
    </div>
    <div>住址:${patient.getAddress()}</div>
    <div>是否专程来连就医:
        <c:choose>
            <c:when test="${patient.getObjective()==1}">否</c:when>
            <c:when test="${patient.getObjective()==2}">是</c:when>
        </c:choose>
    </div>
    <div>联系人姓名:${patient.getLinkName()}</div>
    <div>联系人身份证类型:
        <c:choose>
            <c:when test="${patient.getLinkidCardType()==1}">居民身份证</c:when>
            <c:when test="${patient.getLinkidCardType()==2}">港澳居民来往内地通行证</c:when>
            <c:when test="${patient.getLinkidCardType()==3}">台湾居民来往大陆通行证</c:when>
            <c:when test="${patient.getLinkidCardType()==4}">护照</c:when>
            <c:when test="${patient.getLinkidCardType()==5}">外国人永久居留身份证</c:when>
            <c:when test="${patient.getLinkidCardType()==6}">港澳居民居住证</c:when>
            <c:when test="${patient.getLinkidCardType()==7}">台湾居民居住证</c:when>
            <c:otherwise><td>其他</td></c:otherwise>
        </c:choose>
    </div>
    <div>联系人身份证号码:${patient.getLinkidCardNum()}</div>
    <div>联系人电话:${patient.getLinkTel()}</div>
    <div>毁约次数:${patient.getTimes()}</div>
    <div>封禁时间:${patient.getUnseal()}</div>
</div>
<div onclick="updatePatientShow()" style="float: left;margin: 30px; width: 400px; height: 65px; background-color: white; text-align: center; line-height: 65px; border-radius: 10px">
    <div>+ 修改就诊人信息</div>
</div>
<div onclick="deletePatient(${patient.getPatientID()})" style="float: right; margin: 30px; width: 400px; height: 65px; background-color: white; text-align: center; line-height: 65px;border-radius: 10px">
    <div>+ 删除就诊人</div>
</div>
<div style="width: 100px; height:70px;clear: both">

</div>

<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改就诊人信息</div>
        <div>
            <form id="patientUpdate" method="post" action="patientUpdate" >
                <div>
                    就诊人姓名:<input value="${patient.getPatientName()}" id="updatePatientName" type="text" name="updatePatientName" autocomplete="off" />
                </div>
                <div>
                    就诊人身份证:<input value="${patient.getIdCardNum()}" id="updatePatientIdCardNum" type="text" name="updatePatientIdCardNum" autocomplete="off" />
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
                    年龄:<input value="${patient.getAge()}" id="updatePatientAge" type="text" name="updatePatientAge" autocomplete="off" />
                </div>
                <div>
                    性别:
                    <select id="updatePatientGender" name="updatePatientGender">
                        <option value ="1">男</option>
                        <option value ="2">女</option>
                    </select>
                </div>
                <div>
                    生日:<input value="${patient.getBirthday()}" id="updatePatientBirthday" type="date" name="updatePatientBirthday" autocomplete="off" />
                </div>
                <div>
                    电话:<input value="${patient.getTel()}" id="updatePatientTel" type="text" name="updatePatientTel" autocomplete="off" />
                </div>
                <div>
                    是否已婚:
                    <select id="updatePatientMarry" name="updatePatientMarry">
                        <option value ="1">否</option>
                        <option value ="2">是</option>
                    </select>
                </div>
                <div>
                    住址:<input value="${patient.getAddress()}" id="updatePatientAddress" type="text" name="updatePatientAddress" autocomplete="off" />
                </div>
                <div>
                    是否专程来连就医:
                    <select id="updatePatientObjective" name="updatePatientObjective">
                        <option value ="1">否</option>
                        <option value ="2">是</option>
                    </select>
                </div>
                <div>
                    联系人姓名:<input value="${patient.getLinkName()}" id="updatePatientLinkName" type="text" name="updatePatientLinkName" autocomplete="off" />
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
                    联系人身份证号码:<input value="${patient.getLinkidCardNum()}" id="updatePatientLinkIdCardNum" type="text" name="updatePatientLinkIdCardNum" autocomplete="off" />
                </div>
                <div>
                    联系人电话:<input value="${patient.getLinkTel()}" id="updatePatientLinkTel" type="text" name="updatePatientLinkTel" autocomplete="off"/>
                </div>
                <input type="text" style="display: none" name="patientID" value="${patient.getPatientID()}"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updatePatientConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updatePatientCancle()">No</button>
        </div>
    </div>
</div>