package controller;

import entity.Notice;
import entity.OrderManageView;
import entity.User;
import service.NoticeServiceImpl;
import service.OrderManageViewServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/searchNotice")
public class SearchNotice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String noticeTitle = req.getParameter("noticeTitle");
        NoticeServiceImpl noticeService = new NoticeServiceImpl();
        List<Notice> notices = noticeService.queryByName(noticeTitle);
        req.setAttribute("notices", notices);
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}