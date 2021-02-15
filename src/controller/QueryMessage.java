package controller;

import entity.Message;
import entity.User;
import service.MessageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/queryMessage")
public class QueryMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");
        int userID = user.getUserID();
        int page = Integer.parseInt(req.getParameter("page"));
        MessageServiceImpl messageService = new MessageServiceImpl();
        List<Message> messages = messageService.queryAll(page);
        int count = messageService.countAllMessage();
        int pageCount = (count/14)+1;
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nowPage", page);
        req.setAttribute("messages", messages);
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
