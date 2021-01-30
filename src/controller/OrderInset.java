package controller;

import entity.Order;
import entity.Patient;
import entity.User;
import service.NumSrcServiceImpl;
import service.OrderServiceImpl;
import service.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

//controller层
@WebServlet("/orderInsert")
public class OrderInset extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //先在号源的剩余数量上减一，如果原来是0,dao层会判断从而不减
        int numSrcID = Integer.parseInt(req.getParameter("numSrcID"));
        NumSrcServiceImpl numSrcService = new NumSrcServiceImpl();
        //如果成功减掉result返回1，否则返回0,返回0的话直接return，结束servlet而不进行添加订单
        int result = numSrcService.subtract(numSrcID);
        if (result!=0){
            Order order = new Order();
            order.setPatientID(Integer.parseInt(req.getParameter("patientID")));
            order.setSignalSrcID(Integer.parseInt(req.getParameter("numSrcID")));
            OrderServiceImpl orderService = new OrderServiceImpl();
            orderService.insert(order);
            resp.sendRedirect("queryOrderManageView?current="+2);
        }else {
            String ctxPath = req.getContextPath();
            resp.getWriter().println("手慢啦，没抢过别人，请返回");
            //resp.setHeader("refresh", "3;url=" + ctxPath + "/login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
