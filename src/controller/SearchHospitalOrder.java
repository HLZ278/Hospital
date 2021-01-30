package controller;

import entity.OrderManageView;
import entity.User;
import service.OrderManageViewServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//controller层
@WebServlet("/searchHospitalOrder")
public class SearchHospitalOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //window.location.href="queryNumSrc?page="+0+"&current="+5+"&departmentID="+departmentID+"&doctorID="+doctorID
        User user = (User) req.getSession().getAttribute("user");
        int hospitalID = user.getHospitalID();
        OrderManageViewServiceImpl orderManageViewService = new OrderManageViewServiceImpl();
        int status = Integer.parseInt(req.getParameter("status"));
        List<OrderManageView> list = orderManageViewService.queryByHopitalID(hospitalID, status);
        req.setAttribute("orderManageViews", list);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
