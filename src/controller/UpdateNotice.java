package controller;

import entity.Hospital;
import entity.Notice;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.NoticeServiceImpl;
import utils.StringToTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/updateNotice")
public class UpdateNotice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Notice notice = new Notice();
        notice.setTitle(req.getParameter("noticeTitle"));
        notice.setContent(req.getParameter("noticeContent"));
        notice.setNoticeID(Integer.parseInt(req.getParameter("noticeID")));
        NoticeServiceImpl noticeService = new NoticeServiceImpl();
        noticeService.updateNotice(notice);
        resp.sendRedirect("queryAllNotice?page="+0+"&current="+4);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
