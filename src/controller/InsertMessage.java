package controller;

import entity.Message;
import entity.Notice;
import entity.User;
import service.MessageServiceImpl;
import service.NoticeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet("/insertMessage")
public class InsertMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Message message = new Message();
        User user = (User) req.getSession().getAttribute("user");
        message.setUserID(user.getUserID());
        message.setTitle((String) req.getParameter("title"));
        message.setContent((String) req.getParameter("content"));
        message.setCreateTime(new Date(System.currentTimeMillis()));
        MessageServiceImpl messageService = new MessageServiceImpl();
        messageService.insertNotice(message);
        resp.sendRedirect("queryMessageByUserID?page=0&current=3");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
