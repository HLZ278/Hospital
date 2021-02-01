package controller;

import entity.OrderManageView;
import service.OrderManageViewServiceImpl;
import service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/searchOrderByID")
public class SearchOrderByID extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        if(req.getParameter("orderID")==null||req.getParameter("orderID").equals("")){
            req.getRequestDispatcher("queryHospitalOrderManageView").forward(req, resp);
            return;
        }
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        OrderManageViewServiceImpl orderManageViewService = new OrderManageViewServiceImpl();
        List<OrderManageView> list = orderManageViewService.queryByOrderID(orderID);
        req.setAttribute("orderManageViews", list);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
