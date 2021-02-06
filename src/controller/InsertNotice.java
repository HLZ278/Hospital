package controller;

import entity.Doctor;
import entity.Notice;
import entity.NumSrc;
import service.DoctorService;
import service.DoctorServiceImpl;
import service.NoticeServiceImpl;
import service.NumSrcServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@WebServlet("/insertNotice")
public class InsertNotice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Notice notice = new Notice();
        notice.setTitle((String) req.getParameter("noticeTitle"));
        notice.setContent((String) req.getParameter("noticeContent"));
        notice.setCreateTime(new Timestamp(System.currentTimeMillis()));
        NoticeServiceImpl noticeService = new NoticeServiceImpl();
        noticeService.insertNotice(notice);
        resp.sendRedirect("queryAllNotice?page="+0+"&current="+4);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
