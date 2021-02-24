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
        //检查预约时间是否是12小时以上
        boolean isNotTimeout = numSrcService.checkTime(signalSrcID);
        if (isNotTimeout){
            orderService.cancle(orderID);
            numSrcService.cancleOrder(signalSrcID);
            req.getRequestDispatcher("queryOrderManageView").forward(req, resp);
        }else {
            resp.getWriter().print("距就诊日12小时，无法取消，等待3秒自动跳回...");
            resp.setHeader("refresh", "3;url=queryOrderManageView?current=2");
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
