<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div style="margin: 30px;">
    <font style="font-weight: 600; ">个人信息管理</font>
</div>
<style>
    #personContaine div{
        margin:20px;
    }
    form div{
        margin:20px;
    }
</style>
<div id="personContaine" style="padding:1px;margin: 30px;width: 940px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
    <div >用户名：${user.getUserName()}</div>
    <div>密码：******</div>
    <div>电话：${user.getUserTel()}</div>
    <div>真实姓名：${user.getRealName()}</div>
    <div>身份证类型：
        <c:choose>
            <c:when test="${user.getIdCardType()==1}">居民身份证</c:when>
            <c:when test="${user.getIdCardType()==2}">港澳居民来往内地通行证</c:when>
            <c:when test="${user.getIdCardType()==3}">台湾居民来往大陆通行证</c:when>
            <c:when test="${user.getIdCardType()==4}">护照</c:when>
            <c:when test="${user.getIdCardType()==5}">外国人永久居留身份证</c:when>
            <c:when test="${user.getIdCardType()==6}">港澳居民居住证</c:when>
            <c:when test="${user.getIdCardType()==7}">台湾居民居住证</c:when>
            <c:otherwise><td>其他</td></c:otherwise>
        </c:choose>
    </div>
    <div>身份证号：${user.getIdCardNum()}</div>
    <div>注册日期：${user.getRegisteDate()}</div>
</div>
<div onclick="updateUserDetail()" style="margin:20px;margin-left: 30px; width: 940px; height:80px; background-color: white; text-align: center; line-height: 80px; border-radius: 10px;box-shadow: 0px 0px 10px rgba(128, 128, 128, 0.2)">
    点击修改
</div>
<div id="updateBox" class="popup__wrapper" style="display: none">
    <div class="popup">
        <div class="popup__title">修改个人信息</div>
        <div>
            <form id="personUpdate" method="post" action="personUpdate" >
                <div>
                    用户名：<input value="${user.getUserName()}" type="text" name="updateUserName" autocomplete="off" />
                </div>
                <div>
                    密码：<input value="${user.getUserPwd()}" type="password" name="updateUserPwd" autocomplete="off" />
                </div>
                <div>
                    电话:<input value="${user.getUserTel()}" type="number" name="updateUserTel" autocomplete="off" />
                </div>
                <div>
                    真实姓名：<input value="${user.getRealName()}" type="text" name="updateUserRealName" autocomplete="off" />
                </div>
                <div>
                    身份证类型：
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
                    身份证号：<input value="${user.getIdCardNum()}"  type="text" name="updateUserIDNum" autocomplete="off" />
                </div>

                <input type="text" style="display: none" name="updateUserID" value="${user.getUserID()}"/>
            </form>
        </div>
        <div class="popup__btnWrapper">
            <button class="popup__yesBtn"  onclick="updateUserConfirm()">Yes</button>
            <button class="popup__noBtn" onclick="updatePatientCancle()">No</button>
        </div>
    </div>
</div>