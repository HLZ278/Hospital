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
@WebServlet("/queryHospitalOrderManageView")
public class QueryHospitalOrderManageView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");
        String page = req.getParameter("page");
        int hospitalID = user.getHospitalID();
        OrderManageViewServiceImpl orderManageViewService = new OrderManageViewServiceImpl();
        List<OrderManageView> list = orderManageViewService.queryByHopitalID(hospitalID, page);
        int count = orderManageViewService.countDepartment(hospitalID);
        int pageCount = (count/14)+1;
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nowPage", page);
        req.setAttribute("orderManageViews", list);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
