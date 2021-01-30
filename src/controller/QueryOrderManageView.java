package controller;

import com.alibaba.fastjson.JSON;
import entity.NumSrcView;
import entity.Order;
import entity.OrderManageView;
import entity.User;
import service.NumSrcServiceImpl;
import service.NumSrcViewServiceImpl;
import service.OrderManageViewServiceImpl;
import service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

//controller层
@WebServlet("/queryOrderManageView")
public class QueryOrderManageView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //window.location.href="queryNumSrc?page="+0+"&current="+5+"&departmentID="+departmentID+"&doctorID="+doctorID
        User user = (User) req.getSession().getAttribute("user");
        int userID = user.getUserID();
        OrderManageViewServiceImpl orderManageViewService = new OrderManageViewServiceImpl();
        List<OrderManageView> list = orderManageViewService.queryByUserID(userID);
        req.setAttribute("orderManageViews", list);
        req.getRequestDispatcher("patientManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
