package controller;

import service.DepartmentService;
import service.DepartmentServiceImpl;
import service.NumSrcServiceImpl;
import service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/cancleOrder")
public class CancleOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        int signalSrcID = Integer.parseInt(req.getParameter("signalSrcID"));
        OrderServiceImpl orderService = new OrderServiceImpl();
        NumSrcServiceImpl numSrcService = new NumSrcServiceImpl();
        orderService.cancle(orderID);
        numSrcService.cancleOrder(signalSrcID);
        req.getRequestDispatcher("queryOrderManageView").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
