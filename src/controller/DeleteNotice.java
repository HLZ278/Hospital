package controller;

import service.DoctorService;
import service.DoctorServiceImpl;
import service.NoticeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/deleteNotice")
public class DeleteNotice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int noticeID = Integer.parseInt(req.getParameter("noticeID"));
        NoticeServiceImpl noticeService = new NoticeServiceImpl();
        noticeService.deleteNotice(noticeID);
        resp.sendRedirect("queryAllNotice?page="+0+"&current="+4);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
