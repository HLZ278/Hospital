package controller;

import service.NumSrcServiceImpl;
import service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/completeOrBreakOrder")
public class CompleteOrBreakOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        int completeOrBreak = Integer.parseInt(req.getParameter("completeOrBreak"));
        OrderServiceImpl orderService = new OrderServiceImpl();
        if (completeOrBreak==1){
            orderService.completeOrder(orderID);
        }else {
            orderService.breakOrder(orderID);
        }
        req.getRequestDispatcher("queryHospitalOrderManageView").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
