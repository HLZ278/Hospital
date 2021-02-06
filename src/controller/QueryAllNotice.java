package controller;

import entity.Notice;
import service.DepartmentService;
import service.DepartmentServiceImpl;
import service.NoticeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/queryAllNotice")
public class QueryAllNotice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NoticeServiceImpl noticeService = new NoticeServiceImpl();
        List<Notice> notices = noticeService.queryAll();
        req.setAttribute("notices", notices);
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}