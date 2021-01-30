<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="font-weight: 600; margin: 20px">
    挂号订单
</div>
<div style="margin-top: 20px;margin-left: 25px">
    订单状态：
    <select id="orderStatus">
        <option value="0">全部</option>
        <option value="1">预约中</option>
        <option value="2">已履约</option>
        <option value="3">已取消</option>
        <option value="4">爽约</option>
    </select>
    <button onclick="searchOrder()">查询</button>
</div>
<div>
    <table width="900px" style="margin: 30px"  border="1" cellspacing="0">
        <tr style="text-align: center">
            <th>就诊人</th>
            <th>医院名</th>
            <th>科室</th>
            <th>医生</th>
            <th>上班时间</th>
            <th>下班时间</th>
            <th>挂号日期</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach var="orderManageView" items="${ orderManageViews }">
            <tr style="text-align: center">
                <td>${orderManageView.getPatientName()}</td>
                <td>${orderManageView.getHospitalName()}</td>
                <td>${orderManageView.getDepartmentName()}</td>
                <td>${orderManageView.getDoctorName()}</td>
                <td>${orderManageView.getWorkTime()}</td>
                <td>${orderManageView.getCloseTime()}</td>
                <td>${orderManageView.getContractTime()}</td>

                <c:choose>
                    <c:when test="${orderManageView.getOrderStatus()==1}"><td>预约中</td></c:when>
                    <c:when test="${orderManageView.getOrderStatus()==2}"><td>已履约</td></c:when>
                    <c:when test="${orderManageView.getOrderStatus()==3}"><td>已取消</td></c:when>
                    <c:when test="${orderManageView.getOrderStatus()==4}"><td>爽约</td></c:when>
                </c:choose>
                <td>
                    <c:choose>
                        <c:when test="${orderManageView.getOrderStatus()==1}">
                            <a href="JavaScript:cancleOrder('${orderManageView.getOrderID()}','${orderManageView.getSignalSrcID()}')">取消预约</a>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>